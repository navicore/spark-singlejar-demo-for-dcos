package onextent.spark.demo.countwords

/**
  * Created by navicore on 7/7/16.
  */
class CountFromUrl {

  val html = scala.io.Source.fromURL("https://spark.apache.org/").mkString
  val list = html.split("\n").filter(_ != "")
  val rdds = sc.parallelize(list)
  val count = rdds.filter(_.contains("Spark")).count()
}
