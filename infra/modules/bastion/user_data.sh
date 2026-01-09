#!/bin/bash
set -e

# Update system
yum update -y

# Install PostgreSQL client
yum install -y postgresql15-client

# Install MySQL client
yum install -y mysql

# Install useful tools
yum install -y aws-cli
yum install -y jq

echo "Bastion Host initialization completed"
