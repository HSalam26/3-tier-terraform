# Terraform 3 Tier Architecture Setup

This guide outlines the steps to create a 3-tier architecture setup using Terraform on AWS. The setup includes creating a VPC, subnets, EC2 instances, security groups, Elastic IP, NAT gateway, Internet gateway, Route Table, Application Load Balancer, and more.

## Prerequisites

- AWS Account
- Terraform Installed

## Steps

1. Clone or download this repository.

2. Go to the [Terraform website](https://www.terraform.io/docs/index.html) to get the necessary Terraform code that will be used throughout the setup.

3. On your local machine, create a file in your IDE for the VPC, e.g., `VPC.tf`.

4. Find the code for creating the VPC on the HashiCorp website and paste it into your `VPC.tf` file.

5. Create a `subnets.tf` file for your subnets.

6. Get the subnet code from the HashiCorp website and add it to your `subnets.tf` file.

7. To make things more organized, use variables to store commonly used values. Refer to the `variables.tf` file in this repository.

8. Reuse the subnet code for creating a private subnet. Ensure to change the name to 'private' to designate it as a private subnet.

9. Create a new file called `ec2.tf` for the EC2 instances.

10. Find the relevant code for creating EC2 instances. Make sure to use instance type `t2.micro` for the free tier.

11. Use a provisioner to gain access to the SSH key on your local machine.

12. Create a connection block in the `ec2.tf` file to enable SSH access to the EC2 instances.

13. Copy the EC2 instance resource code for creating the database instances. Ensure that there is no public IP address for the database instances.

14. Create a file named `sg.tf` for the security groups.

15. Obtain the security group code from the Terraform documentation and add it to your `sg.tf` file.

16. Add an additional ingress rule to the security group for port 80 (HTTP) to allow web server traffic.

17. Copy the security group code again and add an ingress rule for port 3306 (MySQL) to allow database traffic.

18. Create an `internetg.tf` file for the Internet Gateway.

19. Get the Internet Gateway code from Terraform's website and add it to your `internetg.tf` file.

20. Create a `route-table.tf` file for the Route Table.

21. Add the code for the Route Table, changing the CIDR block to `0.0.0.0/0` to make it public.

22. Copy the code for route table association from HashiCorp's documentation to associate the public subnets with the new route table.

23. Create a `nat-gateway.tf` file and add the NAT Gateway code to it.

24. Allocate an Elastic IP to the NAT Gateway by adding the Elastic IP code to a new file named `eip.tf`.

25. Allocate the NAT Gateway to the Route Table by updating the Route Table code to include a default route via the NAT Gateway.

26. Create an `alb.tf` file for the Application Load Balancer.

27. Add the Application Load Balancer code to the `alb.tf` file.

28. Create target groups to distribute traffic for the Load Balancer by adding the required code to the `alb.tf` file.

29. Attach the EC2 instances to the target groups using the target group attachment module in the `alb.tf` file.

30. Create a listener for the Load Balancer to manage incoming traffic. This is done using the listener module in the `alb.tf` file.

31. Run `terraform init`, `terraform plan`, and `terraform apply` to create the infrastructure. Check the AWS Management Console to confirm everything is as expected.

32. Additionally, you can install Apache into your servers using `sudo yum install httpd -y`.

33. Once you have confirmed that everything is working as expected, use `terraform destroy` to clean up and remove all resources.

Remember to replace placeholders with actual values and adjust the code as needed for your specific use case.

Happy coding!
