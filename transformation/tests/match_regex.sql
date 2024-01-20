SELECT postal_code
FROM {{ ref('estates_with_prices') }}
WHERE NOT postal_code REGEXP '[0-9]{5}'
