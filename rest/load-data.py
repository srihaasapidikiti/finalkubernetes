import redis
import pandas as pd
redisByReviews = redis.Redis(host='redis', port=6379, db=1)
df = pd.read_csv('/rest/export_dataframe.csv', encoding='ISO-8859-1')
count_row = df.shape[0]
for i in range(0,count_row):
    redisByReviews.hmset("reviews:"+str(i), {"Restaurant": df['Restaurant Name'][i],"Locality": df['Locality'][i],"Cuisines": df['Cuisines'][i],"Cost": str(df['Average Cost for two'][i]),"Rating":str(df['Aggregate rating'][i]) })
    redisByReviews.sadd(df['Restaurant Name'][i], "reviews:"+str(i))
    redisByReviews.sadd(df['Locality'][i], "reviews:"+str(i))
    redisByReviews.sadd(df['Cuisines'][i], "reviews:"+str(i))
    redisByReviews.sadd(str(df['Average Cost for two'][i]), "reviews:"+str(i))
    redisByReviews.sadd(str(float(df['Aggregate rating'][i])), "reviews:"+str(i))
#print(redisByReviews.dbsize())