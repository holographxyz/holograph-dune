Select
  sum(contracts_deployed) as contracts_deployed
from
  (
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
    UNION ALL
    SELECT
      (
        ETH.contracts_deployed + MATIC.contracts_deployed + BNB.contracts_deployed + AVAX.contracts_deployed + OP.contracts_deployed + ARB.contracts_deployed + ZORA.contracts_deployed + BASE.contracts_deployed
      ) as contracts_deployed
    FROM
      query_3414311 AS ETH
      CROSS JOIN query_3414310 AS MATIC
      CROSS JOIN query_3414314 AS BNB
      CROSS JOIN query_3414313 AS AVAX
      CROSS JOIN query_3414312 AS OP
      CROSS JOIN query_3414315 AS ARB
      CROSS JOIN query_3414353 AS ZORA
      CROSS JOIN query_3414352 AS BASE
  )