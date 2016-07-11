# spark-singlejar-demo
a template for creating a single jar spark job to be submitted to Spark on DC/OS

1. login with azure cli
2. create dcos cluster on azure (ACS worked for me)
3. install dcos cli: https://docs.mesosphere.com/1.7/usage/cli/install/
4. install spark via https://docs.mesosphere.com/1.7/usage/service-guides/spark://docs.mesosphere.com/1.7/usage/service-guides/spark/
5. create ssh tunnel to dcos via `ssh MYUSER@MYACCOUNT.westus.cloudapp.azure.com -p 2200 -L 8000:localhost:80`

