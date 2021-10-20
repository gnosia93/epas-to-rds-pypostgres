#! /bin/bash

PPAS_IP=`aws ec2 describe-instances --region=ap-northeast-2 \
    --filters "Name=tag:Name,Values=tf_ppas_13" "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].{PrivateIpAddress:PrivateIpAddress}" \
    --output=text`
PPAS_PORT=5444

echo $PPAS_IP
psql -U enterprisedb -d edb -h $PPAS_IP -p $PPAS_PORT -a -f ./ppas-schema.sql


#cp config.ini.ec2 config.ini
#find_replace_oracle_ip /home/ec2-user/pyoracle/config.ini "<11xe-oracle-private-ip>" tf_oracle_11xe
