provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "example" {
 for_each = {
    "instance1" = {
      ami           = "ami-0c55b159cbfafe1f0" 
      instance_type = "t2.micro"
    },
    "instance2" = {
      ami           = "ami-0c55b159cbfafe1f1" 
      instance_type = "t2.small"
    },
    "instance3" = {
      ami           = "ami-0c55b159cbfafe1f2" 
      instance_type = "t2.medium"
    },
    "instance4" = {
      ami           = "ami-0c55b159cbfafe1f3" 
      instance_type = "t2.large"
    },
    "instance5" = {
      ami           = "ami-0c55b159cbfafe1f4" 
      instance_type = "t2.xlarge"
    }
 }

 ami           = each.value.ami
 instance_type = each.value.instance_type
 key_name      = "dem.key" 
 vpc_security_group_ids = ["sg-0123456789abcdef0"] 

 tags = {
    Name = each.key
 }
}
