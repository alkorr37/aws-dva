resource "aws_instance" "terraform-ec2" {
    ami             = var.imageId
    instance_type   = var.instanceType
    key_name        = "Basic"
    security_groups = [aws_security_group.ssh_http_rds.name]
    iam_instance_profile = aws_iam_instance_profile.IAM-EC2.name
    user_data = data.template_file.startup.rendered
}

resource "aws_iam_role" "EC2-role" {
    name                = "EC2-role"
    assume_role_policy  = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "sts:AssumeRole"
                ],
                "Principal": {
                    "Service": [
                        "ec2.amazonaws.com"
                    ]
                }
            }
        ]
    })
    managed_policy_arns = [aws_iam_policy.S3_Dynamodb.arn]
}

resource "aws_iam_policy" "S3_Dynamodb" {
    name = "S3"

    policy = jsonencode({
        Version     = "2012-10-17"
        Statement   = [
            {
                Action   = ["s3:*"]
                Effect   = "Allow"
                Resource = "*"
            },
            {
                Action   = ["dynamodb:*"]
                Effect   = "Allow"
                Resource = "*"
            },
        ]
    })
}

resource "aws_iam_instance_profile" "IAM-EC2" {
    name    = "IAM_EC2"
    role    = aws_iam_role.EC2-role.name
}

resource "aws_security_group" "ssh_http_rds" {
    name = "ssh_http_rds"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = var.dbPort
        to_port     = var.dbPort
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

data "template_file" "startup" {
    template = file("${path.module}/templates/startup.sh")
    vars = {
        bucketName = var.bucketName
        rdsFile = var.rdsFile
        dynamoFile = var.dynamoFile
    }
}