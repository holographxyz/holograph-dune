SELECT
    block_time,
    contracts
FROM
    query_2465035
UNION
SELECT
    block_time,
    contracts
FROM
    query_3430979
order by
    block_time