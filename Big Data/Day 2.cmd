################################################################################
p-172-31-16-60 login: cddacmaylab407                                                                                                                                   
Password:                                                                                                                                                               
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1084-aws x86_64)                                                                                                        
                                                                                                                                                                        
  System information as of Tue Apr 21 05:22:10 UTC 2026                                                                                                                 
                                                                                                                                                                        
  System load:  2.15               Processes:             362                                                                                                           
  Usage of /:   43.5% of 61.84GB   Users logged in:       44                                                                                                            
  Memory usage: 86%                IPv4 address for ens5: 172.31.16.60                                                                                                  
  Swap usage:   0%                                                                                                                                                      
                                                                                                                                                                        
  => There is 1 zombie process.                                                                                                                                         
                                                                                                                                                                        
Last login: Tue Apr 21 04:38:34 UTC 2026 from 127.0.0.1, 3.111.45.217 on pts/68                                                                                         
cddacmaylab407@ip-172-31-16-60:~$ ls                                                                                                                                    
hello  hii.txt  one.txt
## ---------------------------------------------------------                                                                                                   
cddacmaylab407@ip-172-31-16-60:~$ hadoop fs -ls                                                                                                                         
Found 5 items                                                                                                                                                           
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 -mkdir                                                                                         
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 dfs                                                                                            
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:33 dir1                                                                                           
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 08:37 one1.txt                                                                                       
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt                                                                                     
cddacmaylab407@ip-172-31-16-60:~$ ls                                                                                                                                    
hello  hii.txt  one.txt
## ---------------------------------------------------------                                                                                                                                                              
cddacmaylab407@ip-172-31-16-60:~/hello$ ls                                                                                                                              
ch  nyse.csv  one1.txt  sample.txt
## ---------------------------------------------------------                                                                                                                        
cddacmaylab407@ip-172-31-16-60:~$ ls                                                                                                                                    
hello  hii.txt  nyse.csv  one.txt
## ---------------------------------------------------------
cddacmaylab407@ip-172-31-16-60:~$ hadoop fs -put nyse.csv                                                                                                               
cddacmaylab407@ip-172-31-16-60:~$ hadoop fs -ls                                                                                                                         
Found 6 items                                                                                                                                                           
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 -mkdir                                                                                         
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 dfs                                                                                            
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:33 dir1                                                                                           
-rw-r--r--   3 cddacmaylab407 cddacmaylab407   51667341 2026-04-21 05:27 nyse.csv                                                                                       
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 08:37 one1.txt                                                                                       
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt                                                                                     
cddacmaylab407@ip-172-31-16-60:~$   


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
ip-172-31-8-82 login: cddacmaylab407                                                                                           
Password:                                                                                                                      
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1084-aws x86_64)                                                               


  System information as of Tue Apr 21 05:07:39 UTC 2026                                                                        


  System load:  0.59               Processes:             311                                                                  
  Usage of /:   81.2% of 30.83GB   Users logged in:       21                                                                   
  Memory usage: 20%                IPv4 address for ens5: 172.31.8.82                                                          
  Swap usage:   0%                                                                                                             


  => There is 1 zombie process.                                                                                                
                                                                                                    
cddacmaylab407@ip-172-31-8-82:~$ hive                                                                                          
SLF4J: Class path contains multiple SLF4J bindings.                                                                            
SLF4J: Found binding in [jar:file:/opt/hive-3.1.1/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]    
SLF4J: Found binding in [jar:file:/opt/hadoop/share/hadoop/common/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBind
er.class]                                                                                                                      
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.                                               
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]                                                 
Hive Session ID = 97f99f5e-ec98-4c5b-9f67-22fcff06a56a                                                                         
                                                                                                                               
Logging initialized using configuration in jar:file:/opt/hive-3.1.1/lib/hive-common-3.1.1.jar!/hive-log4j2.properties Async: tr
ue                                                                                                                             
Hive Session ID = f2693029-17b1-4812-9479-5b91992aff9a                                                                         
Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine
 (i.e. spark, tez) or using Hive 1.X releases.              
                                                                   
## ---------------------------------------------------------
hive>                                                                                                                          
    > set hive.cli.print.current.db = true;                 
## ---------------------------------------------------------                                                                   
hive (default)>                                                                                                                
              > set hive.cli.print.header = true;                                                                              
## ---------------------------------------------------------
hive (default)>                                                                                                                
              > SHOW DATABASES;                                                                                                
OK                                                                                                                             
database_name                                                                                                                  
15april                                                                                                                        
a                                                                                                                              
aastha                                                                                                                                                                                                                                        
amrita_db                                                                                                                      
anish_db                                                                                                                       
arjun_db                                                                                                                       
asgn1                                                                                                                          
assignment_db                                                                                                                  
berserk                                                                                                                        
bharath_db                                                                                                                     
bhushan1                                                                                                                       
bigdata                                                                                                                        
bk_db                                                                                                                          
claa_demo                                                                                                                      
class_demo                                                                                                                     
class_demo_1000                                                                                                                
class_demo_14915                                                                                                                                                                                                                         
class_nm                                                                                                                       
data_scientist                                                                                                                 
day1                                                                                                                           
db_train                                                                                                                       
dd_scaler                                                                                                                      
debashis_10209_analytics                                                                                                       
debashis_10209_raw                                                                                                             
debashis_10209_staging                                                                                                         
default                                                                                                                        
demo_class                                                                                                                     
demo_db                                                                                                                        
dynamic_partition                                                                                                              
employee_db                                                                                                                    
esha_db                                                                                                                        
                                                                                                             
