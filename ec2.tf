data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Account Oficial Canonical Ubuntu
}

#resource "aws_instance" "web" {
#  count         = var.servers
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = "t2.micro"

#  tags = {
#    Name = "LabXablau_Web"
#  }
#}

#resource "aws_eip" "ip" {
#      vpc      = true
#  instance = aws_instance.web.id
#}

#resource "aws_instance" "web_Lab" {
  # count         = var.environment == "production" ? 2 + var.plus : 1
  #  count         = !var.production ? 2 : 1
#  ami = data.aws_ami.ubuntu.id
#  for_each = {
#    dev     = "t2.micro"
#    staging = "t3.medium"
#  }
#  instance_type = each.value
#  tags = {
#    Name = "LabXablau_Web2"
#    Env  = var.environment
#  }
#}

resource "aws_instance" "web_Lab" {
  # count         = var.environment == "production" ? 2 + var.plus : 1
  #  count         = !var.production ? 2 : 1
  ami = data.aws_ami.ubuntu.id
  # for_each = toset(var.instance_type)
  instance_type = "t2.micro"

  dynamic "ebs_block_device" {
    for_each = var.blocks
    content {
      device_name = ebs_block_device.value["device_name"]
      volume_size = ebs_block_device.value["volume_size"]
      volume_type = ebs_block_device.value["volume_type"]
    # delete_on_termination = false
    }
  }

  tags = {
    #Name = "HelloWorld ${var.name}"
    Name = "Hello, %{ if var.name == "LeonanXablau" }${var.name}%{ else }Não é LeonanXablau%{ endif }!"
    Env  = var.environment
  }
}
