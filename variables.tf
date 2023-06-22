variable "vpc_name" {
    type        = string
    default     = "enablers"
    description = "vpc name" 
}
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "vpc cidr"
}
variable "azs" {
  type        = list(string)
  default     = ["us-east-1a"]
  description = "availability zones"
}
variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.8.0/24"]
  description = " public subnets"
}
variable "instance_type" {
    type = map
    default = {
        "small": "t2.micro"
        "medium": "t2.medium"
        "large": "t3.large"
    } 
    description = "instance type"
  
}