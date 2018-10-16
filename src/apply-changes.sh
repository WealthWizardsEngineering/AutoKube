#!/usr/bin/env sh

echo "${KUBERNETES_CERT}" > /tmp/kubernetes.pem

if [ "${KUBERNETES_USERNAME}" = "test" ]; then
    echo "Running in test mode, no changes will be made with $1"
else
    kubectl --certificate-authority=/tmp/kubernetes.pem \
        --kubeconfig=output/kubeconfig \
        --context=${CONTEXT} \
        apply -f $1
fi