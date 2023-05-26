#!/bin/bash

########################
# include the magic
########################
. pkg/demo-magic.sh

# hide the evidence
clear

# move to the right place
pe "cd infrastructure/"

# initialize terraform
pe "terraform init"

# check what terraform will do
pe "terraform plan"

# apply the changes
pe "terraform apply -auto-approve"

# get the kubernetes cluster id
kubernetes_cluster_id=$(terraform output -raw kubernetes_cluster_id)

# save the kubeconfig
pe "doctl kubernetes cluster kubeconfig save $kubernetes_cluster_id"

# check the nodes
pe "kubectl get nodes -A"

# move to the right place
pe "cd ../kubernetes/"

# initialize terraform
pe "terraform init"

# check what terraform will do
pe "terraform plan"

# apply the changes
pe "terraform apply -auto-approve"

# check the pods
pe "kubectl get pods --namespace=my-app"

# check the services
pe "kubectl get services --namespace=my-app"

PROMPT_TIMEOUT=0
wait
