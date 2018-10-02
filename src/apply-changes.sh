#!/usr/bin/env sh

echo kubectl --namespace=${NAMESPACE} apply -f $1