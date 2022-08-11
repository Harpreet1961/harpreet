# variable "creat-bucket" {
#     type = string
#     default = "true"
  
# }

# variable "tfc-bucket-object" {
#   type = map(object({
#     bucket  = string,
#    # bucket_prefix = string,
#     acl = string,
#     #tags = string,
#     force_destroy  = bool,
#     acceleration_status  = string,
#     request_payer = string,
#     versioning = string,
#     environment_name = string
#    #policy = string
    
#     # vpc-private-subnet-cidr = string, 
#     # vpc-infra-subnet-cidr = string,
#     # private_subnet_name = string,
#     # infra-subnets = string
#   }))
# }


# # variable "environment_name" {
# #   type = string
  
# # }




# # variable "tfc-website-object" {
# #   type = map(object({
# #     #index_document  = string,
# #    # bucket_prefix = string,
# #     #error_document = string,
# #     #tags = string,

# #      }))
# # }

# # variable "policy" {
# #   description = "(Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
# #   type        = string
# #   #default     = null
# # }



# # variable "website" {
# #   type = map(string)
# #   default = {}
  
# # }


# # variable "website_inputs" {

# #   type = list(object({
# #     index_document           = string
# #     error_document           = string
# #     #redirect_all_requests_to = string
# #     #routing_rules            = string
# #   }))
# #   default = null

# #   description = "Specifies the static website hosting configuration object."
# # }



# # variable "tags" {
# #   type = map(string)
  
# # }








# # website_s3_log_bucket_object = {
# #     "website_s3_log_bucket"    =    {
# #         groupname            =    "tcc"           
# #         appname    =    "ccpcam"
# #     }
# # }

# # variable "website_s3_log_bucket_object" {
# #   type = map(object({
# #     groupname = string,
# #     appname = string
# #   }))
# # }
