#!/bin/bash -x

oc create -f openshift.yml
oc create -f openshift-django.yml
oc create -f openshift-fx-system-trade.yml
