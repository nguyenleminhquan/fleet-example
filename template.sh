#!/usr/bin/env bash

# See https://helm.sh/docs/intro/using_helm/#the-format-and-limitations-of---set

# Reload config
source ~/.localrc

source ./.envrc

kubectl config use-context $CLUSTER_NAME

helm template \
    -n $NAMESPACE  \
    -f custom-values.yaml \
    $APP_NAME $CHART_PATH --version $CHART_VERSION