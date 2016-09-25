Weather Balloon: Spark Application for predicting weather.

•	Setting Up Spark Cluster: Running Spark on EC2
1.	Install Spark on your local.
2.	For Spark, pre-install Java. 

•	Next steps:
1.	Create an Amazon EC2 keypair.
2.	Before using spark-ec2 script, set the environment variables: AWS_ACCESS_KEY_ID  and AWS_SECRET_ACCESS_KEY  to Amazon EC2 access key ID and secret access key.
3.	Then run the command :
4.	./spark-ec2 -k <keypair> -i <key-file> -s <num-slaves> launch <cluster-name>
5.	Once the cluster is launched it can be found at :
6.	http://<master-hostname>:8080

•	Cluster configurations:
1.	Using the existing cluster:
./spark-ec2 -k <keypair> -i <key-file> -s <num-slaves> login <cluster-name>
2.	Destroying the cluster:
./spark-ec2 -k <keypair> -i <key-file> -s <num-slaves> destroy <cluster-name>

•	Post Cluster Setup:
(i)	Login to the cluster
(ii)	Sudo to Deploy user : command – 
su deploy
(iii)	Spark cluster is already set up and two folders are present which have the code for storm detecting algorithms in Spark.
•	  Commands to execute:
1.	cd basic_spark
2.	../spark/bin/spark-submit --class src.main.scala.com.cloudera.sparkhello.SparkHello --master local target/sparkhello-0.0.1-SNAPSHOT.jar TestString 
// This is the program which accepts the string and prints it 10 times.
**Later, this code will be modified to read and write to S3 buckets.**	

3.	Cd predict_weather
4.	../spark/bin/spark-submit --class src.main.scala.com.cloudera.sparkwordcount.SparkWordCount --master local target/sparkwordcount-0.0.1-SNAPSHOT.jar inputfile.txt 2
This is simple word count example to test whether we are able to read/write from local/hdfs and write to local/hdfs.
Please note that below are one time activity, we don’t need to launch the cluster every time, just use login to existing cluster.

 
	
