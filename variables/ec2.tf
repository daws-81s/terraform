resource "aws_instance" "terraform" {

    ami = var.ami_id # left side and right side names need not to be same
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = var.tags
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name
    description = var.sg_description

    # usually we allow everything in egress
    # block
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.ingress_cidr #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}

