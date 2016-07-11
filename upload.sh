#!/usr/bin/env bash

USER=`id -u -n`
RESOURCE_GROPUP="${USER}.dev"
REGION="westus"
STORAGE_ACCOUNT="${USER}jars"
CONTAINER=${PWD##*/}

JARFILE="target/scala-2.10/countwords.jar"

function jsonValue() {
  KEY=$1
  num=$2
  awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

TEMP=`azure storage account connectionstring show --json -g $RESOURCE_GROPUP $STORAGE_ACCOUNT`
TEMP=$(echo $TEMP | jsonValue string 1)
export AZURE_STORAGE_CONNECTION_STRING="$(sed -e 's/[[:space:]]*$//' <<<${TEMP})"

azure storage blob upload "./$JARFILE" $CONTAINER $CONTAINER

#azure storage container sas create --json --permissions r --expiry "08/01/2016"

