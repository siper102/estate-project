SELECT postal_code
FROM   {{ ref('estates_with_prices') }}
WHERE  not postal_code regexp '[0-9]{5}';
