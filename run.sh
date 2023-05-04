#!/bin/bash

########################
# include the magic
########################
. pkg/demo-magic.sh

# hide the evidence
clear

# move to the right place
cd infrastructure/

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

PROMPT_TIMEOUT=0
wait
