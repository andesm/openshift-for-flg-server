
#!/bin/bash -x

rsync -avu --delete --exclude=docker-compose.d . jin:docker-for-flg-server
#rsync -avu --delete --exclude=docker-compose.d . openshift@openshift:docker-for-flg-server

