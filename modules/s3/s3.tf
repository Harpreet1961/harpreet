

resource "aws_s3_bucket" "bucket" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
     

    bucket              = "${each.value.bucket}"
   #bucket_prefix       = "${each.value.bucket_prefix}"
    
    #policy              = "${each.value.policy}"
    #tags                = "${each.value.tags}"
    force_destroy       = "${each.value.force_destroy}"
    
    #policy = var.policy

   # acceleration_status = 
 # region              = var.region
    #request_payer       = 
    tags = {
        Environment = "${each.value.environment_name}"
    #Owner       = "${var.tags_owner}"
        Name        = "${each.value.environment_name}-NAP-PMS-s3-bucket"
  }

     
    #     Environment = "${each.value.tags}"
    # #Owner       = "${var.tags_owner}"
    # Name        = "${each.value.environment_name}-NAP-PMS-s3-bucket"
    #   #"Name" = "${each.value.tags}"
    #}

    #tags = "${each.value.tags}"
}


resource "aws_s3_bucket_acl" "bucket-acl" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
    acl                 = "${each.value.acl}"
    bucket = aws_s3_bucket.bucket[each.key].id
        
  
}


resource "aws_s3_bucket_accelerate_configuration" "bucket-acceleration-status" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
    bucket = aws_s3_bucket.bucket[each.key].id
    status = "${each.value.acceleration_status}"
}

resource "aws_s3_bucket_request_payment_configuration" "bucket-request-payer-config" {
     for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
     bucket = aws_s3_bucket.bucket[each.key].id
     payer  = "${each.value.request_payer}"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
    bucket = aws_s3_bucket.bucket[each.key].id

  

  #bucket = aws_s3_bucket.example.id
    versioning_configuration {
      
      status = "${each.value.versioning}"
  }
}


resource "aws_kms_key" "mykey" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
  description             = "KMS key is used to encrypt bucket objects"
  enable_key_rotation = true
  tags = {
    Environment = "${each.value.environment_name}"
    #Owner       = "${var.tags_owner}"
    Name        = "${each.value.environment_name}-NAP-PMS-s3-bucket"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
    for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
     bucket = aws_s3_bucket.bucket[each.key].bucket
  # bucket = aws_s3_bucket.mybucket.bucket

  rule {
    apply_server_side_encryption_by_default {
     # kms_master_key_id = aws_kms_key.mykey.arn
      kms_master_key_id = aws_kms_key.mykey[each.key] .arn 
      sse_algorithm     = "aws:kms"
    }
  }
}




# resource "aws_s3_bucket_policy" "bucket_policy" {
#     for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
#      bucket = aws_s3_bucket.bucket[each.key].id
#      policy = var.policy
  
# }

# resource "aws_s3_bucket_website_configuration" "website" {
#    
#     for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
#     bucket = aws_s3_bucket.bucket[each.key].id

#     dynamic "index_document" {
#         #for_each = try([var.website["index_document"]], [])
#         for_each =  length(keys(var.website)) == 0 ? [] : [var.website]
    
#     #index_document = lookup(each.value, "index_document", null)
#      # error_document = lookup(each.value, "error_document", null)
#     content {
#       suffix = lookup(index_document.value, "index_document", null)
#        # suffix = index_document.value    
#     }
    
#     }   
#     dynamic "error_document" {
#     #for_each = try([var.website["error_document"]], [])
#      for_each = length(keys(var.website)) == 0 ? [] : [var.website]

#     content {    

#       key = lookup(error_document, "error_document", null)
#       # key =  error_document.value
    
#     }

#     }
        
#     dynamic "redirect_all_requests_to" {
#     #for_each = try([var.website["redirect_all_requests_to"]], [])
#     for_each = length(keys(var.website)) == 0 ? [] : [var.website]

#     content {
#       host_name = redirect_all_requests_to.value.host_name
#       protocol  = try(redirect_all_requests_to.value.protocol, null)
#     }
#   }

#   dynamic "routing_rule" {
#     #for_each = try(flatten([var.website["routing_rules"]]), [])
#     for_each = length(keys(var.website)) == 0 ? [] : [var.website]

#     content {
#       dynamic "condition" {
#         for_each = [try([routing_rule.value.condition], [])]

#         content {
#           http_error_code_returned_equals = try(routing_rule.value.condition["http_error_code_returned_equals"], null)
#           key_prefix_equals               = try(routing_rule.value.condition["key_prefix_equals"], null)
#         }
#       }

#       redirect {
#         host_name               = try(routing_rule.value.redirect["host_name"], null)
#         http_redirect_code      = try(routing_rule.value.redirect["http_redirect_code"], null)
#         protocol                = try(routing_rule.value.redirect["protocol"], null)
#         replace_key_prefix_with = try(routing_rule.value.redirect["replace_key_prefix_with"], null)
#         replace_key_with        = try(routing_rule.value.redirect["replace_key_with"], null)
#       }
#     }
#   }
# }



# resource "aws_s3_bucket_website_configuration" "default" {

#     for_each = { for k, v in var.tfc-bucket-object : k => v if var.creat-bucket }
#    bucket = aws_s3_bucket.bucket[each.key].id

#    dynamic "index_document" {
#   for_each = var.website_inputs != null ? toset(var.website_inputs) : toset([])
#   content {
#      suffix = each.value.index_document
#   }
# #   index_document {
# #     suffix = each.value.index_document
# #   }
#    }
# dynamic "error_document" {
#    for_each = var.website_inputs != null ? toset(var.website_inputs) : toset([]) 
#    #key = each.value.error_document

#    content {

#     key = each.value.error_document
#    }
# }





#   error_document {
#     key = each.value.error_document
#   }

#   redirect_all_requests_to {
#     host_name = each.value.redirect_all_requests_to
#     protocol  = each.value.protocol
#   }

#   dynamic "routing_rule" {
#     for_each = length(jsondecode(each.value.routing_rules)) > 0 ? jsondecode(each.value.routing_rules) : []
#     content {
#       dynamic "condition" {
#         for_each = routing_rule.value["Condition"]

#         content {
#           key_prefix_equals = lookup(condition.value, "KeyPrefixEquals")
#         }
#       }

#       dynamic "redirect" {
#         for_each = routing_rule.value["Redirect"]
#         content {
#           replace_key_prefix_with = lookup(redirect.value, "ReplaceKeyPrefixWith")
#         }
#       }
#     }
#   }
# }


# resource "aws_s3_bucket" "website_log_bucket" {
#   for_each  =   { for k, v in var.website_s3_log_bucket_object : k => v if var.website_deploy_enabled}
#   bucket = "tfc-${var.lob}-connect-website-log-${var.sdlc_env}-${var.aws_region_abbr}"  

#   server_side_encryption_configuration {
#    rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = "arn:aws:kms:${var.aws_region}:${var.account_number}:key/${var.kms_key}"
# 		    sse_algorithm     = "aws:kms"
#       }
#     }
#   }

#   lifecycle_rule {
#     id      = "rule-1"
#     enabled = true

#     expiration {
#       days = 366
#     }
	
# 	noncurrent_version_expiration {
#       days = 1
#     }
#   }
  
#   lifecycle_rule {
#     id      = "rule-2"
#     enabled = true

#     expiration {
#       expired_object_delete_marker = true
#     }
#   }

#   tags = {
# 		"tfc-business-application-id" 	= var.tags_base["tag_business_application_id"]
# 		"tfc-business-cost-center" 	= var.tags_base["tag_cost_center"]
# 		"tfc-created-by" 		= var.tags_base["tag_created_by"]
# 		"tfc-technical-supported-by" 	= var.tags_base["tag_technical_supported_by"]
# 		"tfc-application-group" 	= var.tags_base["tag_application_group"]
# 		"tfc-technical-environment" 	= var.tags_base["tag_technical_environment"]
#   }
# }


# resource "aws_s3_bucket_versioning" "this_website_log_bucket_version" {
#   for_each  = { for k, v in var.website_s3_log_bucket_object : k => v if var.website_deploy_enabled}
#   bucket    = aws_s3_bucket.website_log_bucket[each.key].id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }







