resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Security group for bastion EC2 to manage RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
    description = "SSH access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = var.security_group_name
  }
}

# Allow this EC2 bastion to connect to RDS on port 5432
resource "aws_security_group_rule" "ec2_to_rds" {
  count = var.rds_security_group_id != "" ? 1 : 0
  
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = var.rds_security_group_id
  source_security_group_id = aws_security_group.ec2_sg.id
  description              = "Allow EC2 Bastion to RDS PostgreSQL"
}

resource "aws_instance" "ec2_bastion" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2_key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = var.associate_public_ip

  user_data_base64 = base64encode(templatefile("${path.module}/user_data.sh", {
    rds_endpoint = var.rds_endpoint
  }))

  tags = {
    Name = var.instance_name
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
