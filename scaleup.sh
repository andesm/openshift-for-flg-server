#!/bin/bash -x

oc scale deploymentconfig --replicas=1 fx-system-trade-backtest-latest
oc scale deploymentconfig --replicas=1 fx-system-trade-backtest
oc scale deploymentconfig --replicas=1 fx-system-trade-trade-practice
