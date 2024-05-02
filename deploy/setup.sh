#!/bin/bash
# Log file location
LOG_FILE="/var/log/docker-installation.log"

{
	# Update the system
	sudo yum update -y

	# Install git
	sudo yum install git -y

	# Install Docker
	sudo yum install docker -y

	# Start Docker and enable it to run at startup
	sudo service docker start
	sudo systemctl enable docker

	# Add the current user to the docker group to run Docker without sudo
	sudo usermod -a -G docker $USER

	# Install Docker Compose
	sudo curl -L "https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

	# Check Docker and Docker Compose versions
	docker --version
	docker-compose --version

	echo "Docker and Docker Compose have been installed successfully."
} >>$LOG_FILE 2>&1
