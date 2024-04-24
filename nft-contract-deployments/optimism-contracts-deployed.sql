SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(OP.contracts) as contracts_deployed
    FROM
      query_2506134 AS OP
    UNION
    SELECT
      SUM(OP.msg_count) as bridge_jobs
    FROM
      query_3431199 AS OP
  )