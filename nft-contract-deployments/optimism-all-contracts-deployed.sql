SELECT
    block_time,
    contracts
FROM
    query_2506134
UNION
SELECT
    block_time,
    contracts
FROM
    query_3430981
order by
    block_time