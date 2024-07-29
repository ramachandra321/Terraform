variable "instance_type" {
  description = "Type of instance to use"
  type = string
  default = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image ID"
   # Amazon Linux 2 AMI in us-west-2
}

variable "Vpc_cidr_block" {
  type = string
  #cidr block for VPC


}

variable "subnet_cidr_block" {
  type = string
  #CIDR block for subnet


}

variable "cidr_blocks" {
  type = string
  #CIDR block for subnet


}
