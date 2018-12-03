#!/bin/bash -x

oc start-build wordpress-lily
oc start-build wordpress-flg
oc start-build nextcloud-flg
oc start-build get-rate
oc start-build django-for-flg-server
