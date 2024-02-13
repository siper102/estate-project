select
    date(p.scraped_at) as date,
    avg(p.price) as mean_price,
    stddev(p.price) as stdev,
    min(p.price) as min,
    max(p.price) as max
from estates.price p
join estates.estate e on e.estate_id = p.estate_id
group by date(p.scraped_at)
