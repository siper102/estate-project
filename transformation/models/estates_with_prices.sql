SELECT e.postal_code, e.street, d.district_name, d.district_number, e.construction_year, e.rooms, e.area, e.link, p.price, p.scraped_at, p.source
FROM estates.estate e
JOIN estates.district d on d.district_number = e.location
JOIN estates.price p on e.estate_id = p.estate_id