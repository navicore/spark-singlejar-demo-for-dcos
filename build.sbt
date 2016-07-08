name         := "sparkdemo"
version      := "1.0"
organization := "OnExtent"

scalaVersion := "2.10.4"//

libraryDependencies += "org.apache.spark" %% "spark-core" % "1.6.0" % "provided"

resolvers += Resolver.mavenLocal

mainClass in assembly := Some("onextent.spark.demo.countwords.CountFromUrl")
assemblyJarName in assembly := "countwords.jar"

