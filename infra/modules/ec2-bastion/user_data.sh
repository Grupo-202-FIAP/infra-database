#!/bin/bash
set -e

# Update system
yum update -y

# Install PostgreSQL client
amazon-linux-extras install -y postgresql14

# Install useful tools
yum install -y \
    git \
    curl \
    wget \
    nano \
    vim \
    htop \
    net-tools \
    aws-cli

# Create a welcome file with RDS connection info
cat > /home/ec2-user/rds_connection_info.txt <<EOF
===========================================
RDS Connection Information
===========================================
Endpoint: ${rds_endpoint}

To connect to RDS, use:
psql -h ${rds_endpoint} -U postgres -d postgres

===========================================
EOF

chown ec2-user:ec2-user /home/ec2-user/rds_connection_info.txt

echo "EC2 Bastion setup completed successfully!"
