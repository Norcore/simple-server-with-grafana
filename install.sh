#!/bin/bash

# Add Helm repositories
helm repo add prometheus-community https://prometheus-community.github.io/helm-chartshelm 
repo add stable https://charts.helm.sh/stable 
helm repo update
helm upgrade --install prometheus-operator prometheus-community/kube-prometheus-stack --namespace default

# Wait for Prometheus and Grafana to be ready
kubectl rollout status deployment/simple-server-with-grafana-deployment --namespace default
kubectl rollout status deployment/prometheus-operator-grafana --namespace default

# Set up port forwarding
kubectl port-forward deployment/simple-server-with-grafana-deployment 5000:5000 --namespace default &
kubectl port-forward deployment/prometheus-operator-grafana 3000:3000 --namespace default &

echo "Prometheus and Grafana are now accessible. Prometheus: http://localhost:5000, Grafana: http://localhost:3000"
