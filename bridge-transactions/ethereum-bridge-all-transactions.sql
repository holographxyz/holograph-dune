SELECT
    block_time,
    msg_count
FROM
    query_2465088
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431193
order by
    block_time