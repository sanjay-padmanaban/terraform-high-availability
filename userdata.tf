data "template_file" "userdata" {
  template = <<-EOT
    #!/bin/bash
    # Update package index
    apt-get update -y

    # Install Apache web server and curl
    apt-get install -y apache2 curl

    # Enable Apache to start on boot
    systemctl enable apache2

    # Start Apache service
    systemctl start apache2

    # Fetch a token for IMDSv2
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Fetch instance metadata using the token
    INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/instance-id)
    AVAILABILITY_ZONE=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

    # Create an HTML file to display instance ID and availability zone
    cat <<EOF > /var/www/html/index.html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Instance Metadata</title>
    </head>
    <body>
        <h1>Instance Metadata</h1>
        <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
        <p><strong>Availability Zone:</strong> $AVAILABILITY_ZONE</p>
    </body>
    </html>
    EOF
  EOT
}
