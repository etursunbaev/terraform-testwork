# My Terraform modules

## Task 1 Agenda

1. Create EC2 Linux instance in AWS using Terraform. The instance should have attached tags: Date_creation, OS_type, Your_First_Name, Your_Last_Name, AWS_Account_ID.

2. Generate SSH key pair and upload to AWS via Terraform.

3. The default AWS key pair for VM bootstrap should refer to the key pair from step 2. As a result, you should be able to login via SSH to the server.

4. Create userdata script which will install Apache and respond over HTTP.

5. As part of useradata script, collect all the tags assigned to instance reading them from EC2 (not from TRF variables).

6. You need to create index.html which will demonstrate AWS tags assigned to EC2 instance in a table form.

7. Restrict access to your webpage from your IP address only. As a result, you should be able to remotely access web page served by Apache and see table of tags there.

### Addition to the task 1
- Put any .txt file to that VM (using provisioners).
- Cat that file remotely (using provisioners).

## Task 2

In progress

