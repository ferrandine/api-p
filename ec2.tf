provider "aws" {
  region     = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-03bca18cb3dc173c9"
  instance_type = "t2.micro"
  key_name = "ferrandine"
}
