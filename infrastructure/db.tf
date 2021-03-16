resource "aws_db_subnet_group" "default" {
  name       = "db_subnet_group"
  subnet_ids = aws_subnet.pub_subnet.*.id
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "11.10"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [ aws_security_group.db_sg.id ]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}