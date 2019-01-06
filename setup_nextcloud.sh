#!/bin/bash -x

postgres=$(oc get pods |grep 'postgres.*Running'| awk '{print $1}')
oc exec -it ${postgres} -- dropdb -U postgres nextcloud
sudo sed -i -e "s/'installed' => true,/'installed' => false,/" /flg/openshift/srv/nextcloud/config/config.php
nextcloud=$(oc get pods |grep 'nextcloud.*Running'| awk '{print $1}')
oc exec ${nextcloud} -- apt-get update
oc exec ${nextcloud} -- apt-get -y install sudo 
oc exec ${nextcloud} -- sudo -u www-data php occ  maintenance:install --database "pgsql" --database-name "nextcloud"  --database-host "postgres" --database-user "postgres" --database-pass "postgres" --admin-user "andesm" --admin-pass "andesm123"
sudo sed -i -e "/0 => 'localhost'/a \    1 => 'flg.jp'," /flg/openshift/srv/nextcloud/config/config.php
sudo sed -i -e '/#### DO NOT CHANGE ANYTHING ABOVE THIS LINE ###/,//d' /flg/openshift/srv/nextcloud/.htaccess
oc exec ${nextcloud} -- sudo -u www-data env OC_PASS=andesm123 php occ user:add --password-from-env lily
oc exec ${nextcloud} -- sudo -u www-data php occ files:scan --all

