select
    vendorid as vendor_id,
    tpep_pickup_datetime as pickup_datetime,
    tpep_dropoff_datetime as dropoff_datetime,
    passenger_count,
    trip_distance,
    pulocationid as pickup_location_id,
    dolocationid as dropoff_location_id,
    fare_amount,
    total_amount
from {{ source('staging', 'yellow_tripdata') }}
where vendorid is not null