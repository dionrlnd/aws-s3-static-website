# AWS S3 Static Website Hosting

This project shows how to host a static website on **Amazon S3** using **AWS CLI** and an **IAM user**. It serves as a portfolio example of cloud deployment.

---

## Project Structure

```
s3-static-website/
┣ website/                 # Website files (index.html, etc)
┣ scripts/                 # Deployment script (update-website.bat)
┣ screenshots/             # Screenshots of console & live website
┗ README.md
```

---

## Steps Performed (Lab Session)

1. **Configure AWS CLI** (using IAM user `awsS3user`)
```bash
aws configure
```
- Region: `us-west-2`
- Output: `json`

2. **Create S3 Bucket**
```bash
aws s3api create-bucket --bucket dion-s3-website-hosting --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
```

3. **Attach S3 Full Access to IAM User**
```bash
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --user-name awsS3user
```

4. **Adjust Bucket Permissions**
- Disable *Block public access*
- Enable *ACLs* for public read

5. **Enable Static Website Hosting**
```bash
aws s3 website s3://dion-s3-website-hosting/ --index-document index.html
```

6. **Upload Website Files**
```bash
aws s3 cp ./website/ s3://dion-s3-website-hosting/ --recursive --acl public-read
```

7. **Verify Upload**
```bash
aws s3 ls dion-s3-website-hosting
```

8. **Create Deployment Script (Windows)**
```bat
@echo off
aws s3 cp ..\website\ s3://dion-s3-website-hosting/ --recursive --acl public-read
pause
```
- Save as `scripts/update-website.bat`
- Run anytime to update website quickly

---

## Live Website

> Note: This project was implemented in a temporary AWS lab environment (AWS re/Start). 
> The live deployment shown here was created during the lab and may not be accessible now.

[S3 Website Endpoint URL](http://dion-s3-website-hosting.s3-website-us-west-2.amazonaws.com/)

---

## Screenshots

- **S3 Console**: `screenshots/s3-console.jpg`
- **Block Public Access**: `screenshots/block-public-access.jpg`
- **Object Ownership (ACLs enabled)**: `screenshots/object-ownership.jpg`
- **Static Website Hosting**: `screenshots/static-website-hosting.jpg`
- **Website Live**: `screenshots/website-live.jpg`
- **AWS CLI Config** (optional): `screenshots/aws-cli-config.jpg`
- **Upload Process** (optional): `screenshots/aws-s3-upload.jpg`

---

## Technologies Used

- Amazon S3 (Static Website Hosting)
- AWS CLI
- IAM User Management
- Amazon EC2 (for AWS CLI tasks)

---

## Learning Outcomes

- Host a static website on S3
- Configure IAM user with proper permissions
- Upload and manage files via AWS CLI
- Automate deployment with a batch script
