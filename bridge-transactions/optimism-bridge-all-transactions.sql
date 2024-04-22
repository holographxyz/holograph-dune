SELECT
    block_time,
    msg_count
FROM
    query_2506131
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431199
order by
    block_time