region               = "us-east-1"
project_name         = "myapp"

vpc_cidr             = "10.0.0.0/16"
public_subnets       = {
  "us-east-1a" = "10.0.1.0/24"
  "us-east-1b" = "10.0.2.0/24"
}
private_app_subnets  = {
  "us-east-1a" = "10.0.3.0/24"
  "us-east-1b" = "10.0.4.0/24"
}
private_db_subnets   = {
  "us-east-1a" = "10.0.5.0/24"
  "us-east-1b" = "10.0.6.0/24"
}

ami_id              = "ami-0abcdef1234567890"
instance_type       = "t3.micro"
key_name            = "my-keypair"
web_sg_id           = "sg-0abc1234"
min_size            = 2
max_size            = 4
desired_capacity    = 2
