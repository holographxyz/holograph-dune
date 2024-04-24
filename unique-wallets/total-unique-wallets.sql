SELECT
  (
    ETH.unique_wallets + MATIC.unique_wallets + AVAX.unique_wallets +
    BNB.unique_wallets + OP.unique_wallets + ARB.unique_wallets +
    BASE.unique_wallets + ZORA.unique_wallets
  ) as unique_wallets
FROM
  query_3653121 AS ETH -- Ethereum - Holograph Unique Wallets
  CROSS JOIN query_3653129 AS MATIC -- Polygon - Holograph Unique Wallets
  CROSS JOIN query_3653133 AS AVAX -- Avalanche - Holograph Unique Wallets
  CROSS JOIN query_3653124 AS BNB -- BNB Chain - Holograph Unique Wallets
  CROSS JOIN query_3653122 AS OP -- Optimism - Holograph Unique Wallets
  CROSS JOIN query_3653131 AS ARB -- Arbitrum - Holograph Unique Wallets
  CROSS JOIN query_3653136 AS BASE -- Base - Holograph Unique Wallets
  CROSS JOIN query_3653137 AS ZORA -- Zora - Holograph Unique Wallets