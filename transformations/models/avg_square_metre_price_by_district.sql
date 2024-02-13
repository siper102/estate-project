select
    district_number,
    avg(price) as price,
    avg(rooms) as rooms,
    avg(price / area) as price_per_qm
from estates.estate e
join estates.district d on d.district_number = e.location
join estates.price p on e.estate_id = p.estate_id
group by district_number
