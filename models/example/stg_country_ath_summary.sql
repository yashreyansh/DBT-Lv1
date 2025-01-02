with stg_athlete as (
     select Ath_country, count(*) as Athelete_count 
     from raw.Athelete1
     group by Ath_country
),
stg_country_medals as (
    select * from  {{  ref("stg_team_medals") }}
)

select stm.*, SA.Athelete_count  from stg_athlete SA 
right join {{ ref("stg_team_medals") }} stm
    ON SA.Ath_country=stm.Team_NOC
order by  SA.Athelete_count desc, stm.Rank desc