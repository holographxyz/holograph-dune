SELECT SUM(total_transactions) AS total_transactions FROM (
WITH linea_holograph_protocol_transactionsV2 AS (
  SELECT
    tx_hash AS tx,
    COUNT(index) AS id
  FROM linea.logs
  WHERE
    block_time >= TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
    AND block_time < TRY_CAST('2026-01-01 00:00:00' AS TIMESTAMP)
    AND (
      contract_address IN (
        SELECT 
          contract_address 
        FROM query_3681460
      ) -- Linea - deployed holographable contracts V2
      OR contract_address IN (
        SELECT 
          contract_address 
        FROM query_3410710
      ) -- Holograph Protocol contract addresses V2
    )
  GROUP BY
    tx_hash
)
SELECT
  COUNT(tx) AS total_transactions
FROM linea_holograph_protocol_transactionsV2)