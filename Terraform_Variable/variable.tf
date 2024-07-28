variable "instance_type" {
  description = "Type of instance to use"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image ID"
  default     = "ami-0427090fd1714168b"  # Amazon Linux 2 AMI in us-west-2
}