#!/bin/bash

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

GIT2CONSUL_CONFIG=$(cat <<EOF
{
  "version": "1.0",
  "repos": [
    {
      "name": "app_config_vars",
      "url": "/tmp/git/",
      "branches": [ "${GIT_BRANCH}" ],
      "expand_keys": true,
      "include_branch_name": false,
      "ignore_file_extension": true,
      "source_root": "test/data/app_config_vars",
      "hooks": [
        {
          "type": "polling",
          "interval": "2"
        }
      ]
    },
    {
      "name": "deployment_registry",
      "url": "/tmp/git/",
      "branches": [ "${GIT_BRANCH}" ],
      "expand_keys": true,
      "include_branch_name": false,
      "ignore_file_extension": true,
      "source_root": "test/data/deployment_registry",
      "hooks": [
        {
          "type": "polling",
          "interval": "2"
        }
      ]
    }
  ]
}
EOF
)

echo $GIT2CONSUL_CONFIG |tee $(git rev-parse --show-toplevel)/test/git2consul_config.json