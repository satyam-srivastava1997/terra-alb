#### INSTANCE DB ####

# Create instance
resource "aws_instance" "db" {
  for_each      = var.db_instance_names
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.db.id,
  ]
  subnet_id = aws_subnet.db.id
  user_data = file("scripts/first-boot-db.sh")
  tags = {
    Name = each.key
  }
}
