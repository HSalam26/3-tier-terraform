variable "cidr" {
    type = list
    default = ["10.0.4.0/24","10.0.2.0/24"]
}

variable "az" {
    type = list
    default = ["eu-west-2a","eu-west-2b"]
}