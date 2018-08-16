#!/bin/bash
# This script checks witch one env is Production
# Autor : Amanda Quinto

#The blue env always appoint to Production URL #
#The Green env always appoint to Green URL #

# ENVIRONMENT blue
declare -a svc=()

for i in ${!svc[*]}; do
  which=`kubectl get svc/${svc[$i]} -o yaml | grep app: | cut -d: -f 2 | tr -d ' '| tail -1`;
  echo $which;
  kubectl patch deployment/$which -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"
done
