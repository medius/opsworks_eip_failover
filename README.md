# opsworks_eip_failover

From: http://hipsterdevblog.com/blog/2015/01/22/automated-haproxy-failover-on-opsworks/

IAM permissions
Next you need to add additional policies to the EC2 IAM role used by your HAProxy instances. There’s more details on finding your instance role in one of my previous posts.

remap_eip
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1421894206000",
      "Effect": "Allow",
      "Action": [
        "opsworks:AssociateElasticIp"
      ],
      "Resource": [
        "arn:aws:opsworks:*:*:stack/<my stack ID>/*"
      ]
    }
  ]
}

sns_alert
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1421894344000",
      "Effect": "Allow",
      "Action": [
        "sns:Publish"
      ],
      "Resource": [
        "<my SNS ARN>"
      ]
    }
  ]
}
Don’t forget to replace <my stack ID> and <my SNS ARN> with your own values.

Editing custom stack JSON
Edit your stack settings and add the following to your custom JSON.

custom_json
{
   "stack": {
      "primary_ip":"<my EIP>",
      "failover_topic":"<my SNS ARN>"
   }
}


