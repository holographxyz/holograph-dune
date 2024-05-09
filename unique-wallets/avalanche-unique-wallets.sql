SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(AVAX.wallet) as unique_wallets
  FROM
    query_3709469 AS AVAX -- Avalanche - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(AVAX.wallet) as unique_wallets
  FROM
    query_3410802 AS AVAX -- Avalanche - Holograph Protocol related unique wallets

) AS combined_results
