#!/bin/bash
# AWS CLI S3 Commands Cheat Sheet

# 1. List all buckets
aws s3 ls

# 2. Create a new bucket
aws s3 mb s3://your-bucket-name

# 3. Delete a bucket
aws s3 rb s3://your-bucket-name --force

# 4. List objects in a bucket
aws s3 ls s3://your-bucket-name

# 5. Upload a file to bucket
aws s3 cp ./localfile.txt s3://your-bucket-name/path/

# 6. Download a file from bucket
aws s3 cp s3://your-bucket-name/path/file.txt ./localpath/

# 7. Copy an object within S3
aws s3 cp s3://source-bucket/file.txt s3://destination-bucket/file.txt

# 8. Move (rename) an object
aws s3 mv s3://your-bucket-name/oldname.txt s3://your-bucket-name/newname.txt

# 9. Delete an object
aws s3 rm s3://your-bucket-name/path/file.txt

# 10. Sync local directory to S3 bucket
aws s3 sync ./localfolder s3://your-bucket-name/folder/

# 11. Sync S3 bucket to local directory
aws s3 sync s3://your-bucket-name/folder/ ./localfolder

# 12. Get bucket policy
aws s3api get-bucket-policy --bucket your-bucket-name

# 13. Put bucket policy (policy.json must be in same folder or provide full path)
aws s3api put-bucket-policy --bucket your-bucket-name --policy file://policy.json
: '
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::your-bucket-name/*"
      ]
    }
  ]
}
'

# 14. List all objects with metadata
aws s3api list-objects --bucket your-bucket-name

# 15. Create multipart upload (returns UploadId)
aws s3api create-multipart-upload --bucket your-bucket-name --key largefile.zip

# 16. Upload a part (replace UploadId and part number)
aws s3api upload-part --bucket your-bucket-name --key largefile.zip --part-number 1 --body part1.zip --upload-id UploadIdValue

# 17. Abort multipart upload
aws s3api abort-multipart-upload --bucket your-bucket-name --key largefile.zip --upload-id UploadIdValue

# 18. Get bucket ACL
aws s3api get-bucket-acl --bucket your-bucket-name

# 19. Put bucket ACL (example: public-read)
aws s3api put-bucket-acl --bucket your-bucket-name --acl public-read

# 20. Add tags to bucket
aws s3api put-bucket-tagging --bucket your-bucket-name --tagging 'TagSet=[{Key=Environment,Value=Dev},{Key=Project,Value=MyProject}]'

# 21. Get bucket tags
aws s3api get-bucket-tagging --bucket your-bucket-name

# 22. Delete bucket tags
aws s3api delete-bucket-tagging --bucket your-bucket-name

# 23. Enable transfer acceleration
aws s3api put-bucket-accelerate-configuration --bucket your-bucket-name --accelerate-configuration Status=Enabled

# 24. Get transfer acceleration status
aws s3api get-bucket-accelerate-configuration --bucket your-bucket-name

# 25. Disable transfer acceleration
aws s3api put-bucket-accelerate-configuration --bucket your-bucket-name --accelerate-configuration Status=Suspended

# 26. Replication configuration (replication.json required)
aws s3api put-bucket-replication --bucket your-bucket-name --replication-configuration file://replication.json

:'{
  "Role": "arn:aws:iam::123456789012:role/replication-role",
  "Rules": [
    {
      "Status": "Enabled",
      "Prefix": "",
      "Destination": {
        "Bucket": "arn:aws:s3:::destination-bucket-name",
        "StorageClass": "STANDARD"
      }
    }
  ]
}
'

# 27. Get replication configuration
aws s3api get-bucket-replication --bucket your-bucket-name

# 28. Put object tagging
aws s3api put-object-tagging --bucket your-bucket-name --key path/to/object.txt --tagging 'TagSet=[{Key=key1,Value=value1},{Key=key2,Value=value2}]'

# 29. Get object tagging
aws s3api get-object-tagging --bucket your-bucket-name --key path/to/object.txt

# 30. Delete object tagging
aws s3api delete-object-tagging --bucket your-bucket-name --key path/to/object.txt

# 31. Put bucket notification config (notification.json required)
aws s3api put-bucket-notification-configuration --bucket your-bucket-name --notification-configuration file://notification.json

# 32. Get bucket notification config
aws s3api get-bucket-notification-configuration --bucket your-bucket-name

# 33. Restore archived object (Glacier)
aws s3api restore-object --bucket your-bucket-name --key archive-object.txt --restore-request Days=7

# 34. Generate pre-signed URL (valid for 3600 seconds)
aws s3 presign s3://your-bucket-name/object.txt --expires-in 3600

# 35. Get object metadata
aws s3api head-object --bucket your-bucket-name --key object.txt

# 36. Copy object
aws s3 cp s3://source-bucket/object.txt s3://destination-bucket/object.txt

# 37. Move (rename) object
aws s3 mv s3://your-bucket-name/oldname.txt s3://your-bucket-name/newname.txt

# End of AWS S3 CLI commands cheat sheet
