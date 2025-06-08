variable "region1" {
    type = string
    default = "us-east-1"
}



variable "publi_web_1_cidr" {
    default = "172.20.1.0/24"
}

variable "publi_web_2_cidr" {
    default = "172.20.2.0/24"
}

variable "publi_web_3_cidr" {
    default = "172.20.3.0/24"
}

variable "app_1_cidr" {
    default = "172.20.4.0/24"
}

variable "app_2_cidr" {
    default = "172.20.5.0/24"
}

variable "app_3_cidr" {
    default = "172.20.6.0/24"
}


variable "db_1_cidr" {
    default = "172.20.7.0/24"
}

variable "db_2_cidr" {
    default = "172.20.8.0/24"
}

variable "db_3_cidr" {
    default = "172.20.9.0/24"
}


variable "zone-1" {
  type = string
  default = "us-east-1a"
}

variable "zone-2" {
  type = string
  default = "us-east-1b"
}

variable "zone-3" {
  type = string
  default = "us-east-1c"
}

variable "ec2_keyname" {
    type = string
    default = "container"
}

variable "ec2_ami" {
    type = string
    default = "ami-085386e29e44dacd7"
}


variable "ec2-ubuntu_ami" {
    type = string
    default = "ami-084568db4383264d4"
}

variable "ec2_inztance_type_t2" {
    type = string
    default = "t2.micro"
}

variable "db_engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0.34"
}

variable "db_instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "db_username" {
  type = string
  default = "tino"
}

variable "db_username_pswd" {
  type = string
  default = "tino12345"  
}