# create the local private key
resource "tls_private_key" "my-private-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

#create the AWS key pair using the local Generated public Key
resource "aws_key_pair" "aws_key_pair" {
  key_name = "terraform-key"
  public_key = tls_private_key.my-private-key.public_key_openssh
 
}


resource "local_file" "private_key_file" {
  content              = tls_private_key.my-private-key.private_key_pem
  filename             = "./key/my-key.pem" # <-- Put it in WSL-safe location
  file_permission      = "0400"
  directory_permission = "0700"
  
}
