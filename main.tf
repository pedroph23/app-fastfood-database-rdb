
module "vpc" {
 source = "terraform-aws-modules/vpc/aws"
 

 name = "vpc-fasfood-rds"
 cidr = "10.0.0.0/16"

 azs           = ["us-east-1a", "us-east-1b"]
 private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
 public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

 enable_nat_gateway = true
}

resource "aws_db_subnet_group" "fastfood_subnet_group" {
  name      = "aws_rds_subnets_groups"
  subnet_ids = module.vpc.private_subnets # your private subnet IDs
}


resource "aws_security_group" "this" {
  name        = "security_group_postgres_fastfood-produto"
  description = "Allow inbound traffic"
  vpc_id = module.vpc.vpc_id



  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "fasfoodproducaodb"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "fastfoodsquad24"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.fastfood_subnet_group.name
  vpc_security_group_ids = [aws_security_group.this.id]

  
}
