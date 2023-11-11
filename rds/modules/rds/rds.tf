locals {
    secret_value = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)
}

resource "aws_db_instance" "postgresdb" {
  allocated_storage    = 20
  db_name              = local.secret_value["dbname"]
  storage_type         = "gp2"
  engine               = local.secret_value["engine"]
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  username             = local.secret_value["username"]
  password             = local.secret_value["password"]
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
  multi_az             = false
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.subnets_rds.name
  vpc_security_group_ids = var.vpc_security_group_ids
   timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }
}

resource "aws_db_subnet_group" "subnets_rds" {
  name       = "main"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}