trn_db                                                                                                                         
vaishnav17_db                                                                                                                  
vedant1_db                                                                                                                     
vishal_db                                                                                                                      
xyz_db                                                                                                                         
yash_db                                                                                                                        
your_username_staging                                                                                                          
Time taken: 0.395 seconds, Fetched: 542 row(s)   

## ---------------------------------------------------------
                                                                              
hive (default)> create database dev;                                                                                           
OK                                                                                                                             
Time taken: 0.075 seconds    
## ---------------------------------------------------------                                                                                                  
hive (default)> show databases like "dev*";                                                                                    
OK                                                                                                                             
database_name                                                                                                                  
dev                                                                                                                            
Time taken: 0.029 seconds, Fetched: 1 row(s)                
## ---------------------------------------------------------                                                                   
hive (default)> use dev;                                                                                                       
OK                                                                                                                             
Time taken: 0.028 seconds                                   
## ---------------------------------------------------------                                                                                                                      
hive (dev)>                                                                                                                    
          >                                                                                                                    
          > CREATE TABLE nyse_managed (   stk_date DATE,   symbol   STRING,   open     DOUBLE,   close    DOUBLE,   low      DO
UBLE,   high     DOUBLE,   volume   DOUBLE ) ROW FORMAT DELIMITED  FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("
skip.header.line.count"="1");
OK                                                                                                                             
Time taken: 0.269 seconds     
## ---------------------------------------------------------                                                                                                 
hive (dev)>                                                                                                                    
          > LOAD DATA INPATH '/user/cddacmaylab407/nyse.csv' INTO TABLE nyse_managed;                                          
Loading data to table dev.nyse_managed
OK
Time taken: 4.138 seconds                                                                                                      
hive (dev)>                                                                                                                    
## ---------------------------------------------------------


LOAD DATA Local INPATH '/home/cddacmaylab407/custs.txt' INTO TABLE customers;
LOAD DATA Local INPATH '/home/cddacmaylab407/txns1.txt' INTO TABLE transactions;
cddacmaylab014







ip-172-31-8-82 login: cddacmaylab407                     
Password:                                                
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1084-aws 


  System information as of Tue Apr 21 09:59:58 UTC 2026  


  System load:  0.18               Processes:            
  Usage of /:   82.4% of 30.83GB   Users logged in:      
  Memory usage: 80%                IPv4 address for ens5:
  Swap usage:   0%                                       


  => There is 1 zombie process.                          


Last login: Tue Apr 21 09:20:03 UTC 2026 from 127.0.0.1, 
cddacmaylab407@ip-172-31-8-82:~$ hive                    
SLF4J: Class path contains multiple SLF4J bindings.      
SLF4J: Found binding in [jar:file:/opt/hive-3.1.1/lib/log
SLF4J: Found binding in [jar:file:/opt/hadoop/share/hadoo
er.class]                                                
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindi
SLF4J: Actual binding is of type [org.apache.logging.slf4
Hive Session ID = ddd30c02-5f7d-45f0-b638-d92cb50a0a7b   


Logging initialized using configuration in jar:file:/opt/
ue                                                       
Hive Session ID = 85de3120-5c80-47cf-bd02-0adbde05b60c   
Hive-on-MR is deprecated in Hive 2 and may not be availab
 (i.e. spark, tez) or using Hive 1.X releases.           
hive> set hive.cli.print.current.db=true;                
hive (default)> set hive.cli.print.header=true;          
hive (default)>                                          
              > use dev;                                 
OK                                                       
Time taken: 0.37 seconds                                 
hive (dev)> LOAD DATA Local INPATH '/home/LOAD DATA Local
xt' INTO TABLE customers;
MismatchedTokenException(14!=162)                        
        at org.antlr.runtime.BaseRecognizer.recoverFromMi
        at org.antlr.runtime.BaseRecognizer.match(BaseRec
        at org.apache.hadoop.hive.ql.parse.HiveParser.loa
        at org.apache.hadoop.hive.ql.parse.HiveParser.exe
        at org.apache.hadoop.hive.ql.parse.HiveParser.sta
        at org.apache.hadoop.hive.ql.parse.ParseDriver.pa
        at org.apache.hadoop.hive.ql.parse.ParseUtils.par
        at org.apache.hadoop.hive.ql.parse.ParseUtils.par
        at org.apache.hadoop.hive.ql.Driver.compile(Drive
        at org.apache.hadoop.hive.ql.Driver.compileIntern
        at org.apache.hadoop.hive.ql.Driver.compileAndRes
        at org.apache.hadoop.hive.ql.Driver.compileAndRes
        at org.apache.hadoop.hive.ql.reexec.ReExecDriver.
        at org.apache.hadoop.hive.ql.reexec.ReExecDriver.
        at org.apache.hadoop.hive.cli.CliDriver.processLo
        at org.apache.hadoop.hive.cli.CliDriver.processCm
        at org.apache.hadoop.hive.cli.CliDriver.processLi
        at org.apache.hadoop.hive.cli.CliDriver.executeDr
        at org.apache.hadoop.hive.cli.CliDriver.run(CliDr
        at org.apache.hadoop.hive.cli.CliDriver.main(CliD
        at sun.reflect.NativeMethodAccessorImpl.invoke0(N
        at sun.reflect.NativeMethodAccessorImpl.invoke(Na
        at sun.reflect.DelegatingMethodAccessorImpl.invok
        at java.lang.reflect.Method.invoke(Method.java:49
        at org.apache.hadoop.util.RunJar.run(RunJar.java:
        at org.apache.hadoop.util.RunJar.main(RunJar.java
FAILED: ParseException line 1:54 mismatched input '/' exp
hive (dev)>                                              
          >                                              
          > LOAD DATA Local INPATH '/home/LOAD DATA Local
[1]+  Stopped                 hive
cddacmaylab407@ip-172-31-8-82:~$ hive
SLF4J: Class path contains multiple SLF4J bindings.      
SLF4J: Found binding in [jar:file:/opt/hive-3.1.1/lib/log
SLF4J: Found binding in [jar:file:/opt/hadoop/share/hadoo
er.class]                                                
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindi
SLF4J: Actual binding is of type [org.apache.logging.slf4
Hive Session ID = 11090757-9f6d-4317-b833-1974ec8e9cc4   


Logging initialized using configuration in jar:file:/opt/
ue                                                       
^[[AHive Session ID = d0564a4a-5c22-4763-8178-eb4bbe126fe
Hive-on-MR is deprecated in Hive 2 and may not be availab
 (i.e. spark, tez) or using Hive 1.X releases.           
hive> set hive.cli.print.current.db=true;                
hive (default)> set hive.cli.print.header=true;          
hive (default)> use dev;                                 
OK
Time taken: 0.367 seconds
hive (dev)> LOAD DATA Local INPATH '/home/cddacmaylab407/
Loading data to table dev.customers                      
OK                                                       
Time taken: 4.153 seconds                                
hive (dev)> LOAD DATA Local INPATH '/home/cddacmaylab407/
Loading data to table dev.transactions                   
OK                                                       
Time taken: 4.029 seconds                                
hive (dev)>                                              
          > CREATE TABLE txns_parquet STORED AS PARQUET AS SELECT * FROM transactions;                                         
Query ID = cddacmaylab407_20260421102415_5f751d41-e8de-4ccf-b1e4-81798765321d                                                  
Total jobs = 3                                                                                                                 
Launching Job 1 out of 3                                                                                                       
Number of reduce tasks is set to 0 since there's no reduce operator                                                            
Starting Job = job_1776055345521_1519, Tracking URL = http://master:6318/proxy/application_1776055345521_1519/                 
Kill Command = /opt/hadoop/bin/mapred job  -kill job_1776055345521_1519                                                        
Press Ctrl+C again to kill JVM                                                                                                 
killing job with: job_1776055345521_1519                                                                                       
Exiting the JVM                                                                                                                
^CExiting the JVM                                                                                                              
^Z                                                                                                                             
[2]+  Stopped                 hive                                                                                             
cddacmaylab407@ip-172-31-8-82:~$ hive                                                                                          
SLF4J: Class path contains multiple SLF4J bindings.                                                                            
SLF4J: Found binding in [jar:file:/opt/hive-3.1.1/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]    
SLF4J: Found binding in [jar:file:/opt/hadoop/share/hadoop/common/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBind
er.class]                                                                                                                      
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.                                               
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]                                                 
Hive Session ID = 87d6a0cb-8ee3-47e0-a5cc-dbaa0eea2bb7                                                                         
                                                                                                                               
Logging initialized using configuration in jar:file:/opt/hive-3.1.1/lib/hive-common-3.1.1.jar!/hive-log4j2.properties Async: tr
ue                                                                                                                             
Hive Session ID = 8ba03d55-6023-43ac-b0d0-61d764563dd9                                                                         
Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine
 (i.e. spark, tez) or using Hive 1.X releases.                                                                                 
hive>                                                                                                                          


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
hive (dev)>                                                                                                          
          >                                                                                                          
          > SET hive.support.concurrency = true;                                                                     
hive (dev)>                                                                                                          
          > SET hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;                                   
hive (dev)>                                                                                                          
          > SET hive.enforce.bucketing = true;                                                                       
hive (dev)>                                                                                                          
          > CREATE TABLE customers_txn (     cust_id INT,     fname STRING,     lname STRING,     age INT,     profes
sion STRING ) CLUSTERED BY (cust_id) INTO 4 BUCKETS STORED AS ORC TBLPROPERTIES ('transactional'='true');            
OK                                                                                                                   
Time taken: 0.348 seconds                                                                                            
hive (dev)>                                                                                                          
