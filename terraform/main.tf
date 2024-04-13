provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "example" {
 for_each = {
    "instance1" = {
      ami           = "ami-0a1b648e2cd533174" 
      instance_type = "t2.micro"
      name          = "jenkins"
      ebs_config    = {
        device_name = "/dev/sdf"
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
      }
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
 
 tags = {
    Name = each.key
 }
}
