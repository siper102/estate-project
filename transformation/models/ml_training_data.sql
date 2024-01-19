SELECT d.district_name, e.construction_year, e.rooms, e.area, p.price
FROM estates.estate e
JOIN estates.district d on d.district_number = e.location
JOIN estates.price p on e.estate_id = p.estate_id
WHERE YEARWEEK(p.scraped_at) = YEARWEEK(NOW() - INTERVAL 4 WEEK)