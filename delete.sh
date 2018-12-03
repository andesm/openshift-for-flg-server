#!/bin/bash -x

oc delete -f openshift.yml
oc delete -f openshift-django.yml
oc delete -f openshift-fx-system-trade.yml
