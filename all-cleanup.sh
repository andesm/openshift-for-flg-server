#!/bin/bash -x

./delete.sh
oc get pods | egrep 'No resources found.'
while [ $? = 0 ]
do
    sleep 5
    oc get pods | grep 'fx-system-trade.*Terminating'
done
./prune.sh
./create.sh
./scaledown.sh
./scaleup.sh
