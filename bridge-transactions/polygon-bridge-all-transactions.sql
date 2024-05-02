SELECT
    block_time,
    msg_count
FROM
    query_2465079
UNION
SELECT
    block_time,
    msg_count
FROM
    query_3431194
order by
    block_time