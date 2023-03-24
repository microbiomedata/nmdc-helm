#!/usr/bin/env bash

# export ARG_UID=${ESSDIVE_UID:-76553}
# export ARG_GID=${ESSDIVE_GID:-72528}
export REGISTRY_SPIN=registry.nersc.gov/m3408

export RANCHER2_CLUSTER_DEV=c-fwj56
export RANCHER2_CLUSTER_PROD=c-tmq7p

export RANCHER_TOKEN=`jq -r .Servers.rancherDefault.tokenKey ~/.rancher/cli2.json`
export RANCHER_USERID=`curl --silent -H "Authorization: Bearer $RANCHER_TOKEN" 'https://rancher2.spin.nersc.gov/v3/users?me=true' | jq -r '.data[0].id'`

export HELM_DEBUG=true
export HELM_EXPERIMENTAL_OCI=1

cluster=$RANCHER2_CLUSTER_DEV
if [[ ! -z $1 &&  "$1" = "prod" ]]
then
  cluster=$RANCHER2_CLUSTER_PROD
  rancher kubectl config use-context production
  rancher context switch c-tmq7p:p-bkv45
  # change this eventually
  export HELM_NAMESPACE=nmdc-helm-test
else
  rancher kubectl config use-context development
  rancher context switch c-fwj56:p-nlxq2
  if [ -z $HELM_NAMESPACE ]; then
    export HELM_NAMESPACE=nmdc-helm-test 
  fi
fi

# Was a namespace passed in
if [ -n "$2" ]
then
  export HELM_NAMESPACE=$2
fi

export HELM_KUBETOKEN=$RANCHER_TOKEN
export HELM_KUBEAPISERVER=https://rancher2.spin.nersc.gov/k8s/clusters/$cluster
rancher kubectl config set-context --current --namespace=$HELM_NAMESPACE

echo "HELM_KUBEAPISERVER=$HELM_KUBEAPISERVER"
echo "HELM_NAMESPACE=$HELM_NAMESPACE"
