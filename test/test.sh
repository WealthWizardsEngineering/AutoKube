#!/usr/bin/env sh

function assertEquals()
{
    MESSAGE=$1
    EXPECTED_FILE=$2
    ACTUAL_FILE=$3

    if diff ${EXPECTED_FILE} ${ACTUAL_FILE}; then
        echo "Passed"
        return 0
    else
        echo "FAILED: ${MESSAGE}"
        return 1
    fi
}

function runTestsFor()
{
    export NAMESPACE=$1
    export KUBERNETES_USERNAME=test
    export KUBERNETES_PASSWORD=mypassword
    RESULT=0

    echo "Running tests for: ${NAMESPACE}"

    rm -rf /consul-template/output

    consul-template -config "config/consul_config.hcl" -once

    assertEquals "Expected destination rules to be correct" /usr/test/expected_outputs/${NAMESPACE}/destination_rules.rendered /consul-template/output/destination_rules.yaml || RESULT=1
    assertEquals "Expected kubeconfig to be correct" /usr/test/expected_outputs/${NAMESPACE}/kubeconfig.rendered /consul-template/output/kubeconfig || RESULT=1
    assertEquals "Expected virtual services to be correct" /usr/test/expected_outputs/${NAMESPACE}/virtual_services.rendered /consul-template/output/virtual_services.yaml || RESULT=1

    return ${RESULT}
}

RESULT=0

echo "Waiting for test data to load..."
sleep 5

runTestsFor "saturn-green" || RESULT=1

if [[ "$RESULT" -gt 0 ]]; then
  echo "There were test failures, inspect the details above for details"
fi

exit ${RESULT}