with tx_weekly as (
SELECT
    week.week_date AS "week_date",
    (
        SELECT
           (
           (IF(SUM(Ethereum) > 0, SUM(Ethereum) , 0))
           +(IF(SUM(Polygon) > 0, SUM(Polygon) , 0))
           +(IF(SUM("BNB Chain") > 0, SUM("BNB Chain") , 0))
           +(IF(SUM(Avalanche) > 0, SUM(Avalanche) , 0))
           +(IF(SUM("OP Mainnet") > 0, SUM("OP Mainnet") , 0))
           +(IF(SUM(Arbitrum) > 0, SUM(Arbitrum) , 0))
           +(IF(SUM(Zora) > 0, SUM(Zora) , 0))
           +(IF(SUM(Base) > 0, SUM(Base) , 0))
           +(IF(SUM(Linea) > 0, SUM(Linea) , 0))
           ) AS total_count
        FROM
            query_3690800
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "total_bridge_tx_per_week"   
FROM
    query_3701020 AS week
    order by week.week_date
)
select week_date, 
total_bridge_tx_per_week,
sum(total_bridge_tx_per_week) over (order by week_date) as accumulate_tx_count
from tx_weekly
order by week_date
