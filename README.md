# rds_postgress_db_tfm
# This projecct strickly foccuses on provisioning this infrastructure in a default vpc. 
# The envitomental variables has also been passed in plain text, but we can modify this project by introducing a vpc module plus a better way of managing our eviromental variables 
# Technique #1: Environment Variables
#This first technique keeps plain text secrets out of your code by taking advantage of Terraform’s native support for reading environment variables.
#To use this technique, declare variables for the secrets you wish to pass in, follow the link below:
# https://medium.com/gruntwork/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1

#The PostgreSQL server version 14.7 will run on a linux server. The database server will start successfully and will be ready to accept connections on port 5432 for IPv4, IPv6, and unix sockets respectively. A checkpoint operation will be performed, which involves writing database changes from memory to disk to ensure data integrity and prevent data loss in case of a server crash. The log includes details about the checkpoint operation, including how many buffers will be written and how long the operation will take.
#
#
#
#
#
#
#
#
#
#
#
#





