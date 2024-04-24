SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(MATIC.contracts) as contracts_deployed
    FROM
      query_2465033 AS MATIC
    UNION
    SELECT
      COALESCE(SUM(BNB.contracts), 0) as contracts_deployed
    FROM
      query_3430979 AS BNB
  )