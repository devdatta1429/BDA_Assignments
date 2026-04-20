ip-172-31-32-166 login: cddacmaylab407                                                                                         
Password:                                                                                                                      
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1084-aws x86_64)                                                               


  System information as of Mon Apr 20 06:03:18 UTC 2026                                                                        


  System load:  0.21               Processes:             316                                                                  
  Usage of /:   45.6% of 61.84GB   Users logged in:       24                                                                   
  Memory usage: 21%                IPv4 address for ens5: 172.31.32.166                                                        
  Swap usage:   0%                                                                                                             


  => There is 1 zombie process.                                                                                                


cddacmaylab407@ip-172-31-32-166:~$                                                                                             
cddacmaylab407@ip-172-31-32-166:~$ 
cddacmaylab407@ip-172-31-32-166:~$                                                                                             
cddacmaylab407@ip-172-31-32-166:~$ ls                                                                                          
cddacmaylab407@ip-172-31-32-166:~$ pwd                                                                                         
/home/cddacmaylab407                                                                                                           
cddacmaylab407@ip-172-31-32-166:~$ ls                                                                                          
hii.txt 


## -------------------------------------------------------------------------------------------------------------

cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls /                                                                        
Found 13 items                                                                                                                 
drwxr-xr-x   - labuser hadoop          0 2025-06-15 18:17 / user                                                               
-rw-r--r--   3 labuser hadoop    1564110 2024-03-22 09:36 /Simplilearn                                                         
drwxr-xr-x   - labuser hadoop          0 2025-06-24 09:39 /data                                                                
drwxr-xr-x   - labuser hadoop          0 2025-06-06 05:00 /dataset2                                                            
drwxr-xr-x   - labuser hadoop          0 2025-06-06 05:08 /datasets                                                            
drwxr-xr-x   - labuser hadoop          0 2024-07-09 08:00 /hadoop                                                              
drwxr-xr-x   - labuser hadoop          0 2026-04-13 04:45 /hbase                                                               
drwxr-xr-x   - labuser hadoop          0 2025-07-23 12:12 /home                                                                
drwxr-xr-x   - labuser hadoop          0 2024-08-29 09:19 /opt                                                                 
drwxr-xr-x   - labuser hadoop          0 2025-01-06 06:41 /path                                                                
drwxr-xr-x   - labuser hadoop          0 2025-10-28 07:05 /system                                                              
drwxrwxrwt   - labuser hadoop          0 2026-04-19 11:10 /tmp                                                                 
drwxr-xr-x   - labuser hadoop          0 2026-04-16 13:02 /user                                                                

## -------------------------------------------------------------------------------------------------------------

cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls                                                                          
Found 4 items                                                                                                                  
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 -mkdir                                                
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 dfs                                                   
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:33 dir1                                                  
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt                                            

## ---------------------------------------------------------------------------------------------
                                                                                                                     
cddacmaylab407@ip-172-31-32-166:~$ mkdir hello                                                                                 
cddacmaylab407@ip-172-31-32-166:~$ ls                                                                                          
hello  hii.txt


cddacmaylab407@ip-172-31-32-166:~$ touch one.txt                                                                               
cddacmaylab407@ip-172-31-32-166:~$ ls                                                                                          
hello  hii.txt  one.txt

cddacmaylab407@ip-172-31-32-166:~$ cd hello                                                                                    
cddacmaylab407@ip-172-31-32-166:~/hello$ ls 
                                                                                   
                                                                                     
cddacmaylab407@ip-172-31-32-166:~/hello$ ls                                                                                    
one.txt                                                                                                                                                                                                          
                                                                                                                    
cddacmaylab407@ip-172-31-32-166:~/hello$ mkdir ch                                                                              
cddacmaylab407@ip-172-31-32-166:~/hello$ touch one.txt                                                                         
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ cd ch                                                                                 
                                                                                     
cddacmaylab407@ip-172-31-32-166:~/hello/ch$ cd ..                                                                              
                                                                      
cddacmaylab407@ip-172-31-32-166:~/hello$ rm -r one.txt                                                                         
cddacmaylab407@ip-172-31-32-166:~/hello$ ls                                                                                    
ch

cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
                                                                               
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
                                                                                
