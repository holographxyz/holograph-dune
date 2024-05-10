SELECT
  sum(bridge_jobs) as bridge_jobs
FROM
  (
    SELECT
      SUM(ETH.msg_count) as bridge_jobs
    FROM
      query_3707692 AS ETH
    UNION
    SELECT
      SUM(ETH.msg_count) as bridge_jobs
    FROM
      query_3431193 AS ETH
  )