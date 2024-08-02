region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

project_name = "app-high-availability"

public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

availability_zones = ["us-east-1a", "us-east-1b"]

ami_id = "ami-04a81a99f5ec58529" #replace this with actual ami for respective region <ubuntu>

instance_type = "t2.micro"

