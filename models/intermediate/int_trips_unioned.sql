-- models/intermediate/int_trips_unioned.sql
select 
  pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    pickup_location_id,
    dropoff_location_id,
    fare_amount,
    total_amount,
    'green' as service_type
from {{ ref('stg_green_tripdata') }}
union all
select  
  pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    pickup_location_id,
    dropoff_location_id,
    fare_amount,
    total_amount,
    'yellow' as service_type
from {{ ref('stg_yellow_tripdata') }}
