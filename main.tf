data "aws_caller_identity" "current" {}

resource "aws_security_group" "node-testing" {
  name        = "terraform-testing-sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "vpc-0a6b8bffabc62eb51"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "terraform-eks-node-sg",
     "owner", "owned",
    )
  }"
}

# Specify the provider and access details
provider "aws" {
  #shared_credentials_file = "./credentials"
  #  profile = "training"
  region = "ap-southeast-2"

  version = "2.11"
}
