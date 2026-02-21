-- models/staging/stg_green_tripdata.sql
with raw as (
    select 
    vendorid,
    lpep_pickup_datetime as pickup_datetime,
    lpep_dropoff_datetime as dropoff_datetime,
    store_and_fwd_flag,
    passenger_count,
    trip_distance,
    ratecodeid as ratecode_id,
    pulocationid as pickup_location_id,
    dolocationid as dropoff_location_id,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
        tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge
from {{ source('staging', 'green_tripdata') }}
where vendorid is not null
)
select
    vendorid,
    pickup_location_id,
    dropoff_location_id,
    pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    ratecode_id,
    store_and_fwd_flag,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge
from raw