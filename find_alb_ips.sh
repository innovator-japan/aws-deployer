#!/bin/sh

INSTANCES=`aws elbv2 describe-target-health --target-group-arn=$1 | jq -r ".TargetHealthDescriptions[].Target.Id"`
aws ec2 describe-instances --instance-ids $INSTANCES | jq -r ".Reservations[].Instances[].NetworkInterfaces[].Association.PublicIp"
