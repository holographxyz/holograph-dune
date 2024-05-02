SELECT
  SUM(unique_wallets) as unique_wallets
FROM
(
  SELECT
    COUNT(OP.wallet) as unique_wallets
  FROM
    query_2506098 AS OP -- Optimism - Holograph Protocol related unique wallets

  UNION ALL

  SELECT
    COUNT(OP.wallet) as unique_wallets
  FROM
    query_3410803 AS OP -- Optimism - Holograph Protocol related unique wallets

) AS combined_results
