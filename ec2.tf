provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "packer_ami" {
  filter {
    name = "state"
    values = ["available"]
  }

  filter {
    name = "name"
    values = ["packer-example*"]
  }

  most_recent = true
  owners = ["self"]
}

resource "aws_instance" "example_node" {
  ami           = data.aws_ami.packer_ami.id
  instance_type = "t2.micro"
}
