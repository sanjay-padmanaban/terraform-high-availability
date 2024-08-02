variable "region" {
  description = "AWS region"
  default     = ""
}

variable "project_name" {
  description = "our project name"
  default     = ""
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  default     = ""
}

variable "public_subnet_cidrs" {
  description = "Public Subnet CIDR Blocks"
  type        = list(string)
  default     = [""]
}

variable "private_subnet_cidrs" {
  description = "Private Subnet CIDR Blocks"
  type        = list(string)
  default     = [""]
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = [""]
}


variable "ami_id" {
  description = "AMI ID For EC2 Instance"
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = ""
}