cddacmaylab407@ip-172-31-32-166:~/hello$ hadoop fs -put sample.txt     ### Uploading the files to HDFS Architec                                                        
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls                                                                          
Found 1 items                                                                                                                  
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt
                                         
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -cat sample.txt                                                              
"hii I am sample" cddacmaylab407@ip-172-31-32-166:~/hello$                                                                        

cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ df -u                                                                                 
df: invalid option -- 'u'                                                                                                      
Try 'df --help' for more information.  
                                                                                        
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfsadmin -report                                                                 
Configured Capacity: -6291456 (-6 MB)                                                                                          
Present Capacity: -2381750891166 (-2.17 TB)                                                                                    
DFS Remaining: -2722237511736 (-2.48 TB)                                                                                       
DFS Used: 340486620570 (317.10 GB)                                                                                             
DFS Used%: -14.30%                                                                                                             
Replicated Blocks:                                                                                                             
        Under replicated blocks: 120                                                                                           
        Blocks with corrupt replicas: 0                                                                                        
        Missing blocks: 0                                                                                                      
        Missing blocks (with replication factor 1): 0                                                                          
        Low redundancy blocks with highest priority to recover: 0                                                              
        Pending deletion blocks: 0                                                                                             
Erasure Coded Block Groups:                                                                                                    
        Low redundancy block groups: 0                                                                                         
        Block groups with corrupt internal blocks: 0                                                                           
        Missing block groups: 0                                                                                                
        Low redundancy blocks with highest priority to recover: 0                                                              
        Pending deletion blocks: 0                                                                                             


-------------------------------------------------                                                                              
report: Access denied for user cddacmaylab407. Superuser privilege is required                                                 
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
                                                                                      
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfsadmin -refreshNodes                                                           
refreshNodes: Access denied for user cddacmaylab407. Superuser privilege is required                                           
cddacmaylab407@ip-172-31-32-166:~/hello$ dfs fsck one.txt

Command 'dfs' not found, did you mean:                                                                                         


  command 'dss' from snap data-science-stack (0.1-0fdd0b77cd50bb922f643b17899b)                                                
  command 'dms' from deb anacrolix-dms (1.1.0-1)                                                                               
  command 'dcs' from deb drbl (2.30.5-1)                                                                                       
  command 'fs' from deb openafs-client (1.8.4~pre1-1ubuntu2.4)                                                                 
  command 'hfs' from deb hfsutils-tcltk (3.2.6-14)                                                                             
  command 'dfc' from deb dfc (3.1.1-1)                                                                                         
  command 'df' from deb coreutils (8.30-3ubuntu2)                                                                              
  command 'zfs' from deb zfsutils-linux (0.8.3-1ubuntu12.18)                                                                   
  command 'zfs' from deb zfs-fuse (0.7.0-20)                                                                                   
  command 'bfs' from deb bfs (1.5.2-1)                                                                                         


See 'snap info <snapname>' for additional versions.                                                                            
                                                                                                                               
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs fsck one.txt                                                                     
FileSystem is inaccessible due to:                                                                                             
java.io.FileNotFoundException: File does not exist: hdfs://master:9000/user/cddacmaylab407/one.txt                             
DFSck exiting.                                                                                                                 
cddacmaylab407@ip-172-31-32-166:~/hello$ yarn node -list                                                                       
2026-04-20 07:19:39,799 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master/172.31.64.10:80
32                                                                                                                             
Total Nodes:5                                                                                                                  
         Node-Id             Node-State Node-Http-Address       Number-of-Running-Containers                                   
dn3.cloudloka.com:37605         RUNNING dn3.cloudloka.com:8042                             2                                   
dn5.cloudloka.com:40715         RUNNING dn5.cloudloka.com:8042                             0                                   
dn2.cloudloka.com:42891         RUNNING dn2.cloudloka.com:8042                             2                                   
dn1.cloudloka.com:38301         RUNNING dn1.cloudloka.com:8042                             0                                   
dn4.cloudloka.com:35587         RUNNING dn4.cloudloka.com:8042                             0                                   
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ yarn application -list                                                                
2026-04-20 07:21:05,029 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at master/172.31.64.10:80
32                                                                                                                             
Total number of applications (application-types: [], states: [SUBMITTED, ACCEPTED, RUNNING] and tags: []):2                    
                Application-Id      Application-Name        Application-Type          User           Queue                   St
