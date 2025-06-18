variable "vpc_id" {
  description = "The VPC ID to associate with the security group"
  type        = string
}


variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {}
}