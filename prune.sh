#/bin/bash -x
oc adm prune builds --orphans=true --confirm=true
oc adm prune images --all=true --confirm=true
oc adm prune deployments --orphans=true --confirm=true
