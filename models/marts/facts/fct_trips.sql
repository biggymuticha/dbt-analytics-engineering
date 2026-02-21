-- models/marts/facts/fct_trips.sql
select *
from {{ ref('int_trips_unioned') }}