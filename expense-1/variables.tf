variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

variable "domain_name" {
  default = "daws81s.online"
}

variable "zone_id" {
  default = "Z09912121MS725XSKH1TG"
}