
variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-09b90e09742640522"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}
