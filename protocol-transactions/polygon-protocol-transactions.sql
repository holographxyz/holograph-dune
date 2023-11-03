WITH
  polygon_holograph_protocol_transactions AS (
    SELECT
      tx_hash AS tx
    FROM
      polygon.logs
    WHERE
      block_time >= TIMESTAMP '2023-01-01 00:00:00'
      AND block_time < TIMESTAMP '2024-01-01 00:00:00'
      AND (
        contract_address IN (SELECT contract_address FROM query_2357959) -- Polygon - deployed holographable contracts
        OR contract_address IN (SELECT contract_address FROM query_2357917) -- Holograph Protocol contract addresses
      )
    GROUP BY
      tx_hash
  )
SELECT
  COUNT(polygon_holograph_protocol_transactions.tx) AS total_transactions
FROM
  polygon_holograph_protocol_transactions