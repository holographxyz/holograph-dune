SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(BNB.wallet) as unique_wallets
  FROM
    query_2430222 AS BNB -- BNB Chain - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(BNB.wallet) as unique_wallets
  FROM
    query_3410807 AS BNB -- BNB Chain - Holograph Protocol related unique wallets

) AS combined_results
