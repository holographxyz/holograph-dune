SELECT
  (
    ETH.bridge_jobs + MATIC.bridge_jobs + AVAX.bridge_jobs + BNB.bridge_jobs + OP.bridge_jobs + COALESCE(ARB.bridge_jobs, 0)
  ) as bridge_jobs
FROM
  query_2358088 AS ETH -- Ethereum - Holograph Protocol created bridge jobs
  CROSS JOIN query_2358092 AS MATIC -- Polygon - Holograph Protocol created bridge jobs
  CROSS JOIN query_2358095 AS AVAX -- Avalanche - Holograph Protocol created bridge jobs
  CROSS JOIN query_2358097 AS BNB -- BNB Chain - Holograph Protocol created bridge jobs
  CROSS JOIN query_2506110 AS OP -- Optimism - Holograph Protocol created bridge jobs
  CROSS JOIN query_2611178 AS ARB -- Arbitrum - Holograph Protocol created bridge jobs