Select sum(bridge_jobs)as bridge_jobs from (
SELECT
  (
    ETH.bridge_jobs + MATIC.bridge_jobs + AVAX.bridge_jobs + BNB.bridge_jobs + OP.bridge_jobs + COALESCE(ARB.bridge_jobs, 0)
  ) AS bridge_jobs
FROM query_2358088 AS ETH /* Ethereum - Holograph Protocol created bridge jobs */
CROSS JOIN query_2358092 AS MATIC /* Polygon - Holograph Protocol created bridge jobs */
CROSS JOIN query_2358095 AS AVAX /* Avalanche - Holograph Protocol created bridge jobs */
CROSS JOIN query_2358097 AS BNB /* BNB Chain - Holograph Protocol created bridge jobs */
CROSS JOIN query_2506110 AS OP /* Optimism - Holograph Protocol created bridge jobs */
CROSS JOIN query_2611178 AS ARB /* Arbitrum - Holograph Protocol created bridge jobs */
UNION ALL
SELECT
  (
    ETH.bridge_jobs + MATIC.bridge_jobs + AVAX.bridge_jobs + BNB.bridge_jobs + OP.bridge_jobs + COALESCE(ARB.bridge_jobs, 0) + COALESCE(ZORA.bridge_jobs, 0) + COALESCE(BASE.bridge_jobs, 0)
  ) AS bridge_jobs
FROM query_3414291 AS ETH /* Ethereum - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414290 AS MATIC /* Polygon - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414294 AS BNB /* BNB Chain - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414292 AS AVAX /* Avalanche - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414295 AS OP /* Optimism - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414293 AS ARB /* Arbitrum - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414349 AS ZORA /* Zora - Holograph Protocol created bridge jobs */
CROSS JOIN query_3414348 AS BASE /* Base - Holograph Protocol created bridge jobs */
)