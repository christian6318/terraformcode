
resource "aws_lightsail_instance" "example_instance" {
  name              = "example-instance"
  availability_zone = "us-east-1a" # Replace with your desired availability zone
  blueprint_id      = "amazon_linux_2" # Replace with your desired blueprint

  instance_snapshot_name = "dev_instance"
  bundle_id             = "nano_2_0" # Replace with your desired instance type
  #key_pair_name         = "example-key-pair"

  user_data = <<-EOF
    #!/bin/bash
   sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd  
sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index/html
    EOF

  tags = {
    "Name" = "example-instance"
  }
}

# Create a Lightsail static IP
resource "aws_lightsail_static_ip" "example_static_ip" {
  name = "example-static-ip"
}

