#### Cloudformation stacks
## Reference to my previous project
## https://github.com/heavenhyhy/udacity-design-for-security-project-starter

resource "aws_cloudformation_stack" "network" {
  name          = "network"
  template_body = file("./cloudformation/network.yml")
  parameters    = {
    VpcName = "CD12352-vpc"
    VpcCIDR = "10.1.0.0/16"
    PublicSubnet1CIDR = "10.1.10.0/24"
    PublicSubnet2CIDR = "10.1.11.0/24"
    PrivateSubnet1CIDR = "10.1.20.0/24"
    PrivateSubnet2CIDR = "10.1.21.0/24"
  }
}

resource "aws_key_pair" "ssh" {
  key_name   = "Udacity SSH Key"
  public_key = file("../.ssh/id_rsa.pub")
}

resource "aws_cloudformation_stack" "s3" {
  depends_on    = [aws_cloudformation_stack.network]

  name = "s3"
  capabilities  = ["CAPABILITY_NAMED_IAM"]
  template_body = file("./cloudformation/s3.yml")
}

resource "aws_cloudformation_stack" "app" {
  depends_on    = [aws_cloudformation_stack.network, aws_cloudformation_stack.s3]

  name = "app"
  capabilities  = ["CAPABILITY_IAM"]
  parameters    = {
    KeyPair = aws_key_pair.ssh.key_name
  }
  template_body = file("./cloudformation/app.yml")
}