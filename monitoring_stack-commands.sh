kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
#create persistance volume if need persistance 
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --set server.persistentVolume.enabled=false \
  --set alertmanager.persistentVolume.enabled=false \
  --set pushgateway.persistentVolume.enabled=false
#create a namespace and change the type of the service to loadbalancer to access over internet
helm install grafana grafana/grafana --namespace monitoring
kubectl patch svc grafana -n monitoring -p '{"spec": {"type": "LoadBalancer"}}'

#to get login credentials 
# Get Grafana URL
kubectl get svc -n monitoring grafana

# Get Admin Password
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo