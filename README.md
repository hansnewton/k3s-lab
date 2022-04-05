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

## Screenshots

Expected results
![Expected](https://github.com/hansnewton/k3s-lab/raw/main/screenshots/expected.png)