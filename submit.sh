#!/usr/bin/env bash

# get username
# get container name: "bits"?
# get jar name: "dir"?
# get class name: "grep build.sbt"

# create folder if not exist
# create container if not exist
# copy jar

dcos spark run --submit-args="--class onextent.spark.demo.countwords.CountFromUrl target/scala-2.10/countwords.jar"

#check rc

#todo: do it all in sbt

