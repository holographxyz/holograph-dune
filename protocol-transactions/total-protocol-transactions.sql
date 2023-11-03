SELECT
  (
    ETH.total_transactions + MATIC.total_transactions + AVAX.total_transactions + BNB.total_transactions + OP.total_transactions + ARB.total_transactions
  ) as total_transactions
FROM
  query_2357569 AS ETH -- Ethereum - Holograph Protocol related transactions
  CROSS JOIN query_2357966 AS MATIC -- Polygon - Holograph Protocol related transactions
  CROSS JOIN query_2357987 AS AVAX -- Avalanche - Holograph Protocol related transactions
  CROSS JOIN query_2357997 AS BNB -- BNB Chain - Holograph Protocol related transactions
  CROSS JOIN query_2506140 AS OP -- Optimism - Holograph Protocol related transactions
  CROSS JOIN query_2611065 AS ARB -- Arbitrum - Holograph Protocol related transactions