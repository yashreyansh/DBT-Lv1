with athelete as (
select * from raw.Athelete1
)

select 
ROW_NUMBER() over() as Athelete_ID,
* from athelete