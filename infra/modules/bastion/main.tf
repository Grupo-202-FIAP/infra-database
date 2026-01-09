data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    # PostgreSQL client
  }))

  tags = merge(
    {
      Name = var.bastion_name
    },
    var.tags
  )
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  domain   = "vpc"

  tags = merge(
    {
      Name = "${var.bastion_name}-eip"
    },
    var.tags
  )

  depends_on = [aws_instance.bastion]
}
