SELECT
    block_time,
    contracts
FROM
    query_2611160
UNION
SELECT
    block_time,
    contracts
FROM
    query_3430983
order by
    block_time