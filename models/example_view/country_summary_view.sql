with coach_data as (
    select a.Coach_country, count(*) as no_of_coaches 
    from dbt_test.stg_coaches a
    group by a.Coach_country
) ,
 athletes as (
    select b.Ath_country, count(*) as no_of_athelete
    from dbt_test.stg_athelete b
    group by b.Ath_country
),
 country_summ as (
    select  c.Team_NOC as Country, c.`Rank by Total`,c.Total as `Total Medals`, c.Athelete_count
    from dbt_test.stg_country_ath_summary c
)

select c.*, b.no_of_athelete , a.no_of_coaches from 
country_summ c left join athletes b 
ON c.Country=b.Ath_country
left join coach_data a
ON a.Coach_country=c.Country

order by c.`Rank by Total`