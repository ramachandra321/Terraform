module "Fit-Module" {
    source = "./modules"
    instance_type = "t3.micro"
    ami_id = "ami-0427090fd1714168b" 
    Vpc_cidr_block = "10.20.0.0/16"
    subnet_cidr_block = "10.0.0.1/24"
    cidr_blocks ="0.0.0.0/0"
    resource_tags = {
    project     = "my-project(creating Fit ec2 using terraform)",
    environment = "Fit"
    description = "Tags to set for FIT"
    Name ="EC2-instance-FIT"
  }
  
}