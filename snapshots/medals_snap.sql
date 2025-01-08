{% snapshot medals_snap %}

{{
    config(
        target_schema='dbt_test', 
        strategy='check',
        unique_key='Team_NOC',
        check_cols=['Rank','Team_NOC'],
    )
}}

select * from raw.Medals  --   you can create another schema as well, in target_schema above

-- select * from raw.Medals where Team_NOC='Ghana'; 
--update raw.Medals set Rank=87 where Team_NOC='Ghana';
--select * from raw.Medals where Team_NOC='Ghana';  -- has two values , one with updated timestamp


{% endsnapshot %}