SELECT
  sum(bridge_jobs) as bridge_jobs
FROM
  (
    SELECT
      SUM(AVAX.msg_count) as bridge_jobs
    FROM
      query_3707667 AS AVAX
    UNION
    SELECT
      SUM(AVAX.msg_count) as bridge_jobs
    FROM
      query_3431197 AS AVAX
  )