
## Helm for Spin and Profit

Rancher Setup:
- Download rancher CLI
- Get token from https://rancher2.spin.nersc.gov/apikeys 

Env Setup
```
export HELM_NAMESPACE="nmdc-helm-test"
export HELM_KUBETOKEN="token-xxxxx:yyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
export HELM_KUBEAPISERVER=https://rancher2.spin.nersc.gov/k8s/clusters/c-fwj56
export CHART_NAME=nmdc-test
```

Install
```
helm upgrade --install -n nmdc-helm-test nmdc-test nmdc-test
```
