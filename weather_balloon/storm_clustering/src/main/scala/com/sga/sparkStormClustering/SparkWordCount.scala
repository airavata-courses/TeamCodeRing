package src.main.scala.com.sga.sparkStormClustering
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import com.redislabs.provider.redis._

object SparkStormClustering {
        def main(args: Array[String]) {
        val source = scala.io.Source.fromFile("H://IUB//output.txt")
        val lines = try source.mkString finally source.close()
        print(lines)
      }  
}
