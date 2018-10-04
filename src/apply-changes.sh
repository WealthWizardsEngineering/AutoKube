#!/usr/bin/env sh

echo "${KUBERNETES_CERT}" > /tmp/kubernetes.pem

if [ "${KUBERNETES_USERNAME}" = "test" ]; then
    echo "Running in test mode, no changes will be made with $1"
else
    kubectl --certificate-authority=/tmp/kubernetes.pem \
        --user=${KUBERNETES_USERNAME} \
        --server=${KUBERNETES_API} \
        --namespace=${NAMESPACE} \
        --kubeconfig=output/kubeconfig \
        apply -f $1
fi