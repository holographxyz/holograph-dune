SELECT
    block_time,
    msg_count
FROM
    query_2611173
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431209
order by
    block_time