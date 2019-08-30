data "aws_ami" "ubuntu" {
    most_recent = true


    filter {
        name ="name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values=["hvm"]
    }

    owners = ["099720109477"]

}

resource "aws_instance" "DevTools" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "aws-root"
    security_groups = [ "${aws_security_group.subnetsecurity.name}", "${aws_security_group.ssh-group.name}"]

    tags = {
        Name = "DevTools"
    }
}

resource "aws_instance" "CI" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "aws-root"
    security_groups = [ "${aws_security_group.subnetsecurity.name}", "${aws_security_group.ssh-group.name}"]

    tags = {
        Name = "CI"
    }
}

resource "aws_instance" "Artifactory" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "aws-root"
    security_groups = [ "${aws_security_group.subnetsecurity.name}", "${aws_security_group.ssh-group.name}"]

    tags = {
        Name = "Artifactory"
    }
}

resource "aws_instance" "Docker" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "aws-root"
    security_groups = [ "${aws_security_group.subnetsecurity.name}", "${aws_security_group.ssh-group.name}"]

    tags = {
        Name = "Docker"
    }
}