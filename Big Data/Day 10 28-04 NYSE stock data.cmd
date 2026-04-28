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
