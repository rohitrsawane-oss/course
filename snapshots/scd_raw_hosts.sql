{% snapshot scd_raw_hosts %}

{{
   config(
       target_database='AIRBNB',
       target_schema='SRC',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       hard_deletes='invalidate'
   )
}}

select * from {{ source('airbnb_raw', 'raw_hosts') }}

{% endsnapshot %}