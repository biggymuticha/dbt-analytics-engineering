select     dispatching_base_num,
    pickup_datetime,
    dropoff_datetime,
    pulocationid as pickup_location_id,
    dolocationid as dropoff_location_id
from {{ source('staging', 'fhv_tripdata') }}