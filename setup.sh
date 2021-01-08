#!/bin/sh

# START MINIKUBE
minikube start --driver=docker --cpus 2 --memory 4g --addons metallb --addons metrics-server --addons dashboard

# Use the docker daemon from minikube.
eval $(minikube docker-env)

docker build -t my_nginx srcs/nginx --network=host
docker build -t my_wordpress srcs/wordpress
docker build -t my_mysql srcs/mysql
docker build -t my_phpmyadmin srcs/phpmyadmin
docker build -t my_ftps srcs/ftps
docker build -t my_grafana srcs/grafana
docker build -t my_influxdb srcs/influxdb

kubectl apply -f srcs/metalLB.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml

minikube dashboard