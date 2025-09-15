@echo off
REM Script to upload website files to S3 bucket on Windows

aws s3 cp ..\website\ s3://dion-s3-website-hosting/ --recursive --acl public-read

pause