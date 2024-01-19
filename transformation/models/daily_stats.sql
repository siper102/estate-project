SELECT DATE(p.scraped_at) AS date,
       AVG(p.price) AS mean_price,
       STDDEV(p.price) AS stdev,
       MIN(p.price) AS min,
       MAX(p.price) AS max
FROM estates.price p
JOIN estates.estate e on e.estate_id = p.estate_id
GROUP BY DATE(p.scraped_at)