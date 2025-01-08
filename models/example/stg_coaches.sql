with stg_coach as (
    select * from raw.Coaches1
),
stg_country_coach_count as  (
    select Coach_country, Coach_sport , count(*) as country_sport_coaches 
    from raw.Coaches1
    group by Coach_country, Coach_sport
)

select 
ROW_NUMBER() OVER() as Coach_ID,
c.Coach_country, c.Coach_sport, 
REGEXP_SUBSTR(c.Coach_name, '[^ ]+',1,1) as Coach_nm1, 
REGEXP_SUBSTR(c.Coach_name, '[^ ]+',1,2) as Coach_nm2,
REGEXP_SUBSTR(c.Coach_name, '[^ ]+',1,3) as Coach_nm3,
cc.country_sport_coaches as fellow_coaches

 from stg_coach c , stg_country_coach_count cc
 where c.Coach_country=cc.Coach_country and c.Coach_sport=cc.Coach_sport