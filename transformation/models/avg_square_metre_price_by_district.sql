SELECT district_number,
       round(avg(price), 2) as price,
       avg(rooms) as rooms,
       avg(price/area) as price_per_qm
FROM   estates_with_prices
GROUP BY district_number;
