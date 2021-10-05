# MySQL AWS Backups

| Environment Variable  | Description                                                                                              | Default      |
|-----------------------|----------------------------------------------------------------------------------------------------------|--------------|
| MYSQL_USER            | Username of the MySQL user being used to backup                                                          | root         |
| MYSQL_PASSWORD        | Password to authenticate with MYSQL_USER                                                                 |              |
| MYSQL_HOST            | IP/Hostname of the MySQL Server                                                                          | 127.0.0.1    |
| MYSQL_DATABASES       | **REQUIRED** Database names that need to be backed up (split by " ") ie. `my_database my_other_database` |              |
| AWS_ENDPOINT          | **REQUIRED** S3 Compatible endpoint to upload the backup file to                                         |              |
| AWS_ACCESS_KEY_ID     | **REQUIRED** AccessKeyId of the user being used to upload the file                                       |              |
| AWS_SECRET_ACCESS_KEY | **REQUIRED** SecretAccessKey of the user being used to upload the file                                   |              |
| AWS_DEFAULT_REGION    | The AWS region used to upload the backup.                                                                | eu-central-1 |
| AWS_BUCKET            | **REQUIRED** The name of the bucket where backups are uploaded                                           |              |
| AWS_BUCKET_PATH       | The path where backups will be stored                                                                    | /            |