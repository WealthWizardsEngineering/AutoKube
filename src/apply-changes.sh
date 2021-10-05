#!/usr/bin/env sh

if [ "${KUBERNETES_USERNAME}" = "test" ]; then
    echo "Running in test mode, no changes will be made with $1"
else
    kubectl --namespace=${NAMESPACE} \
        apply -f $1
fi
