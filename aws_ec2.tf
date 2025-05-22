resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = data.aws_subnet.default.id
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  associate_public_ip_address = true
  tags = {
    Name = "HelloWorld"
  }
  key_name = aws_key_pair.deployer.key_name
  # user_data = <<-EOF
  #             #!/bin/bash
  #             echo "Hello World" > /var/www/html/index.html
  #             yum install -y httpd
  #             systemctl start httpd
  #             systemctl enable httpd
  #           EOF     
  user_data = file("${path.module}/crontab.sh")
}