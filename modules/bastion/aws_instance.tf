data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "this" {
  ami                         = data.aws_ssm_parameter.this.value
  instance_type               = "t3.small"
  subnet_id                   = var.private_subnet_a_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  key_name                    = var.key_name
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.instance.id
  monitoring                  = true

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name          = "${var.app_name}-bastion"
    "Patch Group" = "DEV"
  }
}
