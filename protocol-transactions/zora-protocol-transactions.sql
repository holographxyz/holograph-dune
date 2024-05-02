WITH
  zora_holograph_protocol_transactions AS (
    SELECT
      tx_hash AS tx,
      COUNT(index) AS id
    FROM
      zora.logs
    WHERE
      block_time >= TIMESTAMP '2024-01-01 00:00:00'
      AND block_time < TIMESTAMP '2026-01-01 00:00:00'
      AND (
        contract_address IN (SELECT contract_address FROM query_3413382) -- Zora - deployed holographable contracts V2
        OR contract_address IN (SELECT contract_address FROM query_3410710) -- Holograph Protocol contract addresses V2
      )
    GROUP BY
      tx_hash
  )
SELECT
  COUNT(zora_holograph_protocol_transactions.tx) AS total_transactions
FROM
  zora_holograph_protocol_transactions