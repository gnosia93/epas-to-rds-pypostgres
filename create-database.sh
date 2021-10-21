#! /bin/bash

PPAS_IP=`aws ec2 describe-instances --region=ap-northeast-2 \
    --filters "Name=tag:Name,Values=tf_ppas_13" "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].{PrivateIpAddress:PrivateIpAddress}" \
    --output=text`
PPAS_PORT=5444

RDS_IP=`aws rds describe-db-instances --region=ap-northeast-2 \
    --db-instance-identifier tf-postgres-rds \
    --query "DBInstances[].Endpoint.Address" \
    --output=text`
RDS_PORT=5432

echo 'create epas database.. ip '$PPAS_IP
psql -U enterprisedb -d edb -h $PPAS_IP -p $PPAS_PORT -a -f ./ppas-database.sql

echo 'create rds database.. endpoint '$RDS_IP
psql -U postgres -d postgres -h $RDS_IP -p $RDS_PORT -a -f ./rds-database.sql
