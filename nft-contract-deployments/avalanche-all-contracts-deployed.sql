SELECT
    block_time,
    contracts
FROM
    query_2465008
UNION
SELECT
    block_time,
    contracts
FROM
    query_3430980
order by
    block_time