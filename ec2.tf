########-----EC2 web tier -----###########

resource "aws_instance" "web" {
    ami = "ami-08974840d32f89a39"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_web_sub_01.id
    vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
    key_name = "source_key"
    user_data = file("install_apache.sh")

    tags = {
      Name = "web-asg"
    }
  
}


########-----EC2 APP tier -----###########

resource "aws_instance" "app" {
    ami = "ami-08974840d32f89a39"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_app_sub_01.id
    vpc_security_group_ids = [aws_security_group.ssh-security-group.id]
    key_name = "source_key"
    

    tags = {
      Name = "app-asg"
    }
  
}

