# #!/bin/bash

# dnf -y install dnf-plugins-core
# dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# systemctl start docker
# systemctl enable docker
# usermod -aG docker ec2-user

# growpart /dev/nvme0n1 4
# lvextend -L +20G /dev/RootVG/rootVol
# lvextend -L +10G /dev/RootVG/varVol

# xfs_growfs /
# xfs_growfs /var

# ARCH=amd64
# PLATFORM=$(uname -s)_$ARCH
# curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
# tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
# install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# mv kubectl /usr/local/bin/kubectl

# eksctl version
# kubectl version

# git clone https://github.com/YadavEshNithin/terraform.git

# cd terraform/docker_instance_creation/

# eksctl create cluster --config-file=eks.yaml


# ##########################

# #!/bin/bash

# growpart /dev/xvda 4

# lvextend -L +10G /dev/mapper/RootVG-homeVol

# lvextend -L +10G /dev/mapper/RootVG-varVol

# lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

# xfs_growfs /home

# xfs_growfs /var

# xfs_growfs /var/tmp



# #############


# #!/bin/bash

# growpart /dev/xvda 4

# lvextend -L +10G /dev/RootVG/rootVol
# lvextend -L +10G /dev/RootVG/varVol
# lvextend -l +100%FREE /dev/RootVG/varTmpVol

# xfs_growfs /

# xfs_growfs /var

# xfs_growfs /var/tmp


# curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# # Add required dependencies for the jenkins package
# yum install fontconfig java-21-openjdk -y
# yum install jenkins -y
# systemctl daemon-reload
# systemctl enable jenkins
# systemctl start jenkins


#######################################
# update on sept 08/09/25


#!/bin/bash

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

xfs_growfs /
xfs_growfs /var

ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl

eksctl version
kubectl version

git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens