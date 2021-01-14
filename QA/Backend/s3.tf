
resource "aws_s3_bucket" "terraform_state" {
    bucket = "tf-test-infra-kikeman"

    lifecycle {
        prevent_destroy = true
    
    }

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}