output "aws_alb_public_dns" {
  value       = "http://${aws_lb.nginx.dns_name}"
  description = "Public DNS for the application load balancer"
}

output "master_public_ip" {
    value = ["${aws_instance.master.public_ip}"]
}
output "worker1_public_ip" {
    value = ["${aws_instance.worker1.public_ip}"]
}
output "worker2_public_ip" {
    value = ["${aws_instance.worker2.public_ip}"]
}