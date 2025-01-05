with stg_athlete as (
     select Ath_country, count(*) as Athelete_count 
     from raw.Athelete1
     group by Ath_country
),
stg_country_medals as (
    select * from  {{  ref("stg_team_medals") }}
)

select  SA.Athelete_count ,stm.* ,

case
when stm.Total =0 then 0
when SA.Athelete_count = 0 then 0
else
(CAST( stm.Total  AS FLOAT64) / CAST( SA.Athelete_count AS FLOAT64)) * 100
end as temp_123 , 
 {{ percentage_val(stm.Total, SA.Athelete_count) }} as Ath_win_percentage_
 from stg_athlete SA 
right join {{ ref("stg_team_medals") }} stm
    ON SA.Ath_country=stm.Team_NOC
order by  SA.Athelete_count desc, stm.Rank desc