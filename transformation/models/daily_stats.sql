SELECT date(p.scraped_at) as date,
       avg(p.price) as mean_price,
       stddev(p.price) as stdev,
       min(p.price) as min,
       max(p.price) as max
FROM   estates.price p join estates.estate e
        ON e.estate_id = p.estate_id
GROUP BY date(p.scraped_at);
