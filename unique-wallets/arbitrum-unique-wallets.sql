SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(ARB.wallet) as unique_wallets
  FROM
    query_2611221 AS ARB -- Arbitrum - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(ARB.wallet) as unique_wallets
  FROM
    query_3410806 AS ARB -- Arbitrum - Holograph Protocol related unique wallets

) AS combined_results
