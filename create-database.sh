#! /bin/bash

PPAS_IP=`aws ec2 describe-instances --region=ap-northeast-2 \
    --filters "Name=tag:Name,Values=tf_ppas_13" "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].{PrivateIpAddress:PrivateIpAddress}" \
    --output=text`
PPAS_PORT=5444

echo 'ppas ip '$PPAS_IP
psql -U enterprisedb -d edb -h $PPAS_IP -p $PPAS_PORT -a -f ./ppas-database.sql
