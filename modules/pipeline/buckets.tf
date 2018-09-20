resource "aws_s3_bucket" "source" {
  bucket        = "${var.app_name}-pipeline"
  acl           = "private"
  force_destroy = true
}
