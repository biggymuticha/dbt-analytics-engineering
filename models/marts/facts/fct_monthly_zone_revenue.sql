with trips as (

    select *
    from {{ ref('int_trips_unioned') }}

),

monthly as (

    select
        date_trunc('month', pickup_datetime) as revenue_month,
        service_type,
        pickup_location_id,
        dropoff_location_id,
        sum(total_amount) as revenue,
        count(*) as total_trips

    from trips
    group by 1,2,3,4

)

select
    m.revenue_month,
    m.service_type,

    pickup.zone as pickup_zone,
    --pickup.borough as pickup_borough,

    dropoff.zone as dropoff_zone,
    --dropoff.borough as dropoff_borough,

    m.revenue,
    m.total_trips

from monthly m

left join {{ ref('dim_zones') }} pickup
    on m.pickup_location_id = pickup.location_id

left join {{ ref('dim_zones') }} dropoff
    on m.dropoff_location_id = dropoff.location_id