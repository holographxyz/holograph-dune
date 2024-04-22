SELECT SUM(total_transactions) AS total_transactions FROM (
WITH avalanche_holograph_protocol_transactions AS (
  SELECT
    tx_hash AS tx,
    COUNT(index) AS id
  FROM avalanche_c.logs
  WHERE
    block_time >= TRY_CAST('2023-01-01 00:00:00' AS TIMESTAMP)
    AND block_time < TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
    AND (
      contract_address IN (
        SELECT 
          contract_address 
        FROM query_2357969
      ) -- Avalanche - deployed holographable contracts
      OR contract_address IN (
        SELECT 
          contract_address 
        FROM query_2357917
      ) -- Holograph Protocol contract addresses
    )
  GROUP BY
    tx_hash
), avalanche_holograph_protocol_transactionsV2 AS (
  SELECT
    tx_hash AS tx,
    COUNT(index) AS id
  FROM avalanche_c.logs
  WHERE
    block_time >= TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
    AND block_time < TRY_CAST('2026-01-01 00:00:00' AS TIMESTAMP)
    AND (
      contract_address IN (
        SELECT 
          contract_address 
        FROM query_3410746
      ) -- Avalanche - deployed holographable contracts V2
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
FROM avalanche_holograph_protocol_transactions
UNION ALL
SELECT
  COUNT(tx) AS total_transactions
FROM avalanche_holograph_protocol_transactionsV2)