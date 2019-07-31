variable "queue" {
  description = "Name of the queue to set up an alarm."
}
variable "sns-topic" {
  description = "Name of the topic where to send a notifications."
}
variable "enabled" {
  type = bool
  default = true
}
variable "tags" {
  type = "map"
  default = {}
  description = "Tags attached to created resources."
}
variable "period" {
  default = 60
  description = "The period in seconds over which the specified statistic is applied."
}
variable "evaluation_period" {
  default = 1
  description = "The number of periods over which data is compared to the specified threshold."
}