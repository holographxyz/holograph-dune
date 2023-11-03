SELECT
  (
    ETH.contracts_deployed + MATIC.contracts_deployed + AVAX.contracts_deployed + BNB.contracts_deployed + OP.contracts_deployed + ARB.contracts_deployed
  ) as contracts_deployed
FROM
  query_2433395 AS ETH
  CROSS JOIN query_2433382 AS MATIC
  CROSS JOIN query_2433387 AS AVAX
  CROSS JOIN query_2433391 AS BNB
  CROSS JOIN query_2506138 AS OP
  CROSS JOIN query_2611164 AS ARB