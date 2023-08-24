resource "aws_instance" "web" {
  ami           = "ami-053872dbd395aa439"
  instance_type = "t2.micro"
  key_name = "key"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "WebServer"
  }
   provisioner "file" {
    source = "C:/Users/Hamza/Downloads/key.ppk"
    destination = "C:/Users/Hamza/Downloads/key.ppk"

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("C:/Users/Hamza/Downloads/key.ppk")}"
    }  
  }
}
resource "aws_instance" "db" {
  ami           = "ami-053872dbd395aa439"
  instance_type = "t2.micro"
  key_name = "key"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}