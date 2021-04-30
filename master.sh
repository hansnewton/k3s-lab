
sudo systemctl restart network

export MASTER_IP=$(ip a |grep global | grep -v '10.0.2.15' | awk '{print $2}' | cut -f1 -d '/')
echo $MASTER_IP > /vagrant/master-ip

# updating principal dependencies 
sudo yum install -y centos-release net-tools vim curl

sudo systemctl stop firewalld
sudo systemctl stop iptables

# k3s server
# source: https://github.com/seanmwinn/cilium-k3s-demo/blob/master/master.sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-backend=none \
--no-flannel --node-ip=${MASTER_IP} --node-external-ip=${MASTER_IP} \
--bind-address=${MASTER_IP}" sh -

# master node token
sudo cp -f /var/lib/rancher/k3s/server/node-token /vagrant/node-token

# network not ready problem
sudo -u root /usr/local/bin/kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

sudo echo 'export PATH=$PATH:/usr/local/bin/' >> /root/.bashrc
source /root/.bashrc

cat /var/lib/rancher/k3s/server/token