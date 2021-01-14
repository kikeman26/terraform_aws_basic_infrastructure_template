resource "aws_key_pair" "Key_pair" {
    key_name = "tf_key"
    public_key = var.ssh_key
  
}