# Doppler POC Demo

Install
```
brew install doppler
```

Create a project
```
doppler projects create demo
doppler projects
```

Create entries
```
doppler secrets upload dev.env
doppler secrets set HELL_PORT '8888'
```

Create a branch by clocking on the `+` symbol

## Python

### Without Doppler
```
source dev.env
python demo.py

source prod.env
python demo.py
```

### With Doppler
```
doppler run -- python demo.py
```

## Terraform
```
doppler configs tokens create --project demo --config dev ngmac --plain
export TF_VAR_DOPPLER_TOKEN='$(doppler configs tokens create --project demo --config dev ngmac --plain)'

export TF_VAR_DOPPLER_TOKEN='dp.st.dev.XYZ'
```

### Run Terraform without any code changes

```
cd terraform-pull-secret-no-provider
doppler run --name-transformer tf-var -- terraform plan
```

### Run Terraform using provider
```
cd terraform-pull-secret-with-provider
terraform plan
```

## Kubernetes
- https://github.com/DopplerHQ/kubernetes-operator

```
helm repo add doppler https://helm.doppler.com
helm install --generate-name doppler/doppler-kubernetes-operator
```

```
K8S_DOPPLER_TOKEN=$(doppler configs tokens create doppler-kubernetes-operator --plain -p demo -c dev)
kubectl create secret generic doppler-token-secret --namespace doppler-operator-system --from-literal=serviceToken=$K8S_DOPPLER_TOKEN
```

Create DopplerSecret
```
kubectl apply -f DopplerSecret.yaml
```

Apply Deployment and use the secret
```
kubectl apply -f deployment_envFrom.yaml
```
