SELECT
    COALESCE(v1.block_time, v2.block_time) as block_time,
    (
        COALESCE(v1.contracts, 0) + COALESCE(v2.contracts, 0)
    ) as contracts
FROM
    query_3708881 as v1
    FULL JOIN query_3430979 as v2 on v1.block_time = v2.block_time
order by
    block_time