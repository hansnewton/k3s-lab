
systemctl restart network

cat <<EOF >> /etc/hosts
192.168.56.10 k3s-manager
192.168.56.11 k3s-node01
192.168.56.12 k3s-node02
EOF

timedatectl set-timezone America/Sao_Paulo

export MANAGER_IP=$(ip a |grep global | grep -v '10.0.2.15' | awk '{print $2}' | cut -f1 -d '/')
echo $MANAGER_IP > /vagrant/manager-ip

# installing only necessary dependencies 
yum install -y vim curl

systemctl stop firewalld
systemctl stop iptables

# k3s server
# source: https://github.com/seanmwinn/cilium-k3s-demo/blob/master/master.sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip=${MANAGER_IP} \
--node-external-ip=${MANAGER_IP} \
--bind-address=${MANAGER_IP}" sh -

# master node token
cp -f /var/lib/rancher/k3s/server/node-token /vagrant/node-token

# adapted de https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
# not necessary anymore in newer k3s versions
#/usr/local/bin/kubectl apply -f /vagrant/kube-flannel.yml

echo 'export PATH=$PATH:/usr/local/bin/' >> /root/.bashrc
source /root/.bashrc

cat /var/lib/rancher/k3s/server/token