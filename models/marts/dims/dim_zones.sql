-- models/marts/dims/dim_zones.sql
select
    cast(LocationID as integer) as location_id,
    Borough as borough,
    Zone as zone,
    service_zone
from {{ ref('taxi_zone_lookup') }}