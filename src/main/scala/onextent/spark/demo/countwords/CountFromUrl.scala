package onextent.spark.demo.countwords

import org.apache.spark.{SparkConf, SparkContext}

/**
  * Created by navicore on 7/7/16.
  */
object CountFromUrl {

  def main(args: Array[String]) {
    System.setProperty("spark.mesos.coarse", "true")
    //val MESOS_MASTER = System.getProperty("MESOS_MASTER","mesos://dcos-master-42450089-0:5050")
    val conf = new SparkConf()
      //.setMaster(MESOS_MASTER)
      //.setMaster(s"mesos://$MESOS_MASTER:7077")
      //.setMaster("local")
      .setAppName("Count From Url")
    //  .set("spark.executor.uri", "<path to spark-1.6.2.tar.gz uploaded above>")
    val sc = new SparkContext(conf)
    val html = scala.io.Source.fromURL("https://spark.apache.org/").mkString
    val list = html.split("\n").filter(_ != "")
    val rdds = sc.parallelize(list)
    val count = rdds.filter(_.contains("Spark")).count()
    println(s"see this............? ejs: $count")
  }
}

