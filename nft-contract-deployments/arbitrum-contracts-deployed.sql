SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(ARB.contracts) as contracts_deployed
    FROM
      query_2611160 AS ARB
    UNION
    SELECT
      COALESCE(SUM(ARB.contracts), 0) as contracts_deployed
    FROM
      query_3430983 AS ARB
  )