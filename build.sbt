name         := "sparkdemo"
version      := "1.0"
organization := "OnExtent"

scalaVersion := "2.10.4"//

libraryDependencies += "org.apache.spark" %% "spark-core" % "1.6.0" % "provided"

resolvers += Resolver.mavenLocal

mainClass in assembly := Some("onextent.spark.demo.countwords.CountFromUrl")
assemblyJarName in assembly := "countwords.jar"

lazy val uploadTask = TaskKey[Unit]("upload", "upload the super jar")
uploadTask:= { "./upload.sh" !  }
lazy val submitTask = TaskKey[Unit]("submit", "submit the jar to spark on dcos")
submitTask:= { "./submit.sh" !  }

