#!/bin/bash

echo "Criando as imangens..."

docker build -t andreazevedo80/projeto-backend:1.0 backend/.
docker build -t andreazevedo80/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push andreazevedo80/projeto-backend:1.0
docker push andreazevedo80/projeto-database:1.0

echo "Criando serviços no cluster kubernets.."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployments.yml


