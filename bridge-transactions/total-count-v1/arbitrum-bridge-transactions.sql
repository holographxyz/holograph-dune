SELECT
  COALESCE(SUM(ARB.msg_count), 0) as bridge_jobs
FROM
  query_3707643 AS ARB