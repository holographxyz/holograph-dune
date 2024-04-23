SELECT
    block_time,
    msg_count
FROM
    query_2465084
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431195
order by
    block_time