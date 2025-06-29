# S3-webiste-static-hosting

## 📌 Project Overview:

This project demonstrates how to host a static portfolio website on AWS S3 using Infrastructure as Code (IaC) with Terraform.
The solution automates the provisioning of AWS resources, ensuring repeatability and ease of deployment.

- [📌 Project Overview]
- [🔧 Prerequisites]
- [🧱 Step-by-Step Process]
- [ 🌍 Output ]
- [🧠 What I Learned]
- [📌 Future Improvements]






## 🔧 Prerequisites

- ✅ An AWS Account (Free Tier is enough)
- ✅ Terraform installed (terraform -version)
- ✅ Basic understanding of HTML/CSS (for customizing the portfolio)

## 🧱 Step-by-Step Process

### 🥇 1. Organized My portfolio Files such as HTML, CSS, JS etc.
1. I have an Index.html file.
2. Second organised CSS, JS files , fonts and images in a seperate folder.
3. All these became my upload source.
#
### ⚙️ 2. Created the Terraform Configuration (main.tf)

✅ Initializes aws Provider:

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/providers.png)


🪣 3. Created a Randomized S3 Bucket & Cofigured Ownership Preferrence:
-  To avoid name collisions and ensure uniqueness:
-  use Variable / name of an unique bucket.
-  Ownership controls were configured to **BucketOwnerPreferred** to retain full control over uploaded objects.

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-bucket-source.png)

🔐 4. Configured Public Access
- Allowed public read access to static files by updating the bucket policy and disabling block public access settings. This made it possible to host and share files like HTML, CSS, and images on the internet.

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-public%20access.png)

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-acl.png)


🌐 5. Enabled Static Website Hosting:

Enabled static website hosting on the S3 bucket by specifying index and error documents, allowing it to serve web pages directly over the internet.


![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-hosting.png)

📤 6. Set up bucket policies to allow public read permissions on all objects within the S3 bucket, ensuring that anyone on the internet can retrieve and view the website’s static content without authentication. This configuration made the hosted web pages universally accessible to users via the S3 static website endpoint.

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/bucket_policies.png)




📤 7. Uploaded an images, CSS files including index.html and error.hmtl:

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/upload%20files.png)


📤 8. Output the Website URL using terraform. (outputs.tf)

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/s3-output-1.png)

📤 9. Creating resources using the Terraform configuration files.

command to install plugins for providers used within the configuration.
```
terraform init
````
command to validate the terraform code is correct or having any errors.
```
terraform validate
````

command is used to see the changes that will take place on the infrastructure.

```
terraform init
````

The command will provision the AWS resources defined in the main.tf file. By default, it prompts for user confirmation before applying the changes; to bypass this and automatically approve the resource creation, use the **--auto-approve** flag..
```
terraform apply -auto-approve
```

📤 10. 🌍 Output:

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/out-1.png)


- 🎉 My portfolio was live hosted on AWS :

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/out-2.png)


![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/out-3.png)


⚠️ 10.  This action uses the terraform destroy command to immediately destroy all resources in a Terraform workspace.

```
Terrafor destroy -auto-approve
```

![App Screenshot](https://github.com/AvinashSaxena17/s3-webiste-static-hosting/blob/main/images/terraform-destroy2.png)





## 🧠 What I Learned

- How to use Terraform to automate the provisioning of an S3 bucket with static website hosting enabled.
- Gain hands-on experience with configuring bucket policies, ACLs, and public access settings to securely allow public read access.

## 📌 Future Improvements

- Integrate CloudFront as a CDN to improve performance and enable HTTPS with a custom domain.
- Add monitoring and logging using AWS CloudWatch or S3 access logs to track usage and troubleshoot issues.

