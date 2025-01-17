#!/bin/bash
GIHUB_URL=https://github.com/lesanpi/jenkins-playground
RUNNER_TOKEN=AKGVSWJHYUQV6KLHGX4UTMTGRVKAK
RUNNER_LABELS=self-hosted,main

# Update packages
apt-get update -y

# Docker oficial
# Add Docker's official GPG key:
sudo apt-get update 
# && sudo apt upgrade -y --unattended
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install and enable docker
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker config
cat > /etc/cron.daily/docker-prune <<EOF
docker image prune -a --filter="until=96h" --force
docker volume prune --force
EOF
chmod a+x /etc/cron.daily/docker-prune

# Create dedicated user
useradd -m -d /home/runner -s /bin/bash runner
# usermod -G docker runner
usermod -aG sudo runner
usermod -G docker runner


# Log as runner
cd /home/runner
su runner
# Create action-runner folder
mkdir -p actions-runner
cd actions-runner
# Download and install runner script
curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

# Configure runner
su - runner -c "
/home/runner/actions-runner/config.sh --url $GIHUB_URL --token $RUNNER_TOKEN --labels $RUNNER_LABELS --unattended
"
# Setup systemd scripts
cd /home/runner/actions-runner/
./svc.sh install runner
./svc.sh start
./svc.sh status


