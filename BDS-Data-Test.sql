select sum(count) over (order by dateaq) as maxemp, dateaq
from (
    select start_date as dateaq, 1 as count 
    from test
    union all
    select end_date, -1
    from test
    where end_date is not null
) s ;

SELECT distinct (t.id), t.name, t.start_date, t.end_date, max(s.maxemp) as maxemp, max(s.dateaq) as date_e
from test t
join (
        select sum(count) over (order by dateaq) as maxemp, dateaq
        from (
        select start_date as dateaq, 1 as count 
        from test
        union all
        select end_date, -1
        from test
        where end_date is not null
        ) s
    ) s on dateaq between start_date and coalesce(end_date, '2023-03-07')
group by t.id, t.name, t.start_date, t.end_date, s.dateaq
order by maxemp desc;