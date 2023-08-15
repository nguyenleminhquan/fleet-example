#!/usr/bin/env bash

# See https://helm.sh/docs/intro/using_helm/#the-format-and-limitations-of---set

# Reload config
source ~/.localrc

source ./.envrc

kubectl config use-context $CLUSTER_NAME
kubectl get ns ${NAMESPACE} || kubectl create ns ${NAMESPACE}

helm diff \
    upgrade --install \
    -n $NAMESPACE  \
    -f custom-values.yaml \
    $APP_NAME $CHART_PATH --version $CHART_VERSION

helm upgrade --debug --atomic --timeout 10m --install --cleanup-on-fail \
    -n $NAMESPACE  \
    -f custom-values.yaml \
    $APP_NAME $CHART_PATH --version $CHART_VERSION # --dry-run
