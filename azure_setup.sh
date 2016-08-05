#!/usr/bin/env bash

export HTTPS_PROXY=http://localhost:8888 azure

USER=`id -u -n`
RESOURCE_GROPUP="${USER}.dev"
REGION="westus"
STORAGE_ACCOUNT="${USER}jars"
CONTAINER=${PWD##*/}

azure config mode arm

azure group create -n "$RESOURCE_GROPUP" -l "$REGION"

#note, forced to use centralus for blob storage
azure storage account create --sku-name LRS -l centralus --kind blobstorage --access-tier cool -g $RESOURCE_GROPUP $STORAGE_ACCOUNT
TEMP=`azure storage account connectionstring show --json -g $RESOURCE_GROPUP $STORAGE_ACCOUNT`

function jsonValue() {
  KEY=$1
  num=$2
  awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

TEMP=$(echo $TEMP | jsonValue string 1)
export AZURE_STORAGE_CONNECTION_STRING="$(sed -e 's/[[:space:]]*$//' <<<${TEMP})"

azure storage container create $CONTAINER -p Blob

