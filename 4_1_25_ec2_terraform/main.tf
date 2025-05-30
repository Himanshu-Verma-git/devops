resource aws_instance my_ec2 {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t3.micro"
  subnet_id = "subnet-0b62b3ad1b0eedfa5"
  associate_public_ip_address = false

  root_block_device {
    volume_size = 12
    volume_type = "gp2"
  }

  tags = {
    Name = "Terraform-EC2"
  }
}

