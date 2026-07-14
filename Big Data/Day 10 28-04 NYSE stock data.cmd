# =================================================================================================================
#                                  Assigning the schema to the table
# =================================================================================================================
from pyspark.sql.types import StructType, StringType, IntegerType, DoubleType, LongType

schema_nyse = StructType().add("exchange_name",StringType(),True).add("stock_id",StringType(),True).add("stock_dt",StringType(),True).add("open",DoubleType(),True).add("high",DoubleType(),True).add("low",DoubleType(),True).add("close",DoubleType(),True).add("volume",LongType(),True).add("adj_close",DoubleType(),True)      

df_with_schema = spark.read.format("csv").option("header","False").schema(schema_nyse).load("/user/cddacmaylab407/nyse.csv")

df_with_schema.printSchema()

df_with_schema.show()

df_with_schema.registerTempTable("nyse")

df_StockVol = spark.sql("select stock_id, sum(volume) as total from nyse group by stock_id")

df_StockVol.rdd.getNumPartitions()

df_new = df_StockVol.repartition(1)

df_new.write.csv("hdfs://localhost:9000/user/labuser/pyspark1")


# =================================================================================================================
#                                                     PYSQL
# =================================================================================================================


ip-172-31-14-185 login: cddacmaylab407                                                                                                                                                     
Password:                                                                                                                                                                                  
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1084-aws x86_64)                                                                                                                           

  System information as of Tue Apr 28 09:30:56 UTC 2026                                                                                                                                    
                                                                                                                                                                                           
  System load:  0.28               Processes:             295                                                                                                                              
  Usage of /:   82.0% of 30.83GB   Users logged in:       15                                                                                                                               
  Memory usage: 28%                IPv4 address for ens5: 172.31.14.185                                                                                                                    
  Swap usage:   0%                                                                                                                                                                         
                                                                                                                                                                                           
  => There is 1 zombie process.                                                                                                                                                            
                                                                                                                                                                                           
Last login: Mon Apr 27 11:01:35 UTC 2026 from 127.0.0.1, 14.139.112.69 on pts/2                                                                                                            
cddacmaylab407@ip-172-31-14-185:~$                                                                                                                                                         
                                                                                                                                                      
cddacmaylab407@ip-172-31-14-185:~$
## -----------------------------------------------------------------------------------------------------------------------------------------------                                                                                                                                                                                                                                                                                                                                                   
cddacmaylab407@ip-172-31-14-185:~$ ls                                                                                                                                                      
Final_airlines  airports_mod.dat  nyse  routes.dat
## -----------------------------------------------------------------------------------------------------------------------------------------------
cddacmaylab407@ip-172-31-14-185:~$ ls                                                                                                                                                      
Final_airlines  NYSE.csv  airports_mod.dat  nyse  routes.dat                                         
cddacmaylab407@ip-172-31-14-185:~$                                                                                                                
## -----------------------------------------------------------------------------------------------------------------------------------------------                                         
cddacmaylab407@ip-172-31-14-185:~$                                                                                                                                                         
cddacmaylab407@ip-172-31-14-185:~$ ls                                                                                                                                                      
Final_airlines  airports_mod.dat  nyse  nyse.csv  routes.dat
cddacmaylab407@ip-172-31-14-185:~$                          
## -----------------------------------------------------------------------------------------------------------------------------------------------                                                                                                                               
cddacmaylab407@ip-172-31-14-185:~$ nano nyse.csv                                                                                                                                           
cddacmaylab407@ip-172-31-14-185:~$ hdfs dfs -put nyse.csv                                                                                                                                  
cddacmaylab407@ip-172-31-14-185:~$                                                                                                                                                         
## -----------------------------------------------------------------------------------------------------------------------------------------------                                         
cddacmaylab407@ip-172-31-14-185:~$                                                                                                                                                         
cddacmaylab407@ip-172-31-14-185:~$ hdfs dfs -ls                                                                                                                                            
Found 10 items                                                                                                                                                                             
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-27 13:29 .sparkStaging                                                                                                     
-rw-r--r--   3 cddacmaylab407 cddacmaylab407     509262 2026-04-26 10:52 ICICIBANK.csv                                                                                                     
-rw-r--r--   3 cddacmaylab407 cddacmaylab407     391894 2026-04-25 12:50 custs.txt                                                                                                         
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-23 06:44 data                                                                                                              
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-23 06:43 new_data                                                                                                          
-rw-r--r--   3 cddacmaylab407 cddacmaylab407   40990862 2026-04-28 09:36 nyse.csv                                                                                                          
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-23 09:48 spark1                                                                                                            
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-23 10:16 spark2                                                                                                            
-rw-r--r--   3 cddacmaylab407 cddacmaylab407    4518136 2026-04-25 12:50 txn.txt                                                                                                           
-rw-r--r--   3 cddacmaylab407 cddacmaylab407    4418144 2026-04-23 12:30 txns1.txt                                                                                                         
## -----------------------------------------------------------------------------------------------------------------------------------------------
cddacmaylab407@ip-172-31-14-185:~$
cddacmaylab407@ip-172-31-14-185:~$ export PYSPARK_PYTHON=/opt/anaconda3/bin/python                                                                                                         
cddacmaylab407@ip-172-31-14-185:~$ export PYSPARK_DRIVER_PYTHON=/opt/anaconda3/bin/python                                                                                                  
cddacmaylab407@ip-172-31-14-185:~$    

