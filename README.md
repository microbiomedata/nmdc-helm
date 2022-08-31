

Setup
```
export HELM_NAMESPACE="nmdc-helm-test"
export HELM_KUBETOKEN="token-2qbcd:v7smv44m82d5xckkxzlxk8bv6n954lsn6tgpspbzvfrwlz7crtb82k"
export HELM_KUBEAPISERVER=https://rancher2.spin.nersc.gov/k8s/clusters/c-fwj56
export CHART_NAME=nmdc-test
```

Install
```
helm upgrade --install -n nmdc-helm-test nmdc-test nmdc-test
```