Select
  sum(bridge_jobs) as bridge_jobs
from
  (
    SELECT
      (
        ETH.bridge_jobs + MATIC.bridge_jobs + AVAX.bridge_jobs + BNB.bridge_jobs + OP.bridge_jobs + COALESCE(ARB.bridge_jobs, 0)
      ) AS bridge_jobs
    FROM
      query_3707782 AS ETH /* Ethereum - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3707789 AS MATIC /* Polygon - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3707799 AS AVAX /* Avalanche - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3707803 AS BNB /* BNB Chain - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3707975 AS OP /* Optimism - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3707991 AS ARB /* Arbitrum - Holograph Protocol created bridge jobs */
    UNION ALL
    SELECT
      (
        ETH.bridge_jobs + MATIC.bridge_jobs + AVAX.bridge_jobs + BNB.bridge_jobs + OP.bridge_jobs + COALESCE(ARB.bridge_jobs, 0) + COALESCE(ZORA.bridge_jobs, 0) + COALESCE(BASE.bridge_jobs, 0) + + COALESCE(LINEA.bridge_jobs, 0)
      ) AS bridge_jobs
    FROM
      query_3414291 AS ETH /* Ethereum - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414290 AS MATIC /* Polygon - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414294 AS BNB /* BNB Chain - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414292 AS AVAX /* Avalanche - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414295 AS OP /* Optimism - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414293 AS ARB /* Arbitrum - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414349 AS ZORA /* Zora - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3414348 AS BASE /* Base - Holograph Protocol created bridge jobs */
      CROSS JOIN query_3675398 AS LINEA /* Base - Holograph Protocol created bridge jobs */
  )