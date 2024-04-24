SELECT
  sum(contracts_deployed) as contracts_deployed
FROM
  (
    SELECT
      SUM(AVAX.contracts) as contracts_deployed
    FROM
      query_2465008 AS AVAX
    UNION
    SELECT
      COALESCE(SUM(AVAX.contracts), 0) as contracts_deployed
    FROM
      query_3430980 AS AVAX
  )