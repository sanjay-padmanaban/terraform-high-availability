# Launch Configuration
resource "aws_launch_configuration" "web" {
  name            = "${var.project_name}-launch-configuration"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instance_sg.id]
  user_data       = data.template_file.userdata.rendered

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web" {
  launch_configuration      = aws_launch_configuration.web.id
  min_size                  = 2
  max_size                  = 3
  desired_capacity          = 2
  vpc_zone_identifier       = aws_subnet.private.*.id
  target_group_arns         = [aws_lb_target_group.main.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "${var.project_name}-application"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
