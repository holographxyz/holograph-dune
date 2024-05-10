SELECT
    COALESCE(v1.block_time, v2.block_time) as block_time,
    (
        COALESCE(v1.msg_count, 0) + COALESCE(v2.msg_count, 0)
    ) as msg_count
FROM
    query_3707692 as v1
    FULL JOIN query_3431193 as v2 on v1.block_time = v2.block_time
order by
    block_time