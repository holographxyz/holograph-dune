SELECT
    block_time,
    msg_count
FROM
    query_2465061
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431197
order by
    block_time