ate             Final-State             Progress                        Tracking-URL                                           
application_1776055345521_0944  ScalerRetail_Staging                   SPARK    scalerhdpfeb26406       root.scalerhdpfeb26406 
            RUNNING               UNDEFINED                  10% http://ip-172-31-16-60.ap-south-1.compute.internal:4041       
application_1776055345521_0958                my app                   SPARK    scalermarlab2024        root.scalermarlab2024  
            RUNNING               UNDEFINED                  10% http://ip-172-31-16-60.ap-south-1.compute.internal:4040       
cddacmaylab407@ip-172-31-32-166:~/hello$ hadoop version                                                                        
Hadoop 3.3.0                                                                                                                   
Source code repository https://gitbox.apache.org/repos/asf/hadoop.git -r aa96f1871bfd858f9bac59cf2a81ec470da649af              
Compiled by brahma on 2020-07-06T18:44Z                                                                                        
Compiled with protoc 3.7.1                                                                                                     
From source with checksum 5dc29b802d6ccd77b262ef9d04d19c4                                                                      
This command was run using /opt/hadoop/share/hadoop/common/hadoop-common-3.3.0.jar                                             
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
                                                        
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls /                                                                        
Found 13 items                                                                                                                 
drwxr-xr-x   - labuser hadoop          0 2025-06-15 18:17 / user                                                               
-rw-r--r--   3 labuser hadoop    1564110 2024-03-22 09:36 /Simplilearn                                                         
drwxr-xr-x   - labuser hadoop          0 2025-06-24 09:39 /data                                                                
drwxr-xr-x   - labuser hadoop          0 2025-06-06 05:00 /dataset2                                                            
drwxr-xr-x   - labuser hadoop          0 2025-06-06 05:08 /datasets                                                            
drwxr-xr-x   - labuser hadoop          0 2024-07-09 08:00 /hadoop                                                              
drwxr-xr-x   - labuser hadoop          0 2026-04-13 04:45 /hbase                                                               
drwxr-xr-x   - labuser hadoop          0 2025-07-23 12:12 /home                                                                
drwxr-xr-x   - labuser hadoop          0 2024-08-29 09:19 /opt                                                                 
drwxr-xr-x   - labuser hadoop          0 2025-01-06 06:41 /path                                                                
drwxr-xr-x   - labuser hadoop          0 2025-10-28 07:05 /system                                                              
drwxrwxrwt   - labuser hadoop          0 2026-04-19 11:10 /tmp                                                                 
drwxr-xr-x   - labuser hadoop          0 2026-04-16 13:02 /user                                                                
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -mkdir dir1                                                                  
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls                                                                          
Found 4 items                                                                                                                  
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 -mkdir                                                
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 dfs                                                   
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:33 dir1                                                  
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt                                            

cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                       
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -put sample.txt                                                              
put: `sample.txt': File exists                                                                                                 

cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -put one.txt                                                                 
put: `one.txt': No such file or directory                                                                                      

cddacmaylab407@ip-172-31-32-166:~/hello$ ls                                                                                    
ch  sample.txt
cddacmaylab407@ip-172-31-32-166:~/hello$ cat one1.txt                                                                          
cat: one1.txt: No such file or directory                                                                                       

cddacmaylab407@ip-172-31-32-166:~/hello$ ls                                                                                    
ch  sample.txt

cddacmaylab407@ip-172-31-32-166:~/hello$ touch one1.txt                                                                        
cddacmaylab407@ip-172-31-32-166:~/hello$ ls                                                                                    
ch  one1.txt  sample.txt

cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -put one1.txt                                                                
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -ls                                                                          
Found 5 items                                                                                                                  
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 -mkdir                                                
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:31 dfs                                                   
drwxr-xr-x   - cddacmaylab407 cddacmaylab407          0 2026-04-20 07:33 dir1                                                  
-rw-r--r--   3 cddacmaylab407 cddacmaylab407          0 2026-04-20 07:40 one1.txt                                              
-rw-r--r--   3 cddacmaylab407 cddacmaylab407         15 2026-04-20 07:05 sample.txt                                            
                                                                                                             
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -nano one1.txt

Option 1: Overwrite the file
hdfs dfs -put -f one1.txt

cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -put -f one1.txt
cddacmaylab407@ip-172-31-32-166:~/hello$ hdfs dfs -cat one1.txt                                                                
one is here !!                                                                                                                 
cddacmaylab407@ip-172-31-32-166:~/hello$                                                                                                                                                                                                                                    
