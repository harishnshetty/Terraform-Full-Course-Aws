output "aws_instance" {
    value = aws_instance.jenkins_server[*].id
      
}


output "aws_vpc" {
    value = aws_vpc.main_vpc.id
  
}

output "aws_security_group" {
    value = aws_security_group.jenkins_sg.id
  
}