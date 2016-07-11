#!/usr/bin/env bash

dcos spark run --submit-args="--class onextent.spark.demo.countwords.CountFromUrl https://navicorejars.blob.core.windows.net/spark-singlejar-demo/spark-singlejar-demo"

