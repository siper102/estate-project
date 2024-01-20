    SELECT district_number, ROUND(AVG(price), 2) AS price, AVG(rooms) AS rooms,  AVG(price/area) AS price_per_qm
    FROM estates_with_prices
    GROUP BY district_number;
