#!/bin/bash -x

./delete.sh
./prune.sh
./create.sh
./scaledown.sh
./scaleup.sh
