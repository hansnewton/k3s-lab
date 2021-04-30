
sudo systemctl restart network

export WORKER_IP=$(ip a |grep global | grep -v '10.0.2.15' | awk '{print $2}' | cut -f1 -d '/')
export MASTER_IP=$(cat /vagrant/master-ip)
export NODE_TOKEN=$(cat /vagrant/node-token)

# updating principal dependencies 
sudo yum install -y centos-release net-tools vim curl
sudo systemctl stop firewalld
sudo systemctl stop iptables

# k3s worker
# source: https://github.com/seanmwinn/cilium-k3s-demo/blob/master/agent.sh
curl -sfL https://get.k3s.io | K3S_URL="https://${MASTER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" INSTALL_K3S_EXEC="--no-flannel --node-ip=${WORKER_IP} --node-external-ip=${WORKER_IP}" sh -
sudo echo 'export PATH=$PATH:/usr/local/bin/' >> /root/.bashrc
source /root/.bashrc
