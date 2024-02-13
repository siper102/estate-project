select postal_code
from {{ ref('estates_with_prices') }}
where not postal_code ~ '[0-9]{5}'
