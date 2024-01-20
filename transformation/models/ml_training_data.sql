SELECT d.district_name,
       e.construction_year,
       e.rooms,
       e.area,
       p.price
FROM   estates.estate e join estates.district d
        ON d.district_number = e.location join estates.price p
        ON e.estate_id = p.estate_id
WHERE  yearweek(p.scraped_at) = yearweek(now() - interval 4 week);
