SELECT
    block_time,
    contracts
FROM
    query_2465041
UNION
SELECT
    block_time,
    contracts
FROM
    query_3430966
order by
    block_time