## -----------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                                                                     
cddacmaylab407@ip-172-31-14-185:~$ pyspark                                                                                                                                                 
Python 3.9.13 (main, Aug 25 2022, 23:26:10)                                                                                                                                                
[GCC 11.2.0] :: Anaconda, Inc. on linux                                                                                                                                                    
Type "help", "copyright", "credits" or "license" for more information.                                                                                                                     
26/04/28 09:42:19 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable                                             
Setting default log level to "WARN".                                                                                                                                                       
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).                                                                                               
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4041. Attempting port 4042.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4042. Attempting port 4043.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4043. Attempting port 4044.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4044. Attempting port 4045.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4045. Attempting port 4046.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4046. Attempting port 4047.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4047. Attempting port 4048.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4048. Attempting port 4049.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4049. Attempting port 4050.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4050. Attempting port 4051.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4051. Attempting port 4052.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4052. Attempting port 4053.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4053. Attempting port 4054.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4054. Attempting port 4055.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4055. Attempting port 4056.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4056. Attempting port 4057.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4057. Attempting port 4058.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4058. Attempting port 4059.                                                                                         
26/04/28 09:42:20 WARN Utils: Service 'SparkUI' could not bind on port 4059. Attempting port 4060.                                                                                         
26/04/28 09:42:21 WARN Client: Neither spark.yarn.jars nor spark.yarn.archive is set, falling back to uploading libraries under SPARK_HOME.                                                
Welcome to                                                                                                                                                                                 
      ____              __                                                                                                                                                                 
     / __/__  ___ _____/ /__                                                                                                                                                               
    _\ \/ _ \/ _ `/ __/  '_/                                                                                                                                                               
   /__ / .__/\_,_/_/ /_/\_\   version 3.1.2                                                                                                                                                
      /_/                                                                                                                                                                                  
                                                                                                                                                                                           
Using Python version 3.9.13 (main, Aug 25 2022 23:26:10)                                                                                                                                   
Spark context Web UI available at http://ip-172-31-14-185.ap-south-1.compute.internal:4060                                                                                                 
Spark context available as 'sc' (master = yarn, app id = application_1777355374234_0048).                                                                                                  
SparkSession available as 'spark'. 
                                                                                                                                                        
>>> import sys                                                                                                                                                                             
>>> rdd = sc.parallelize([1])                                                                                                                                                              
>>> rdd.map(lambda x: __import__("sys").version).collect()                                                                                                                                 
['3.9.13 (main, Aug 25 2022, 23:26:10) \n[GCC 11.2.0]']
>>>  

>>> from pyspark.sql.types import StructType, StringType, IntegerType, DoubleType, LongType                                                                                                                                                                                      
>>>                                                                                                                                                                                        
>>> schema_nyse = StructType().add("exchange_name",StringType(),True).add("stock_id",StringType(),True).add("stock_dt",StringType(),True).add("open",DoubleType(),True).add("high",DoubleType(),True).add("low",DoubleType(),True).add("close",DoubleType(),True).add("volume",LongType(),True).add("adj_close",DoubleType(),True)                                                    
>>>                                                                                                                                                   
>>>                                                                                                                                                                                        
>>> df1 = spark.read.format("csv").option("header","False").schema(schema_nyse).load("/user/cddacmaylab407/nyse.csv")                                                           
>>>                                                                                                                                                                                        
>>> df1.printSchema()                                                                                                                                                           
root                                                                                                                                                                                       
 |-- exchange_name: string (nullable = true)    -----                                                                                                                                    
 |-- stock_id: string (nullable = true)             |                                                                                                                                       
 |-- stock_dt: string (nullable = true)             |                                                                                                                                      
 |-- open: double (nullable = true)                  \                                                                                                                                       
 |-- high: double (nullable = true)                  /------ schema                                                                                                                                  
 |-- low: double (nullable = true)                  |                                                                                                                                     
 |-- close: double (nullable = true)                |                                                                                                                                       
 |-- volume: long (nullable = true)                 |                                                                                                                                       
 |-- adj_close: double (nullable = true)         ----                                                                                                                                          
                                                                                                                                                                                           
>>> 
>>> df1.count()                                                                                                                                                                            
735026
>>>                                                                                                                                                                                        
>>> df1.show()                                                                                                                                                                             
+-------------+--------+----------+----+----+----+-----+------+---------+                                                                                                                  
|exchange_name|stock_id|  stock_dt|open|high| low|close|volume|adj_close|                                                                                                                  
+-------------+--------+----------+----+----+----+-----+------+---------+                                                                                                                  
|         NYSE|     AEA|2010-02-08|4.42|4.42|4.21| 4.24|205500|     4.24|                                                                                                                  
|         NYSE|     AEA|2010-02-05|4.42|4.54|4.22| 4.41|194300|     4.41|                                                                                                                  
|         NYSE|     AEA|2010-02-04|4.55|4.69|4.39| 4.42|233800|     4.42|                                                                                                                  
|         NYSE|     AEA|2010-02-03|4.65|4.69| 4.5| 4.55|182100|     4.55|                                                                                                                  
|         NYSE|     AEA|2010-02-02|4.74| 5.0|4.62| 4.66|222700|     4.66|                                                                                                                  
|         NYSE|     AEA|2010-02-01|4.84|4.92|4.68| 4.75|194800|     4.75|                                                                                                                  
|         NYSE|     AEA|2010-01-29|4.97|5.05|4.76| 4.83|222900|     4.83|                                                                                                                  
|         NYSE|     AEA|2010-01-28|5.12|5.22|4.81| 4.98|283100|     4.98|                                                                                                                  
|         NYSE|     AEA|2010-01-27|4.82|5.16|4.79| 5.09|243500|     5.09|                                                                                                                  
|         NYSE|     AEA|2010-01-26|5.18|5.18|4.81| 4.84|554800|     4.84|                                                                                                                  
|         NYSE|     AEA|2010-01-25|5.42|5.48| 5.2| 5.22|257300|     5.22|                                                                                                                  
|         NYSE|     AEA|2010-01-22|5.52|5.59|5.31| 5.37|260800|     5.37|                                                                                                                  
|         NYSE|     AEA|2010-01-21|5.67|5.74|5.37| 5.51|264300|     5.51|                                                                                                                  
|         NYSE|     AEA|2010-01-20|5.65| 5.7|5.53| 5.66|244600|     5.66|                                                                                                                  
|         NYSE|     AEA|2010-01-19|5.54| 5.7|5.54| 5.69|368000|     5.69|                                                                                                                  
|         NYSE|     AEA|2010-01-15|5.48|5.55|5.33| 5.54|435500|     5.54|                                                                                                                  
|         NYSE|     AEA|2010-01-14|5.41| 5.5|5.39| 5.41|272200|     5.41|                                                                                                                  
|         NYSE|     AEA|2010-01-13| 5.5| 5.5|5.41| 5.45|176400|     5.45|                                                                                                                  
|         NYSE|     AEA|2010-01-12|5.47|5.51|5.41| 5.46|233100|     5.46|                                                                                                                  
|         NYSE|     AEA|2010-01-11|5.64|5.64|5.49| 5.55|178900|     5.55|                                                                                                                  
+-------------+--------+----------+----+----+----+-----+------+---------+                                                                                                                  
only showing top 20 rows 

## -----------------------------------------------------------------------------------------------------------------------------------------------
 
>>>                                                                                                                                                                                        
>>>                                                                                                                                                                                        
>>> df1.createOrReplaceTempView("nyse")                                                                                                                                                    
>>>                                                                                                                                                  
>>> df2 = spark.sql("select stock_id, sum(volume) as total from nyse group by stock_id")                                                                                                   
>>>                                                                                                                                                                                        
>>> df2.count()                                                                                                                                                                            
203
>>> 
>>> df2.show(203)                                                                                                                                                                          
+--------+-----------+
|stock_id|      total|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
|     APX|  140637400|                                                                                                                                                                     
|     AIV| 2922335500|                                                                                                                                                                     
|     AVY| 2597060500|                                                                                                                                                                     
|     AVX| 1347876500|                                                                                                                                                                     
|     AXP|40263020300|                                                                                                                                                                     
|     ARL|   46445200|                                                                                                                                                                     
|     AAV|  834246600|                                                                                                                                                                     
|     ARM| 2087366800|                                                                                                                                                                     
|     ASH| 2717488700|                                                                                                                                                                     
|     AOB| 1597133000|                                                                                                                                                                     
|     AEB|   53273300|                                                                                                                                                                     
|     ALE|  465167800|                                                                                                                                                                     
|     ACH| 1448279800|                                                                                                                                                                     
|     ABA|   11686500|                                                                                                                                                                     
|     ASF|  848352700|                                                                                                                                                                     
|     ABK|11899868300|                                                                                                                                                                     
|     ATU| 1226088700|                                                                                                                                                                     
|     ALG|   64657600|                                                                                                                                                                     
|      AM| 2963437400|                                                                                                                                                                     
|      AA|42061448400|                                                                                                                                                                     
|     AXA| 1240615500|                                                                                                                                                                     
|     ALL|11492379500|                                                                                                                                                                     
|     ACS| 3425004600|                                                                                                                                                                     
|     ADI|14597316000|                                                                                                                                                                     
|     ARB|  502288800|                                                                                                                                                                     
|     AZZ|  323604700|                                                                                                                                                                     
|     AKP|   34156700|                                                                                                                                                                     
|     AEF|   71458600|                                                                                                                                                                     
|     AGN| 7391686500|                                                                                                                                                                     
|     ARK|  408851300|                                                                                                                                                                     
|     ANN| 4892554900|                                                                                                                                                                     
|     ABM|  675519400|                                                                                                                                                                     
|     AOS|  601422200|                                                                                                                                                                     
|     AMB| 2093952900|                                                                                                                                                                     
|     ABD|  469354400|                                                                                                                                                                     
|     AER|  346989800|                                                                                                                                                                     
|      AV|    2295800|                                                                                                                                                                     
|     ABX|16691172100|                                                                                                                                                                     
|     ADX|  323399200|                                                                                                                                                                     
|     ALU|12804053900|                                                                                                                                                                     
|     ATE|   38969400|                                                                                                                                                                     
|     ACO|  519620500|                                                                                                                                                                     
|     AGU| 3564417500|                                                                                                                                                                     
|     AIR| 1041626000|                                                                                                                                                                     
|     ALX|   41840100|                                                                                                                                                                     
|     AGD|  100765300|                                                                                                                                                                     
|     ACC|  495415800|                                                                                                                                                                     
|     ARP|  382744400|                                                                                                                                                                     
|     ARE|  759981300|                                                                                                                                                                     
|     ACN| 6578886300|                                                                                                                                                                     
|     AIG| 7062693700|                                                                                                                                                                     
|     AFL| 8624168700|                                                                                                                                                                     
|     APH| 3807963100|                                                                                                                                                                     
|     AEC|  291003000|                                                                                                                                                                     
|     AEH|  113363800|                                                                                                                                                                     
|     AME| 1858864400|                                                                                                                                                                     
|     ASR|  241465300|                                                                                                                                                                     
|     ALY|  480412000|                                                                                                                                                                     
|     ADP|11358284900|                                                                                                                                                                     
|     AAP| 2802701500|                                                                                                                                                                     
|     AFC|   20584200|                                                                                                                                                                     
|     ATW| 2650897000|                                                                                                                                                                     
|     AEV|   54542900|                                                                                                                                                                     
|     AED|   69436400|                                                                                                                                                                     
|     ADM|15354593500|                                                                                                                                                                     
|     AFG| 1815621200|                                                                                                                                                                     
|     AMT| 6785453000|                                                                                                                                                                     
|      AU| 3143678800|                                                                                                                                                                     
|     AOL|  147580700|                                                                                                                                                                     
|     ALC|   64387900|                                                                                                                                                                     
|     AGL| 1050227500|                                                                                                                                                                     
|    ALEX|  104640400|                                                                                                                                                                     
|     AVB| 1870368200|                                                                                                                                                                     
|     AZN| 3418077300|                                                                                                                                                                     
|     AIZ| 1676102800|                                                                                                                                                                     
|     AHC|   78301600|                                                                                                                                                                     
|     APC|15555731900|                                                                                                                                                                     
|     ANW|  327122100|                                                                                                                                                                     
|     AES|11884945300|                                                                                                                                                                     
|     APL|  364876100|                                                                                                                                                                     
|     AVT| 3427089600|                                                                                                                                                                     
|     AHD|  102449600|                                                                                                                                                                     
|     AIN|  609794300|                                                                                                                                                                     
|     ACM|  699547300|                                                                                                                                                                     
|     AEM| 4338054800|                                                                                                                                                                     
|     AYN|   17421600|                                                                                                                                                                     
|     ABG|  458850900|                                                                                                                                                                     
|     AYE| 4285531900|                                                                                                                                                                     
|     AXL| 2904393700|                                                                                                                                                                     
|     AKR|  430730400|                                                                                                                                                                     
|      AI|  133066800|                                                                                                                                                                     
|    AGCO| 3699642100|                                                                                                                                                                     
|     ALB| 1575714100|                                                                                                                                                                     
|     ACF| 5453798000|                                                                                                                                                                     
|     AKS| 7720966200|                                                                                                                                                                     
|     ARI|   13758200|                                                                                                                                                                     
|     AVD|  227437900|                                                                                                                                                                     
|     ANF| 6513209000|                                                                                                                                                                     
|     ANR| 2846725700|                                                                                                                                                                     
|     AIB| 1208134500|                                                                                                                                                                     
|     ARO| 4092001300|                                                                                                                                                                     
|     AYI|  715313300|                                                                                                                                                                     
|     ATV|   69038900|                                                                                                                                                                     
|     ALF|   12404300|                                                                                                                                                                     
|     AEP| 7175043900|                                                                                                                                                                     
|     AWK|  449445900|                                                                                                                                                                     
|     ADS| 2098398000|                                                                                                                                                                     
|     AUO| 4642900600|                                                                                                                                                                     
|     AAI| 5246821400|                                                                                                                                                                     
|     AHT| 1060047600|                                                                                                                                                                     
|     ART|   42012600|                                                                                                                                                                     
|     ACV| 1668185800|                                                                                                                                                                     
|     ALV| 1339964100|                                                                                                                                                                     
|     AON| 5817971400|                                                                                                                                                                     
|     APF|  499342800|                                                                                                                                                                     
|     ATO|  873201100|                                                                                                                                                                     
|     AWR|  213545100|                                                                                                                                                                     
|     AWF|  790875600|                                                                                                                                                                     
|     AWP|  285215800|                                                                                                                                                                     
|     APA|11482389600|                                                                                                                                                                     
|     ABR|  268351700|                                                                                                                                                                     
|     ATR|  874445500|                                                                                                                                                                     
|     ABV| 1579314800|                                                                                                                                                                     
|     AHL|  794405100|                                                                                                                                                                     
|     AAN|  817567400|                                                                                                                                                                     
|     AYR|  472431800|                                                                                                                                                                     
|     AEA|  483117300|                                                                                                                                                                     
|     AIT|  842036900|                                                                                                                                                                     
|     AMP| 2564267600|                                                                                                                                                                     
|     ACI| 7219904300|                                                                                                                                                                     
|     AMN|  192500700|                                                                                                                                                                     
|     AMD|47252808500|                                                                                                                                                                     
|     AET|30218027200|                                                                                                                                                                     
|     APU|  224190500|                                                                                                                                                                     
|     AFN|  601246500|                                                                                                                                                                     
|     ANH| 1407062000|                                                                                                                                                                     
|      AB| 1125446300|                                                                                                                                                                     
|     AGC|   78965000|                                                                                                                                                                     
|     AVK|  123961500|                                                                                                                                                                     
|     AOI|  997663000|                                                                                                                                                                     
|     AMG| 1377892200|                                                                                                                                                                     
|     ADC|   84477600|                                                                                                                                                                     
|     AEO|14731442100|                                                                                                                                                                     
|     ARW| 2958506000|                                                                                                                                                                     
|     ALZ|   19964700|                                                                                                                                                                     
|     AEL|  683272700|                                                                                                                                                                     
|     AAR|   49882000|                                                                                                                                                                     
|    ABVT|   49839000|                                                                                                                                                                     
|     ARG| 1713739100|                                                                                                                                                                     
|     AXS| 1236174900|                                                                                                                                                                     
|     ABT|25664130200|                                                                                                                                                                     
|     AFF|   87791300|                                                                                                                                                                     
|     AWI|  246435700|                                                                                                                                                                     
|     AMX|11000819500|                                                                                                                                                                     
|     AOD|  538957600|                                                                                                                                                                     
|     ATI| 3633566200|                                                                                                                                                                     
|     AJG| 1741323700|                                                                                                                                                                     
|     ALM|   20421200|                                                                                                                                                                     
|     ASI|   58295700|                                                                                                                                                                     
|     ASA|  674549000|                                                                                                                                                                     
|     ABB| 4532301800|                                                                                                                                                                     
|     ACL| 1176516200|                                                                                                                                                                     
|     AXE| 1503508400|                                                                                                                                                                     
|     AGO| 1356870600|                                                                                                                                                                     
|     ADY|   93691400|                                                                                                                                                                     
|     AHS|  615786600|                                                                                                                                                                     
|     ALQ|    8098900|                                                                                                                                                                     
|     AVP|20750196700|                                                                                                                                                                     
|     ALD| 2556923500|                                                                                                                                                                     
|     ATT|   99347600|                                                                                                                                                                     
|     APD| 5601186900|                                                                                                                                                                     
|     ARJ|  289810600|                                                                                                                                                                     
|     AFE|   10805200|                                                                                                                                                                     
|     AWH|  241105700|                                                                                                                                                                     
|     AKT|   41654000|                                                                                                                                                                     
|     ACG| 1481168200|                                                                                                                                                                     
|     AXR|  107629900|                                                                                                                                                                     
|     AFB|   98894100|                                                                                                                                                                     
|     ATK|  933991800|                                                                                                                                                                     
|     ASX| 1045139800|                                                                                                                                                                     
|     ASP|   42257700|                                                                                                                                                                     
|     ALJ|  428456900|                                                                                                                                                                     
|     ABC|11439581700|                                                                                                                                                                     
|     ARD|  691227500|                                                                                                                                                                     
|      AN| 6153959200|                                                                                                                                                                     
|     AGP| 1425712200|                                                                                                                                                                     
|     AZO| 3366821200|                                                                                                                                                                     
|     AUY|11034706100|                                                                                                                                                                     
|     APB|  270705600|                                                                                                                                                                     
|     AEE| 2402481500|                                                                                                                                                                     
|     AGM|  270396200|                                                                                                                                                                     
|     ALK| 1800717700|                                                                                                                                                                     
|     AMR|22505621700|                                                                                                                                                                     
|     AWC|  259152600|                                                                                                                                                                     
|     AVF|  129141600|                                                                                                                                                                     
|     AEG| 1753381400|                                                                                                                                                                     
|      AP|  158385300|                                                                                                                                                                     
|     AVA|  990505000|                                                                                                                                                                     
|     ASG|  239830100|                                                                                                                                                                     
|     AKF|   49757200|                                                                                                                                                                     
|     AIQ|  387333900|                                                                                                                                                                     
|      AF| 2789196400|                                                                                                                                                                     
|     ACE| 5224896200|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
                                                                                                                                                                                           
>>>>>> df2 = spark.sql("select stock_id, sum(volume) as total from nyse group by stock_id order by stock_id")                                                                                 
>>> df2.show(100)                                                                                                                                                                          
+--------+-----------+
|stock_id|      total|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
|      AA|42061448400|                                                                                                                                                                     
|     AAI| 5246821400|                                                                                                                                                                     
|     AAN|  817567400|                                                                                                                                                                     
|     AAP| 2802701500|                                                                                                                                                                     
|     AAR|   49882000|                                                                                                                                                                     
|     AAV|  834246600|                                                                                                                                                                     
|      AB| 1125446300|                                                                                                                                                                     
|     ABA|   11686500|                                                                                                                                                                     
|     ABB| 4532301800|                                                                                                                                                                     
|     ABC|11439581700|                                                                                                                                                                     
|     ABD|  469354400|                                                                                                                                                                     
|     ABG|  458850900|                                                                                                                                                                     
|     ABK|11899868300|                                                                                                                                                                     
|     ABM|  675519400|                                                                                                                                                                     
|     ABR|  268351700|                                                                                                                                                                     
|     ABT|25664130200|                                                                                                                                                                     
|     ABV| 1579314800|                                                                                                                                                                     
|    ABVT|   49839000|                                                                                                                                                                     
|     ABX|16691172100|                                                                                                                                                                     
|     ACC|  495415800|                                                                                                                                                                     
|     ACE| 5224896200|                                                                                                                                                                     
|     ACF| 5453798000|                                                                                                                                                                     
|     ACG| 1481168200|                                                                                                                                                                     
|     ACH| 1448279800|                                                                                                                                                                     
|     ACI| 7219904300|                                                                                                                                                                     
|     ACL| 1176516200|                                                                                                                                                                     
|     ACM|  699547300|                                                                                                                                                                     
|     ACN| 6578886300|                                                                                                                                                                     
|     ACO|  519620500|                                                                                                                                                                     
|     ACS| 3425004600|                                                                                                                                                                     
|     ACV| 1668185800|                                                                                                                                                                     
|     ADC|   84477600|                                                                                                                                                                     
|     ADI|14597316000|                                                                                                                                                                     
|     ADM|15354593500|                                                                                                                                                                     
|     ADP|11358284900|                                                                                                                                                                     
|     ADS| 2098398000|                                                                                                                                                                     
|     ADX|  323399200|                                                                                                                                                                     
|     ADY|   93691400|                                                                                                                                                                     
|     AEA|  483117300|                                                                                                                                                                     
|     AEB|   53273300|                                                                                                                                                                     
|     AEC|  291003000|                                                                                                                                                                     
|     AED|   69436400|                                                                                                                                                                     
|     AEE| 2402481500|                                                                                                                                                                     
|     AEF|   71458600|                                                                                                                                                                     
|     AEG| 1753381400|                                                                                                                                                                     
|     AEH|  113363800|                                                                                                                                                                     
|     AEL|  683272700|                                                                                                                                                                     
|     AEM| 4338054800|                                                                                                                                                                     
|     AEO|14731442100|                                                                                                                                                                     
|     AEP| 7175043900|                                                                                                                                                                     
|     AER|  346989800|                                                                                                                                                                     
|     AES|11884945300|                                                                                                                                                                     
|     AET|30218027200|                                                                                                                                                                     
|     AEV|   54542900|                                                                                                                                                                     
|      AF| 2789196400|                                                                                                                                                                     
|     AFB|   98894100|                                                                                                                                                                     
|     AFC|   20584200|                                                                                                                                                                     
|     AFE|   10805200|                                                                                                                                                                     
|     AFF|   87791300|                                                                                                                                                                     
|     AFG| 1815621200|                                                                                                                                                                     
|     AFL| 8624168700|                                                                                                                                                                     
|     AFN|  601246500|                                                                                                                                                                     
|     AGC|   78965000|                                                                                                                                                                     
|    AGCO| 3699642100|                                                                                                                                                                     
|     AGD|  100765300|                                                                                                                                                                     
|     AGL| 1050227500|                                                                                                                                                                     
|     AGM|  270396200|                                                                                                                                                                     
|     AGN| 7391686500|                                                                                                                                                                     
|     AGO| 1356870600|                                                                                                                                                                     
|     AGP| 1425712200|                                                                                                                                                                     
|     AGU| 3564417500|                                                                                                                                                                     
|     AHC|   78301600|                                                                                                                                                                     
|     AHD|  102449600|                                                                                                                                                                     
|     AHL|  794405100|                                                                                                                                                                     
|     AHS|  615786600|                                                                                                                                                                     
|     AHT| 1060047600|                                                                                                                                                                     
|      AI|  133066800|                                                                                                                                                                     
|     AIB| 1208134500|                                                                                                                                                                     
|     AIG| 7062693700|                                                                                                                                                                     
|     AIN|  609794300|                                                                                                                                                                     
|     AIQ|  387333900|                                                                                                                                                                     
|     AIR| 1041626000|                                                                                                                                                                     
|     AIT|  842036900|                                                                                                                                                                     
|     AIV| 2922335500|                                                                                                                                                                     
|     AIZ| 1676102800|                                                                                                                                                                     
|     AJG| 1741323700|                                                                                                                                                                     
|     AKF|   49757200|                                                                                                                                                                     
|     AKP|   34156700|                                                                                                                                                                     
|     AKR|  430730400|                                                                                                                                                                     
|     AKS| 7720966200|                                                                                                                                                                     
|     AKT|   41654000|                                                                                                                                                                     
|     ALB| 1575714100|                                                                                                                                                                     
|     ALC|   64387900|                                                                                                                                                                     
|     ALD| 2556923500|                                                                                                                                                                     
|     ALE|  465167800|                                                                                                                                                                     
|    ALEX|  104640400|                                                                                                                                                                     
|     ALF|   12404300|                                                                                                                                                                     
|     ALG|   64657600|                                                                                                                                                                     
|     ALJ|  428456900|                                                                                                                                                                     
|     ALK| 1800717700|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
only showing top 100 rows                                                                                                                                                                  
                                                                                                                                                                                           
>>> df2 = spark.sql("select stock_id, sum(volume) as total from nyse group by stock_id order by total desc")                                                                               
>>> df2.show(100)                                                                                                                                                                          
+--------+-----------+
|stock_id|      total|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
|     AMD|47252808500|                                                                                                                                                                     
|      AA|42061448400|                                                                                                                                                                     
|     AXP|40263020300|                                                                                                                                                                     
|     AET|30218027200|                                                                                                                                                                     
|     ABT|25664130200|                                                                                                                                                                     
|     AMR|22505621700|                                                                                                                                                                     
|     AVP|20750196700|                                                                                                                                                                     
|     ABX|16691172100|                                                                                                                                                                     
|     APC|15555731900|                                                                                                                                                                     
|     ADM|15354593500|                                                                                                                                                                     
|     AEO|14731442100|                                                                                                                                                                     
|     ADI|14597316000|                                                                                                                                                                     
|     ALU|12804053900|                                                                                                                                                                     
|     ABK|11899868300|                                                                                                                                                                     
|     AES|11884945300|                                                                                                                                                                     
|     ALL|11492379500|                                                                                                                                                                     
|     APA|11482389600|                                                                                                                                                                     
|     ABC|11439581700|                                                                                                                                                                     
|     ADP|11358284900|                                                                                                                                                                     
|     AUY|11034706100|                                                                                                                                                                     
|     AMX|11000819500|                                                                                                                                                                     
|     AFL| 8624168700|                                                                                                                                                                     
|     AKS| 7720966200|                                                                                                                                                                     
|     AGN| 7391686500|                                                                                                                                                                     
|     ACI| 7219904300|                                                                                                                                                                     
|     AEP| 7175043900|                                                                                                                                                                     
|     AIG| 7062693700|                                                                                                                                                                     
|     AMT| 6785453000|                                                                                                                                                                     
|     ACN| 6578886300|                                                                                                                                                                     
|     ANF| 6513209000|                                                                                                                                                                     
|      AN| 6153959200|                                                                                                                                                                     
|     AON| 5817971400|                                                                                                                                                                     
|     APD| 5601186900|                                                                                                                                                                     
|     ACF| 5453798000|                                                                                                                                                                     
|     AAI| 5246821400|                                                                                                                                                                     
|     ACE| 5224896200|                                                                                                                                                                     
|     ANN| 4892554900|                                                                                                                                                                     
|     AUO| 4642900600|                                                                                                                                                                     
|     ABB| 4532301800|                                                                                                                                                                     
|     AEM| 4338054800|                                                                                                                                                                     
|     AYE| 4285531900|                                                                                                                                                                     
|     ARO| 4092001300|                                                                                                                                                                     
|     APH| 3807963100|                                                                                                                                                                     
|    AGCO| 3699642100|                                                                                                                                                                     
|     ATI| 3633566200|                                                                                                                                                                     
|     AGU| 3564417500|                                                                                                                                                                     
|     AVT| 3427089600|                                                                                                                                                                     
|     ACS| 3425004600|                                                                                                                                                                     
|     AZN| 3418077300|                                                                                                                                                                     
|     AZO| 3366821200|                                                                                                                                                                     
|      AU| 3143678800|                                                                                                                                                                     
|      AM| 2963437400|                                                                                                                                                                     
|     ARW| 2958506000|                                                                                                                                                                     
|     AIV| 2922335500|                                                                                                                                                                     
|     AXL| 2904393700|                                                                                                                                                                     
|     ANR| 2846725700|                                                                                                                                                                     
|     AAP| 2802701500|                                                                                                                                                                     
|      AF| 2789196400|                                                                                                                                                                     
|     ASH| 2717488700|                                                                                                                                                                     
|     ATW| 2650897000|                                                                                                                                                                     
|     AVY| 2597060500|                                                                                                                                                                     
|     AMP| 2564267600|                                                                                                                                                                     
|     ALD| 2556923500|                                                                                                                                                                     
|     AEE| 2402481500|                                                                                                                                                                     
|     ADS| 2098398000|                                                                                                                                                                     
|     AMB| 2093952900|                                                                                                                                                                     
|     ARM| 2087366800|                                                                                                                                                                     
|     AVB| 1870368200|                                                                                                                                                                     
|     AME| 1858864400|                                                                                                                                                                     
|     AFG| 1815621200|                                                                                                                                                                     
|     ALK| 1800717700|                                                                                                                                                                     
|     AEG| 1753381400|                                                                                                                                                                     
|     AJG| 1741323700|                                                                                                                                                                     
|     ARG| 1713739100|                                                                                                                                                                     
|     AIZ| 1676102800|                                                                                                                                                                     
|     ACV| 1668185800|                                                                                                                                                                     
|     AOB| 1597133000|                                                                                                                                                                     
|     ABV| 1579314800|                                                                                                                                                                     
|     ALB| 1575714100|                                                                                                                                                                     
|     AXE| 1503508400|                                                                                                                                                                     
|     ACG| 1481168200|                                                                                                                                                                     
|     ACH| 1448279800|                                                                                                                                                                     
|     AGP| 1425712200|                                                                                                                                                                     
|     ANH| 1407062000|                                                                                                                                                                     
|     AMG| 1377892200|                                                                                                                                                                     
|     AGO| 1356870600|                                                                                                                                                                     
|     AVX| 1347876500|                                                                                                                                                                     
|     ALV| 1339964100|                                                                                                                                                                     
|     AXA| 1240615500|                                                                                                                                                                     
|     AXS| 1236174900|                                                                                                                                                                     
|     ATU| 1226088700|                                                                                                                                                                     
|     AIB| 1208134500|                                                                                                                                                                     
|     ACL| 1176516200|                                                                                                                                                                     
|      AB| 1125446300|                                                                                                                                                                     
|     AHT| 1060047600|                                                                                                                                                                     
|     AGL| 1050227500|                                                                                                                                                                     
|     ASX| 1045139800|                                                                                                                                                                     
|     AIR| 1041626000|                                                                                                                                                                     
|     AOI|  997663000|                                                                                                                                                                     
|     AVA|  990505000|                                                                                                                                                                     
+--------+-----------+                                                                                                                                                                     
only showing top 100 rows                                                                                                                                                                  
                                                                                                                                                                                           
>>>      
                                                                                                                                                                                           
>>> df2 = spark.sql("select stock_id, max(volume) as total from nyse group by stock_id order by total desc")                                                                               
>>> df2.show(100)                                                                                                                                                                          
+--------+---------+
|stock_id|    total|                                                                                                                                                                       
+--------+---------+                                                                                                                                                                       
|     AVP|318182200|                                                                                                                                                                       
|      AA|242106500|                                                                                                                                                                       
|     AMD|163101700|                                                                                                                                                                       
|     AIG|148878600|                                                                                                                                                                       
|     ABK|112834200|                                                                                                                                                                       
|     AXL|103526300|                                                                                                                                                                       
|     AXP| 90336900|                                                                                                                                                                       
|     AMR| 89947900|                                                                                                                                                                       
|     ACE| 74437100|                                                                                                                                                                       
|     AET| 67642400|                                                                                                                                                                       
|     ACN| 67461400|                                                                                                                                                                       
|     AMT| 65933700|                                                                                                                                                                       
|     AEO| 65056500|                                                                                                                                                                       
|     AMX| 57124600|                                                                                                                                                                       
|     ALU| 57103300|                                                                                                                                                                       
|     AEP| 56681100|                                                                                                                                                                       
|     ALL| 56604600|                                                                                                                                                                       
|     ABC| 55356000|                                                                                                                                                                       
|     ABX| 53779000|                                                                                                                                                                       
|     AES| 53040600|                                                                                                                                                                       
|     ADM| 52414800|                                                                                                                                                                       
|     AFL| 46333400|                                                                                                                                                                       
|     ACF| 44222500|                                                                                                                                                                       
|     APC| 43898300|                                                                                                                                                                       
|     AUY| 42809600|                                                                                                                                                                       
|      AN| 38291000|                                                                                                                                                                       
|     ACS| 37480000|                                                                                                                                                                       
|     AGO| 37464500|                                                                                                                                                                       
|     AMP| 34678200|                                                                                                                                                                       
|     ADS| 34065800|                                                                                                                                                                       
|     AYE| 31984400|                                                                                                                                                                       
|     AAI| 30579000|                                                                                                                                                                       
|     AMB| 29707200|                                                                                                                                                                       
|     ABB| 28694800|                                                                                                                                                                       
|     ARG| 28645300|                                                                                                                                                                       
|     AKS| 28230500|                                                                                                                                                                       
|     ADI| 27748000|                                                                                                                                                                       
|     AIZ| 27565200|                                                                                                                                                                       
|     ABT| 27548800|                                                                                                                                                                       
|     APA| 25373700|                                                                                                                                                                       
|     ACI| 24998000|                                                                                                                                                                       
|     ADP| 24847400|                                                                                                                                                                       
|     APH| 23984300|                                                                                                                                                                       
|     AWK| 23402800|                                                                                                                                                                       
|     ARO| 21602700|                                                                                                                                                                       
|     ALD| 21033900|                                                                                                                                                                       
|     ANF| 20502200|                                                                                                                                                                       
|     AON| 20410300|                                                                                                                                                                       
|     AVX| 20160600|                                                                                                                                                                       
|     ACM| 20007900|                                                                                                                                                                       
|     ANR| 18039900|                                                                                                                                                                       
|     AEE| 17604800|                                                                                                                                                                       
|     ANH| 17243800|                                                                                                                                                                       
|     ATU| 17054400|                                                                                                                                                                       
|     ATO| 16714300|                                                                                                                                                                       
|     AGN| 16318700|                                                                                                                                                                       
|     AGU| 16235800|                                                                                                                                                                       
|     AOL| 16198700|                                                                                                                                                                       
|     AER| 16006200|                                                                                                                                                                       
|      AF| 15891600|                                                                                                                                                                       
|     ALV| 15690000|                                                                                                                                                                       
|     ANN| 15532200|                                                                                                                                                                       
|     AEM| 15153000|                                                                                                                                                                       
|     AZN| 14636100|                                                                                                                                                                       
|     AAP| 14007700|                                                                                                                                                                       
|     ACL| 13822300|                                                                                                                                                                       
|     AZO| 13666700|                                                                                                                                                                       
|     AIB| 13211000|                                                                                                                                                                       
|     AUO| 13161300|                                                                                                                                                                       
|     AOB| 13121100|                                                                                                                                                                       
|    AGCO| 13019500|                                                                                                                                                                       
|     ARM| 12342600|                                                                                                                                                                       
|     ASH| 11844500|                                                                                                                                                                       
|     AIV| 11583600|                                                                                                                                                                       
|     ACH| 11505300|                                                                                                                                                                       
|     AHT| 11057100|                                                                                                                                                                       
|     ATI| 10491300|                                                                                                                                                                       
|     ARW| 10397800|                                                                                                                                                                       
|      AM|  9857900|                                                                                                                                                                       
|     ACV|  9806700|                                                                                                                                                                       
|      AU|  9688700|                                                                                                                                                                       
|     AHL|  9500100|                                                                                                                                                                       
|     APD|  9338000|                                                                                                                                                                       
|     AGP|  9321600|                                                                                                                                                                       
|     AYR|  9144100|                                                                                                                                                                       
|     AVT|  8983800|                                                                                                                                                                       
|     ABV|  8896800|                                                                                                                                                                       
|     AXE|  8423900|                                                                                                                                                                       
|     AVB|  8169100|                                                                                                                                                                       
|     ATW|  8098800|                                                                                                                                                                       
|     ARB|  7975800|                                                                                                                                                                       
|     AGM|  7571700|                                                                                                                                                                       
|     ACG|  7523000|                                                                                                                                                                       
|     ARP|  7476300|                                                                                                                                                                       
|     AFN|  7388600|                                                                                                                                                                       
|     ANW|  7335100|                                                                                                                                                                       
|     ARE|  7218200|                                                                                                                                                                       
|     ALJ|  7136100|                                                                                                                                                                       
|     ATK|  7094500|                                                                                                                                                                       
|     AVY|  7039100|                                                                                                                                                                       
+--------+---------+                                                                                                                                                                       
only showing top 100 rows                                                                                                                                                                  
                                                                                                                                                                                           
>>>                                                                                                                                                                                        
>>>                                                                                                                                                                                        
>>> df2.rdd.getNumPartitions()                                                                                                                                                             
200
>>>

## -------------------------------------------------------------------------------------------------------------------------------- 
>>> rdd1 = sc.textFile("/user/cddacmaylab407/nyse.csv")                                                                                                                                    
>>>                                                                                                                                                                                        
>>> rdd2 = rdd1.map(lambda a: (a.split(",")[1], int(a.split(",")[7])  ))                                                                                                                   
>>>                                                                                                                                                                                        
>>> rdd3 = rdd2.reduceByKey(lambda a,b : a+b )                                                                                                                                             
>>>                                                                                                                                                                                        
>>> for line in rdd3.collect():                                                                                                                                                            
...     print(line)                                                                                                                                                                        
...                                                                                                                                                                                        
('ASP', 42257700)
('AIT', 842036900)                                                                                                                                                                         
('ATV', 69038900)                                                                                                                                                                          
('AMG', 1377892200)                                                                                                                                                                        
('ALZ', 19964700)                                                                                                                                                                          
('AA', 42061448400)                                                                                                                                                                        
('ATU', 1226088700)                                                                                                                                                                        
('ARG', 1713739100)                                                                                                                                                                        
('ADY', 93691400)                                                                                                                                                                          
('APL', 364876100)                                                                                                                                                                         
('AKT', 41654000)                                                                                                                                                                          
('AFG', 1815621200)                                                                                                                                                                        
('AGD', 100765300)                                                                                                                                                                         
('AFB', 98894100)                                                                                                                                                                          
('ATT', 99347600)                                                                                                                                                                          
('ADI', 14597316000)                                                                                                                                                                       
('ABB', 4532301800)                                                                                                                                                                        
('ARK', 408851300)                                                                                                                                                                         
('ALV', 1339964100)                                                                                                                                                                        
('AVK', 123961500)                                                                                                                                                                         
('ATE', 38969400)                                                                                                                                                                          
('AHS', 615786600)                                                                                                                                                                         
('ARD', 691227500)                                                                                                                                                                         
('AMX', 11000819500)                                                                                                                                                                       
('AKP', 34156700)                                                                                                                                                                          
('APF', 499342800)                                                                                                                                                                         
('AHT', 1060047600)                                                                                                                                                                        
('AOL', 147580700)                                                                                                                                                                         
('APH', 3807963100)                                                                                                                                                                        
('ANH', 1407062000)                                                                                                                                                                        
('AP', 158385300)                                                                                                                                                                          
('AZN', 3418077300)                                                                                                                                                                        
('ALE', 465167800)                                                                                                                                                                         
('AAV', 834246600)                                                                                                                                                                         
('ANW', 327122100)                                                                                                                                                                         
('ACC', 495415800)                                                                                                                                                                         
('ACO', 519620500)                                                                                                                                                                         
('AVD', 227437900)                                                                                                                                                                         
('ACI', 7219904300)                                                                                                                                                                        
('AWF', 790875600)                                                                                                                                                                         
('AHL', 794405100)                                                                                                                                                                         
('ART', 42012600)                                                                                                                                                                          
('ACF', 5453798000)                                                                                                                                                                        
('AIN', 609794300)                                                                                                                                                                         
('AVP', 20750196700)                                                                                                                                                                       
('AAP', 2802701500)                                                                                                                                                                        
('AIB', 1208134500)                                                                                                                                                                        
('ARE', 759981300)                                                                                                                                                                         
('AOD', 538957600)                                                                                                                                                                         
('ABV', 1579314800)                                                                                                                                                                        
('AAI', 5246821400)                                                                                                                                                                        
('AEM', 4338054800)                                                                                                                                                                        
('ALU', 12804053900)                                                                                                                                                                       
('ABA', 11686500)                                                                                                                                                                          
('ACG', 1481168200)                                                                                                                                                                        
('ATI', 3633566200)                                                                                                                                                                        
('AOI', 997663000)                                                                                                                                                                         
('ARB', 502288800)                                                                                                                                                                         
('AGP', 1425712200)                                                                                                                                                                        
('ASX', 1045139800)                                                                                                                                                                        
('AXS', 1236174900)                                                                                                                                                                        
('AMN', 192500700)                                                                                                                                                                         
('AEH', 113363800)                                                                                                                                                                         
('ADC', 84477600)                                                                                                                                                                          
('ARL', 46445200)                                                                                                                                                                          
('AON', 5817971400)                                                                                                                                                                        
('AMD', 47252808500)                                                                                                                                                                       
('ABD', 469354400)                                                                                                                                                                         
('AIV', 2922335500)                                                                                                                                                                        
('AGU', 3564417500)                                                                                                                                                                        
('AKR', 430730400)                                                                                                                                                                         
('AGO', 1356870600)                                                                                                                                                                        
('ARI', 13758200)                                                                                                                                                                          
('AVY', 2597060500)                                                                                                                                                                        
('ATW', 2650897000)                                                                                                                                                                        
('ALF', 12404300)                                                                                                                                                                          
('AUY', 11034706100)                                                                                                                                                                       
('AWR', 213545100)                                                                                                                                                                         
('AER', 346989800)                                                                                                                                                                         
('AIR', 1041626000)                                                                                                                                                                        
('AVF', 129141600)                                                                                                                                                                         
('AJG', 1741323700)                                                                                                                                                                        
('AMB', 2093952900)                                                                                                                                                                        
('AEP', 7175043900)                                                                                                                                                                        
('AYE', 4285531900)                                                                                                                                                                        
('AEF', 71458600)                                                                                                                                                                          
('AWC', 259152600)                                                                                                                                                                         
('AUO', 4642900600)                                                                                                                                                                        
('AEV', 54542900)                                                                                                                                                                          
('AFC', 20584200)                                                                                                                                                                          
('AED', 69436400)                                                                                                                                                                          
('AF', 2789196400)                                                                                                                                                                         
('AV', 2295800)                                                                                                                                                                            
('ABR', 268351700)                                                                                                                                                                         
('ALY', 480412000)                                                                                                                                                                         
('ARP', 382744400)                                                                                                                                                                         
('AZZ', 323604700)                                                                                                                                                                         
('ARW', 2958506000)                                                                                                                                                                        
('AGL', 1050227500)                                                                                                                                                                        
('AWP', 285215800)                                                                                                                                                                         
('ACV', 1668185800)                                                                                                                                                                        
('ABC', 11439581700)                                                                                                                                                                       
('AYI', 715313300)                                                                                                                                                                         
('AEA', 483117300)                                                                                                                                                                         
('ACM', 699547300)                                                                                                                                                                         
('ACH', 1448279800)                                                                                                                                                                        
('AVA', 990505000)                                                                                                                                                                         
('AEG', 1753381400)                                                                                                                                                                        
('ASF', 848352700)                                                                                                                                                                         
('ARO', 4092001300)                                                                                                                                                                        
('ASA', 674549000)                                                                                                                                                                         
('AHD', 102449600)                                                                                                                                                                         
('AEB', 53273300)                                                                                                                                                                          
('ASG', 239830100)                                                                                                                                                                         
('AEO', 14731442100)                                                                                                                                                                       
('AMP', 2564267600)                                                                                                                                                                        
('AXE', 1503508400)                                                                                                                                                                        
('AVT', 3427089600)                                                                                                                                                                        
('AGM', 270396200)                                                                                                                                                                         
('APD', 5601186900)                                                                                                                                                                        
('ASI', 58295700)                                                                                                                                                                          
('AWH', 241105700)                                                                                                                                                                         
('ARM', 2087366800)                                                                                                                                                                        
('ABK', 11899868300)                                                                                                                                                                       
('ABM', 675519400)                                                                                                                                                                         
('AVB', 1870368200)                                                                                                                                                                        
('AM', 2963437400)                                                                                                                                                                         
('AYN', 17421600)                                                                                                                                                                          
('ADM', 15354593500)                                                                                                                                                                       
('ATR', 874445500)                                                                                                                                                                         
('AKF', 49757200)                                                                                                                                                                          
('AU', 3143678800)                                                                                                                                                                         
('AB', 1125446300)                                                                                                                                                                         
('AEL', 683272700)                                                                                                                                                                         
('AWK', 449445900)                                                                                                                                                                         
('AMR', 22505621700)                                                                                                                                                                       
('APC', 15555731900)                                                                                                                                                                       
('ALL', 11492379500)                                                                                                                                                                       
('ALQ', 8098900)                                                                                                                                                                           
('ALK', 1800717700)                                                                                                                                                                        
('ACE', 5224896200)                                                                                                                                                                        
('ANN', 4892554900)                                                                                                                                                                        
('AFE', 10805200)                                                                                                                                                                          
('ABX', 16691172100)                                                                                                                                                                       
('APB', 270705600)                                                                                                                                                                         
('ATO', 873201100)                                                                                                                                                                         
('AIZ', 1676102800)                                                                                                                                                                        
('AHC', 78301600)                                                                                                                                                                          
('ADX', 323399200)                                                                                                                                                                         
('ALD', 2556923500)                                                                                                                                                                        
('ANF', 6513209000)                                                                                                                                                                        
('AOS', 601422200)                                                                                                                                                                         
('AIG', 7062693700)                                                                                                                                                                        
('AEE', 2402481500)                                                                                                                                                                        
('ABG', 458850900)                                                                                                                                                                         
('AFF', 87791300)                                                                                                                                                                          
('ANR', 2846725700)                                                                                                                                                                        
('ASH', 2717488700)                                                                                                                                                                        
('AAN', 817567400)                                                                                                                                                                         
('AXP', 40263020300)                                                                                                                                                                       
('AN', 6153959200)                                                                                                                                                                         
('ARJ', 289810600)                                                                                                                                                                         
('AIQ', 387333900)                                                                                                                                                                         
('AFN', 601246500)                                                                                                                                                                         
('AKS', 7720966200)                                                                                                                                                                        
('APX', 140637400)                                                                                                                                                                         
('AGC', 78965000)                                                                                                                                                                          
('AXR', 107629900)                                                                                                                                                                         
('ALJ', 428456900)                                                                                                                                                                         
('AOB', 1597133000)                                                                                                                                                                        
('ALX', 41840100)                                                                                                                                                                          
('AES', 11884945300)                                                                                                                                                                       
('ADS', 2098398000)                                                                                                                                                                        
('ALEX', 104640400)                                                                                                                                                                        
('ALC', 64387900)                                                                                                                                                                          
('ALG', 64657600)                                                                                                                                                                          
('ACN', 6578886300)                                                                                                                                                                        
('AFL', 8624168700)                                                                                                                                                                        
('AGCO', 3699642100)                                                                                                                                                                       
('AZO', 3366821200)                                                                                                                                                                        
('AAR', 49882000)                                                                                                                                                                          
('AEC', 291003000)                                                                                                                                                                         
('ALB', 1575714100)                                                                                                                                                                        
('APA', 11482389600)                                                                                                                                                                       
('ADP', 11358284900)                                                                                                                                                                       
('ACL', 1176516200)                                                                                                                                                                        
('AME', 1858864400)                                                                                                                                                                        
('ATK', 933991800)                                                                                                                                                                         
('AMT', 6785453000)                                                                                                                                                                        
('AET', 30218027200)                                                                                                                                                                       
('AYR', 472431800)                                                                                                                                                                         
('ASR', 241465300)                                                                                                                                                                         
('APU', 224190500)                                                                                                                                                                         
('AWI', 246435700)                                                                                                                                                                         
('ABVT', 49839000)                                                                                                                                                                         
('ACS', 3425004600)                                                                                                                                                                        
('AXA', 1240615500)                                                                                                                                                                        
('ABT', 25664130200)                                                                                                                                                                       
('AGN', 7391686500)                                                                                                                                                                        
('AVX', 1347876500)                                                                                                                                                                        
('AI', 133066800)                                                                                                                                                                          
('AXL', 2904393700)                                                                                                                                                                        
('ALM', 20421200)                                                                                                                                                                          
>>>  
>>>                                                                                                                                                                                        
>>> df2 = df2.coalesce(1)                                                                                                                                                                  
>>> df2.rdd.getNumPartitions()                                                                                                                                                             
1
>>> df2.write.csv("/user/cddacmaylab407/nyse_sparksql/spark1")                                                                                                                             
>>> 

>>> df3 = spark.sql("select stock_id,max(high) as high from nyse group by stock_id")                                                                                                       
>>> df3.show()                                                                                                                                                                             
+--------+-----+
|stock_id| high|                                                                                                                                                                           
+--------+-----+                                                                                                                                                                           
|     APX|12.38|                                                                                                                                                                           
|     AIV|65.79|                                                                                                                                                                           
|     AVY| 78.5|                                                                                                                                                                           
|     AVX|100.0|                                                                                                                                                                           
|     AXP|169.5|                                                                                                                                                                           
|     ARL|22.25|                                                                                                                                                                           
|     AAV|24.78|                                                                                                                                                                           
|     ARM| 32.5|                                                                                                                                                                           
|     ASH|76.25|                                                                                                                                                                           
|     AOB|14.48|                                                                                                                                                                           
|     AEB| 26.5|                                                                                                                                                                           
|     ALE| 51.7|                                                                                                                                                                           
|     ACH|111.6|                                                                                                                                                                           
|     ABA|27.94|                                                                                                                                                                           
|     ASF|89.12|                                                                                                                                                                           
|     ABK| 96.1|                                                                                                                                                                           
|     ATU|70.17|                                                                                                                                                                           
|     ALG|29.23|                                                                                                                                                                           
|      AM|62.88|                                                                                                                                                                           
|      AA|94.62|                                                                                                                                                                           
+--------+-----+                                                                                                                                                                           
only showing top 20 rows 

>>> df4 = spark.sql("select stock_id,max(high) as high,min(low) as low  from nyse group by stock_id")                                                                                      
>>> df4.show()                                                                                                                                                                             
+--------+-----+-----+
|stock_id| high|  low|                                                                                                                                                                     
+--------+-----+-----+                                                                                                                                                                     
|     APX|12.38| 5.55|                                                                                                                                                                     
|     AIV|65.79| 4.57|                                                                                                                                                                     
|     AVY| 78.5|14.13|                                                                                                                                                                     
|     AVX|100.0|  7.1|                                                                                                                                                                     
|     AXP|169.5| 9.71|                                                                                                                                                                     
|     ARL|22.25|  2.0|                                                                                                                                                                     
|     AAV|24.78| 1.87|                                                                                                                                                                     
|     ARM| 32.5| 0.32|                                                                                                                                                                     
|     ASH|76.25| 5.35|                                                                                                                                                                     
|     AOB|14.48| 1.02|                                                                                                                                                                     
|     AEB| 26.5| 2.48|                                                                                                                                                                     
|     ALE| 51.7|14.75|                                                                                                                                                                     
|     ACH|111.6| 7.22|                                                                                                                                                                     
|     ABA|27.94| 18.0|                                                                                                                                                                     
|     ASF|89.12| 1.99|                                                                                                                                                                     
|     ABK| 96.1| 0.35|                                                                                                                                                                     
|     ATU|70.17| 2.19|                                                                                                                                                                     
|     ALG|29.23| 6.88|                                                                                                                                                                     
|      AM|62.88| 3.24|                                                                                                                                                                     
|      AA|94.62| 4.97|                                                                                                                                                                     
+--------+-----+-----+                                                                                                                                                                     
only showing top 20 rows                                                                                                                                                                   
                                                                                                                                                                                                                     
>>> df5 = spark.sql("select stock_id,max(high) as high,min(low) as low, ((max(high)-min(low))/min(low))*100  as varience from nyse group by stock_id")
                                     
>>> df5.show()                                                                                                                                                                             
+--------+-----+-----+------------------+
|stock_id| high|  low|          varience|                                                                                                                                                  
+--------+-----+-----+------------------+                                                                                                                                                  
|     APX|12.38| 5.55| 123.0630630630631|                                                                                                                                                  
|     AIV|65.79| 4.57|1339.6061269146608|                                                                                                                                                  
|     AVY| 78.5|14.13|455.55555555555554|                                                                                                                                                  
|     AVX|100.0|  7.1|1308.4507042253522|                                                                                                                                                  
|     AXP|169.5| 9.71|1645.6230690010298|                                                                                                                                                  
|     ARL|22.25|  2.0|            1012.5|                                                                                                                                                  
|     AAV|24.78| 1.87| 1225.133689839572|                                                                                                                                                  
|     ARM| 32.5| 0.32|          10056.25|                                                                                                                                                  
|     ASH|76.25| 5.35|1325.2336448598132|                                                                                                                                                  
|     AOB|14.48| 1.02| 1319.607843137255|                                                                                                                                                  
|     AEB| 26.5| 2.48| 968.5483870967741|                                                                                                                                                  
|     ALE| 51.7|14.75|250.50847457627123|                                                                                                                                                  
|     ACH|111.6| 7.22|1445.7063711911358|                                                                                                                                                  
|     ABA|27.94| 18.0| 55.22222222222223|                                                                                                                                                  
|     ASF|89.12| 1.99| 4378.391959798996|                                                                                                                                                  
|     ABK| 96.1| 0.35|27357.142857142862|                                                                                                                                                  
|     ATU|70.17| 2.19| 3104.109589041096|                                                                                                                                                  
|     ALG|29.23| 6.88|324.85465116279073|                                                                                                                                                  
|      AM|62.88| 3.24|1840.7407407407404|                                                                                                                                                  
|      AA|94.62| 4.97|1803.8229376257548|                                                                                                                                                  
+--------+-----+-----+------------------+                                                                                                                                                  
only showing top 20 rows                                                                                                                                                                   
                          

>>> df6 = spark.sql("select stock_id,max(high) as high,min(low) as low, ((max(high)-min(low))/min(low))*100  as varience from nyse group by stock_id order by varience desc")
              
>>> df6.show()                                                                                                                                                                             
+--------+------+----+------------------+
|stock_id|  high| low|          varience|                                                                                                                                                  
+--------+------+----+------------------+                                                                                                                                                  
|      AI|  28.7|0.06|47733.333333333336|                                                                                                                                                  
|     AIG|157.19|0.33| 47533.33333333333|                                                                                                                                                  
|     ABK|  96.1|0.35|27357.142857142862|                                                                                                                                                  
|     ALY|  28.1|0.11|25445.454545454548|                                                                                                                                                  
|     AIB| 125.0|0.72|17261.111111111113|                                                                                                                                                  
|     AXL|  42.1|0.26|16092.307692307693|                                                                                                                                                  
|     ARM|  32.5|0.32|          10056.25|                                                                                                                                                  
|     AES|  92.5|0.92| 9954.347826086956|                                                                                                                                                  
|     AMT|  55.5| 0.6|            9150.0|                                                                                                                                                  
|     ALU| 86.25|1.09| 7812.844036697247|                                                                                                                                                  
|     AEG|148.32|2.25|            6492.0|                                                                                                                                                  
|     ABR| 34.45|0.56| 6051.785714285714|                                                                                                                                                  
|     AHD| 47.12|0.77|6019.4805194805185|                                                                                                                                                  
|     AMD|  97.0|1.62| 5887.654320987654|                                                                                                                                                  
|     ALD| 33.35|0.58| 5650.000000000001|                                                                                                                                                  
|     ATI| 119.7| 2.1|            5600.0|                                                                                                                                                  
|     ALX| 471.0|8.38| 5520.525059665871|                                                                                                                                                  
|     AMR| 69.01|1.25|            5420.8|                                                                                                                                                  
|     ADY|  44.0|0.95| 4531.578947368421|                                                                                                                                                  
|     AXR|149.99|3.25| 4515.076923076924|                                                                                                                                                  
+--------+------+----+------------------+                                                                                                                                                  
only showing top 20 rows                                                                                                                                                                   
                                                                                                                                                                                           
>>>

>>> df7 = spark.sql("select stock_id,max(high) as high,min(low) as low, round(((max(high)-min(low))/min(low))*100,2)  as varience from nyse group by stock_id order by varience desc")  
>>> df7.show()                                                                                                                                                                             
+--------+------+----+--------+
|stock_id|  high| low|varience|                                                                                                                                                            
+--------+------+----+--------+                                                                                                                                                            
|      AI|  28.7|0.06|47733.33|                                                                                                                                                            
|     AIG|157.19|0.33|47533.33|                                                                                                                                                            
|     ABK|  96.1|0.35|27357.14|                                                                                                                                                            
|     ALY|  28.1|0.11|25445.45|                                                                                                                                                            
|     AIB| 125.0|0.72|17261.11|                                                                                                                                                            
|     AXL|  42.1|0.26|16092.31|                                                                                                                                                            
|     ARM|  32.5|0.32|10056.25|                                                                                                                                                            
|     AES|  92.5|0.92| 9954.35|                                                                                                                                                            
|     AMT|  55.5| 0.6|  9150.0|                                                                                                                                                            
|     ALU| 86.25|1.09| 7812.84|                                                                                                                                                            
|     AEG|148.32|2.25|  6492.0|                                                                                                                                                            
|     ABR| 34.45|0.56| 6051.79|                                                                                                                                                            
|     AHD| 47.12|0.77| 6019.48|                                                                                                                                                            
|     AMD|  97.0|1.62| 5887.65|                                                                                                                                                            
|     ALD| 33.35|0.58|  5650.0|                                                                                                                                                            
|     ATI| 119.7| 2.1|  5600.0|                                                                                                                                                            
|     ALX| 471.0|8.38| 5520.53|                                                                                                                                                            
|     AMR| 69.01|1.25|  5420.8|                                                                                                                                                            
|     ADY|  44.0|0.95| 4531.58|                                                                                                                                                            
|     AXR|149.99|3.25| 4515.08|                                                                                                                                                            
+--------+------+----+--------+                                                                                                                                                            
only showing top 20 rows           

>>> df6 = df6.coalesce(1)                                                                                                                                                                  
>>> df6.rdd.getNumPartitions()                                                                                                                                                             
1
>>>                                                                                                                                                                                        
           

## -----------------------------------------------------------------------------------------------------------------------------------------------
>>> df101= spark.read.format("csv").option("header","True").option("inferScheme","True").load("/user/cddacmaylab407/airlines.csv")                                                                 
                                                                                                                         
>>> df101.printSchema()                                                                                                                                                                    
root                                                                                                                                                                                       
 |-- Year: string (nullable = true)                                                                                                                                                        
 |-- Quarter: string (nullable = true)                                                                                                                                                     
 |-- Avg_rev_per_seat: string (nullable = true)                                                                                                                                            
 |-- booked_seats: string (nullable = true)                                                                                                                                                
                                                                                                                                                                                           
>>>                                                                                                                                                   
>>> df101.show()                                                                                                                                                                           
+----+-------+----------------+------------+                                                                                                                                               
|Year|Quarter|Avg_rev_per_seat|booked_seats|                                                                                                                                               
+----+-------+----------------+------------+                                                                                                                                               
|1995|      1|           296.9|       46561|                                                                                                                                               
|1995|      2|           296.8|       37443|                                                                                                                                               
|1995|      3|          287.51|       34128|                                                                                                                                               
|1995|      4|          287.78|       30388|                                                                                                                                               
|1996|      1|          283.97|       47808|                                                                                                                                               
|1996|      2|          275.78|       43020|                                                                                                                                               
|1996|      3|          269.49|       38952|                                                                                                                                               
|1996|      4|          278.33|       37443|                                                                                                                                               
|1997|      1|           283.4|       35067|                                                                                                                                               
|1997|      2|          289.44|       46565|                                                                                                                                               
|1997|      3|          282.27|       38886|                                                                                                                                               
|1997|      4|          293.51|       37454|                                                                                                                                               
|1998|      1|          304.74|       31315|                                                                                                                                               
|1998|      2|          300.97|       30852|                                                                                                                                               
|1998|      3|          315.25|       38118|                                                                                                                                               
|1998|      4|          316.18|       35393|                                                                                                                                               
|1999|      1|          331.74|       47453|                                                                                                                                               
|1999|      2|          329.34|       38243|                                                                                                                                               
|1999|      3|          317.22|       33048|                                                                                                                                               
|1999|      4|          317.93|       31256|                                                                                                                                               
+----+-------+----------------+------------+                                                                                                                                               
only showing top 20 rows 


>>>

>>> df101.createOrReplaceTempView("airlines")                                                                                                                                              

>>> df102 = spark.sql("select year, sum(Avg_rev_per_seat*booked_seats) as total from airlines group by year order by total desc")                                                          

>>> df102.show(10)                                                                                                                                                                         
+----+--------------------+
|year|               total|                                                                                                                                                                
+----+--------------------+                                                                                                                                                                
|2013|       6.636320871E7|                                                                                                                                                                
|2014| 6.262417585000001E7|                                                                                                                                                                
|2015|       6.237899057E7|                                                                                                                                                                
|2012|       6.219912728E7|                                                                                                                                                                
|2008|5.7653170760000005E7|                                                                                                                                                                
|2007|       5.730921607E7|                                                                                                                                                                
|2001| 5.553377999999999E7|                                                                                                                                                                
|2010|       5.486152129E7|                                                                                                                                                                
|2000|5.2342926550000004E7|                                                                                                                                                                
|2011|       5.188828622E7|                                                                                                                                                                
+----+--------------------+                                                                                                                                                                
only showing top 10 rows                                                                                                                                                                   
                                                                                                                                                                                           
>>> 
>>> df102 = spark.sql("select year, (sum(Avg_rev_per_seat*booked_seats)/1000000) as total from airlines group by year order by total desc")                                                
>>> df102.show(10)                                                                                                                                                                         
+----+-----------------+
|year|            total|                                                                                                                                                                   
+----+-----------------+                                                                                                                                                                   
|2013|      66.36320871|                                                                                                                                                                   
|2014|62.62417585000001|                                                                                                                                                                   
|2015|      62.37899057|                                                                                                                                                                   
|2012|      62.19912728|                                                                                                                                                                   
|2008|      57.65317076|                                                                                                                                                                   
|2007|      57.30921607|                                                                                                                                                                   
|2001|55.53377999999999|                                                                                                                                                                   
|2010|      54.86152129|                                                                                                                                                                   
|2000|      52.34292655|                                                                                                                                                                   
|2011|      51.88828622|                                                                                                                                                                   
+----+-----------------+                                                                                                                                                                   
only showing top 10 rows                                                                                                                                                                   
                                                                                                                                                                                           
>>>                                                                                                                                                                                                    
 
