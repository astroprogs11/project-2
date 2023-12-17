data "aws_caller_identity" "current" {}

 data "aws_ami" "amazon_linux_2" {
   most_recent = true
   owners      = ["577634506822"]
 }
