# Generate private key for bastion access
resource "tls_private_key" "bastion" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create key pair in AWS
resource "aws_key_pair" "bastion" {
  key_name   = var.bastion_key_name
  public_key = tls_private_key.bastion.public_key_openssh

  tags = merge(
    { Name = "${var.bastion_key_name}-keypair" },
    var.tags
  )
}

# Store private key in Secrets Manager for safe retrieval
resource "aws_secretsmanager_secret" "bastion_private_key" {
  name                    = var.bastion_key_secret_name
  description             = "Private key for Bastion EC2 instance"
  recovery_window_in_days = 7

  tags = merge(
    { Name = "${var.bastion_key_name}-secret" },
    var.tags
  )
}

resource "aws_secretsmanager_secret_version" "bastion_private_key" {
  secret_id      = aws_secretsmanager_secret.bastion_private_key.id
  secret_string  = tls_private_key.bastion.private_key_pem
}

# EC2 Bastion Instance
resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami
  instance_type          = var.bastion_instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.bastion_sg_id]
  key_name               = aws_key_pair.bastion.key_name

  associate_public_ip_address = true

  # IMDSv2 enforced for better security
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.bastion_root_volume_size
    delete_on_termination = true
    encrypted             = true
  }

  tags = merge(
    { Name = var.bastion_instance_name },
    var.tags
  )

  lifecycle {
    ignore_changes = [ami]
  }

  depends_on = [aws_key_pair.bastion]
}
