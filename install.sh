#!/bin/bash

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Add Helm repositories
helm repo add prometheus-community https://prometheus-community.github.io/helm-chartshelm 
repo add stable https://charts.helm.sh/stable 
helm repo update
helm upgrade --install prometheus-operator prometheus-community/kube-prometheus-stack --namespace default

# Wait for Prometheus and Grafana to be ready
kubectl rollout status deployment/simple-server-with-grafana-deployment --namespace default
kubectl rollout status deployment/prometheus-operator-grafana --namespace default
kubectl rollout status pod/prometheus-prometheus-operator-kube-p-prometheus-0 --namespace default

# Set up port forwarding
kubectl port-forward deployment/simple-server-with-grafana-deployment 5000:5000 --namespace default &
kubectl port-forward deployment/prometheus-operator-grafana 3000:3000 --namespace default &
kubectl port-forward svc/prometheus-operator-kube-p-prometheus 9090:9090 -n default &

echo "Prometheus and Grafana are now accessible. Web app: http://localhost:5000, Grafana: http://localhost:3000", Prometheus: http://localhost:9090
