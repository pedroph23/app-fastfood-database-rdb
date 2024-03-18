
resource "aws_db_subnet_group" "fastfood_subnet_group" {
  name      = "aws_rds_subnets_groups"
  subnet_ids = ["subnet-0bade542721b95bb6", "subnet-007472babc1055dbe"]
}


resource "aws_security_group" "this" {
  name        = "security_group_postgres_fastfood-produto"
  description = "Allow inbound traffic"
  vpc_id = "vpc-0053416b6659e068d"



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
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.fastfood_subnet_group.name
  vpc_security_group_ids = [aws_security_group.this.id]
}
