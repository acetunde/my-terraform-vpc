resource "aws_instance" "ubuntu" {
    ami = "ami-0a6b2839d44d781b2"
    instance_type = "t2.micro"
    key_name = "mykey"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "webserver"
    }
    depends_on = [aws_internet_gateway.igw,]
    subnet_id = aws_subnet.public_subnet.id
}