# k3s Lab

## Context

This is a laboratory to run [k3s](https://k3s.io/) in centos7 virtual machines (with 512MB of RAM and 1 CPU each) using vagrant and virtualbox provider.

## Pre-requisites

- [Vagrant](https://www.vagrantup.com/downloads)  installed
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed

## Usage:

1. Clone this repository
2. Run `vagrant up` and wait.. all 3 servers (manager, node01, node02) start
3. Enter manager node `vagrant ssh k3s-manager`
4. Run `sudo -i` to elevate permissions
5. Run `kubectl get nodes` to see cluster ready to go

To destroy all VMs: `vagrant destroy -f`

## Hello-word
From https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/


`kubectl apply -f /vagrant/hello-word.yml`
`kubectl get deployments hello-world`
`kubectl describe deployments hello-world`

`kubectl get replicasets`

`kubectl expose deployment hello-world --type=LoadBalancer --name=my-service`

`kubectl delete service my-service`
`kubectl delete deployment hello-world`

Use the external IP address (`LoadBalancer Ingress`) to access the Hello World application:

`curl http://<external-ip>:<port>`

In this lab, access http://192.168.56.10:8080/

## Debug commands

`/usr/local/bin/kubectl get pods --all-namespaces -A`
`kubectl --namespace=<NAMESPACE_NAME> logs <POD_NAME>`

## Screenshots

Expected results
![Expected](https://github.com/hansnewton/k3s-lab/raw/main/screenshots/expected.png)