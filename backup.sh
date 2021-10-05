#!/bin/bash
set -x -e

FILENAME="mysqldump_$(date +%F_%H-%M).sql.gz"

echo Backing up databases to $FILENAME

mysqldump -u${MYSQL_USER:-root} \
        -p"${MYSQL_PASSWORD}" \
        -h ${MYSQL_HOST:-127.0.0.1} \
        -P ${MYSQL_PORT:-3306} \
        --single-transaction \
        --routines \
        --triggers \
        --databases $MYSQL_DATABASES | pigz > $FILENAME

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region ${AWS_DEFAULT_REGION:-eu-central-1}

aws s3 cp --endpoint-url=$AWS_ENDPOINT $FILENAME s3://${AWS_BUCKET}${AWS_BUCKET_PATH}/${FILENAME}