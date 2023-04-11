variable "image_id" {
  description = "The id of the machine image (AMI) to use for the server."
  default     = "ami-1234567"
  type        = string

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

#variable "servers" {
#  type = number  
#}

variable "environment" {
  type        = string
  default     = "staging"
  description = "The environment of instance"
}

variable "plus" {
  type    = number
  default = 2
}

variable "production" {
  type    = bool
  default = false
}

variable "instance_type" {
  type    = list(string)
  default = ["t2.micro", "t3.medium"]
}

variable "blocks" {
  type = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
  description = "List of EBS Block" 
}

variable "name" {
  type = string
  default = "LeonanXablau"
  description = "Nome do HelloWorld"
}