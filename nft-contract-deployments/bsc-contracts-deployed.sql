SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(BNB.contracts) as contracts_deployed
    FROM
      query_2465035 AS BNB
    UNION
    SELECT
      COALESCE(SUM(BNB.contracts), 0) as contracts_deployed
    FROM
      query_3430979 AS BNB
  )