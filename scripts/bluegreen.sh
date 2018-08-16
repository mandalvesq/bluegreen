#!/bin/bash
# This script makes the change for env blue to green and contrariwise
# Autor : Amanda Quinto

# ENVIRONMENT blue
declare -a svc=()

# ENVIRONMENT Green
declare -a svc2=()

# checa qual ambiente é blue e qual é green para o chaveamento
for i in ${!svc[*]}; do
  green=`kubectl get svc/${svc[$i]} -o yaml | grep app: | cut -d: -f 2 | tr -d ' ' | tail -1`;
  echo $green;
  blue=`kubectl get svc/${svc2[$i]} -o yaml | grep app: | cut -d: -f 2| tr -d ' '| tail -1 `;
  echo $blue;
  green=`kubectl get svc/${svc[$i]} -o yaml | grep app: | cut -d: -f 2 | tr -d ' ' | tail -1`;
  blue=`kubectl get svc/${svc2[$i]} -o yaml | grep app: | cut -d: -f 2| tr -d ' '| tail -1`;
  kubectl patch svc ${svc[$i]} -p "{\"spec\":{\"selector\": {\"app\": \"${blue}\"}}}";
  kubectl patch svc ${svc2[$i]} -p "{\"spec\":{\"selector\": {\"app\": \"${green}\"}}}";
done
