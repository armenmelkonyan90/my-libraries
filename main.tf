provider "aws" {}


resource "aws_instance" "my-nginx" {
  count = 2
  ami                    = "ami-02584c1c9d05efa69"
  instance_type          = "t2.micro"
  tags = {
    Name = "my_nginx_server"
  }
}

output "myip" {
  value       = aws_instance.my-nginx[0].public_ip
  description = "PublicIP adress details"
}
