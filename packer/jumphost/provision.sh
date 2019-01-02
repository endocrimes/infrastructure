#!/usr/bin/env bash

set -o errexit

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    jq

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

apt-get install -y docker-ce

# Wait for docker to start
sleep 60

touch ${HOME}/.ssh/authorized_keys

cat <<SSHCONFIG > /etc/ssh/sshd_config
Port 443
Port 1443
AllowAgentForwarding yes
AllowTCPForwarding yes
PrintMotd no
AcceptEnv LANG LC_*
SSHCONFIG

docker run -d --restart always \
    --name sshb0t \
    -v ${HOME}/.ssh/authorized_keys:${HOME}/.ssh/authorized_keys \
    r.j3ss.co/sshb0t --user dantoml --keyfile /root/.ssh/authorized_keys

