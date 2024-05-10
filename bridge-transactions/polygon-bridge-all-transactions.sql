SELECT
    v1.block_time,
    (
        COALESCE(v1.msg_count, 0) + COALESCE(v2.msg_count, 0)
    ) as msg_count
FROM
    query_3707753 as v1
    FULL JOIN query_3431194 as v2 on v1.block_time = v2.block_time
order by
    block_time