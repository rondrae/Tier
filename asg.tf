########-----Auto scaling group for web tier--##########

resource "aws_launch_template" "asg-web" {
    name_prefix = "ASG-web"
    image_id = "ami-08974840d32f89a39"
    instance_type = "t2.micro"
    user_data = file("install_apache.sh")
    key_name = "source_key"
    network_interfaces {
      subnet_id = aws_subnet.public_web_sub_01.id
      security_groups = [aws_security_group.webserver-security-group.id]
    }
  
}


resource "aws_autoscaling_group" "asg-web" {
  availability_zones = ["ca-central-1a"]
  desired_capacity = 1
  max_size = 2
  min_size = 1

  launch_template {
    id = aws_launch_template.asg-web.id
    version = "$Latest"
  }
}




########-----Auto scaling group for APP tier--##########

resource "aws_launch_template" "asg-app" {
  name_prefix   = "ASG-App"
  image_id      = "ami-08974840d32f89a39"
  instance_type = "t2.micro"
  key_name      = "source_key"

  network_interfaces {
    subnet_id       = aws_subnet.private_app_sub_01.id
    security_groups = [aws_security_group.ssh-security-group.id]
  }
}

resource "aws_autoscaling_group" "asg-2" {
  availability_zones = ["ca-central-1"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.asg-app.id
    version = "$Latest"
  }
}