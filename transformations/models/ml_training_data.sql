select d.district_name, e.construction_year, e.rooms, p.price / e.area as price
from estates.estate e
join estates.district d on d.district_number = e.location
join estates.price p on e.estate_id = p.estate_id
