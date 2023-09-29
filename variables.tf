variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  default     = "be634a8f-4e58-4aae-94e2-0a80e0af5b05"
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}