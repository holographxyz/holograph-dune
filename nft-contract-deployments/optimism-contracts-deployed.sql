SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(OP.contracts) as contracts_deployed
    FROM
      query_3708895 AS OP
    UNION
SELECT
  COALESCE(SUM(OP.contracts), 0) as contracts_deployed
FROM
  query_3430981 AS OP
  )