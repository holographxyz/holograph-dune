SELECT
  sum(bridge_jobs) as bridge_jobs
FROM
  (
    SELECT
      COALESCE(SUM(ARB.msg_count), 0) as bridge_jobs
    FROM
      query_3707643 AS ARB
    UNION
    SELECT
      COALESCE(SUM(ARB.msg_count), 0) as bridge_jobs
    FROM
      query_3431209 AS ARB
  )