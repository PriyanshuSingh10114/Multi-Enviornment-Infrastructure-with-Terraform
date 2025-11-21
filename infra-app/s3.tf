resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.env}-${var.bucket_name}-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.env}-${var.bucket_name}"
    Environment = var.env
  }
}
