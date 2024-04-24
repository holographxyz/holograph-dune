SELECT
  (
    ETH.total_transactions + MATIC.total_transactions + AVAX.total_transactions + 
    BNB.total_transactions + OP.total_transactions + ARB.total_transactions +
    BASE.total_transactions + ZORA.total_transactions
  ) as total_transactions
FROM
  query_3643607 AS ETH -- Ethereum - Holograph Protocol related transactions
  CROSS JOIN query_3652976 AS MATIC -- Polygon - Holograph Protocol related transactions
  CROSS JOIN query_3652984 AS AVAX -- Avalanche - Holograph Protocol related transactions
  CROSS JOIN query_3652964 AS BNB -- BNB Chain - Holograph Protocol related transactions
  CROSS JOIN query_3643906 AS OP -- Optimism - Holograph Protocol related transactions
  CROSS JOIN query_3652981 AS ARB -- Arbitrum - Holograph Protocol related transactions
  CROSS JOIN query_3652988 AS BASE -- Base - Holograph Protocol related transactions
  CROSS JOIN query_3652990 AS ZORA -- Zora - Holograph Protocol related transactions