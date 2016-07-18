#!/usr/bin/env bash

MAINCLASS="onextent.spark.demo.countwords.CountFromUrl"

USER=`id -u -n`
STORAGE_ACCOUNT="${USER}jars"
CONTAINER=${PWD##*/}

TEMP=$(dcos spark run --submit-args="--class $MAINCLASS https://${STORAGE_ACCOUNT}.blob.core.windows.net/$CONTAINER/$CONTAINER")

SID=$(echo $TEMP | cut -d':' -f 2 | sed -e 's/[[:space:]]*$//')  # get all after ':' and trim

echo "dcos task id: $SID"
dcos spark log --follow $SID || { echo "see log via command: dcos task log $SID --completed"; exit 1; };

