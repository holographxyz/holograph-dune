SELECT
  COALESCE(SUM(ARB.msg_count), 0) as bridge_jobs
FROM
  query_2611173 AS ARB