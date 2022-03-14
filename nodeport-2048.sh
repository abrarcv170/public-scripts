#!/bin/bash
podname=$(kubectl get pod -n game  |  awk 'FNR ==2 {print $1}')
hostip=$(kubectl get  pod $podname -n game -o  custom-columns=NAME:status.hostIP | awk 'FNR ==2 {print $1}')
nodeport=$(kubectl get svc game-2048  -n game  -o custom-columns=NAME:spec.ports[0].nodePort | awk 'FNR ==2 {print $1}')
echo "connect using http://${hostip}:${nodeport}"
