

## To run the app create a cluster (k8s minikube, application currently is not handling AWS EKS), apply the two manifest files found in the directory (kubectl apply -f <filename.yaml>. please note that after this step you may have to wait a bit, you can check the status of your deployment and services with "kubectl get all"), then run ./install.sh.

Please note that if you are changing the name in the service/deployment you will also have to change the name of your deployments in install.sh.

If you are not changing any configurations all you have to do after running install.sh is opening localhost:3000 (grafana) and localhost:5000 (application).

This is not necessary needed for functionality, but if you wish to access prometheus directly you can run "kubectl port-forward svc/prometheus-operator-kube-p-prometheus 9090:9090 -n default" to access prometheus in the browser (localhost:9090).

The default credentials for this Helm prometheus-grafana installation is: admin/prom-operator.


