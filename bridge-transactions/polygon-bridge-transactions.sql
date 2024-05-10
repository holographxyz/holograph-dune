SELECT
  sum(bridge_jobs) as bridge_jobs
FROM
  (
    SELECT
      SUM(MATIC.msg_count) as bridge_jobs
    FROM
      query_3707753 AS MATIC
    UNION
    SELECT
      SUM(MATIC.msg_count) as bridge_jobs
    FROM
      query_3431194 AS MATIC
  )