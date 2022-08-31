
# Helm for Spin and Profit

## Rancher Setup:
- Download rancher CLI
- Get token from https://rancher2.spin.nersc.gov/apikeys 
- Login
  ```
  rancher login -t token-xxxxx:yyyyyyyyyyyyyyyyyyyyyyyyyyyyy https://rancher2.spin.nersc.gov/v3
  ```

## Env Setup
Run:
```
. helm-init.sh
```

or just set these:
```
export HELM_NAMESPACE="nmdc-helm-test"
export HELM_KUBETOKEN="token-xxxxx:yyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
export HELM_KUBEAPISERVER=https://rancher2.spin.nersc.gov/k8s/clusters/c-fwj56
# name of this dir
export CHART_NAME=nmdc-helm
# name of the deployment 
export RELEASE=nmdc-helm
```

## Install
```
cd ..
helm upgrade --install -n $HELM_NAMESPACE $RELEASE $CHART_NAME
```
