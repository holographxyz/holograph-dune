SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(MATIC.wallet) as unique_wallets
  FROM
    query_2429958 AS MATIC -- Polygon - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(MATIC.wallet) as unique_wallets
  FROM
    query_3410800 AS MATIC -- Polygon - Holograph Protocol related unique wallets

) AS combined_results
