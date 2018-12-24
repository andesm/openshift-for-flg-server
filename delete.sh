#!/bin/bash -x

oc delete -f openshift-for-flg-server.yml
oc delete -f openshift-django.yml
oc delete -f openshift-fx-system-trade.yml
