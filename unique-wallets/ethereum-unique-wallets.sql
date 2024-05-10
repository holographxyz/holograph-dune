SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(ETH.wallet) as unique_wallets
  FROM
    query_3709489 AS ETH -- Ethereum - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(ETH.wallet) as unique_wallets
  FROM
    query_3410780 AS ETH -- Ethereum - Holograph Protocol related unique wallets
) AS combined_results
