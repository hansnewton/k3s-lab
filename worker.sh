systemctl restart network

timedatectl set-timezone America/Sao_Paulo

cat <<EOF >> /etc/hosts
192.168.56.10 k3s-master
192.168.56.11 k3s-node01
192.168.56.12 k3s-node02
EOF

export WORKER_IP=$(ip a |grep global | grep -v '10.0.2.15' | awk '{print $2}' | cut -f1 -d '/')
export MANAGER_IP=$(cat /vagrant/manager-ip)
export NODE_TOKEN=$(cat /vagrant/node-token)

# updating principal dependencies 
yum install -y vim curl
systemctl stop firewalld
systemctl disable firewalld
systemctl stop iptables

# k3s worker
# source: https://github.com/seanmwinn/cilium-k3s-demo/blob/master/agent.sh
curl -sfL https://get.k3s.io | K3S_URL="https://${MANAGER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" INSTALL_K3S_EXEC="--node-ip=${WORKER_IP} --node-external-ip=${WORKER_IP}" sh -
echo 'export PATH=$PATH:/usr/local/bin/' >> /root/.bashrc
source /root/.bashrc
