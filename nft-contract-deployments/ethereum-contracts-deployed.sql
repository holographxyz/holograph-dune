SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(ETH.contracts) as contracts_deployed
    FROM
      query_3708890 AS ETH
    UNION
    SELECT
      COALESCE(SUM(ETH.contracts), 0) as contracts_deployed
    FROM
      query_3430966 AS ETH
  )