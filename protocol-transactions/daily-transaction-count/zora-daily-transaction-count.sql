WITH
  zora_holograph_protocol_transactions AS (
    SELECT
      tx_hash AS tx,
      date_trunc('day', block_time) AS block_time
    FROM
      zora.logs
    WHERE
      block_time >= TIMESTAMP '2024-01-01 00:00:00'
      AND block_time < TIMESTAMP '2026-01-01 00:00:00'
      AND (
        contract_address IN (
          SELECT
            contract_address
          FROM
            query_3413382
        ) -- deployed holographable contracts
        OR contract_address IN (
          SELECT
            contract_address
          FROM
            query_3410710
        ) -- Holograph Protocol contract addresses
      )
    GROUP BY
      tx_hash,
      date_trunc('day', block_time)
  ),
  zora_holograph_protocol_transaction_counter AS (
    SELECT
      COUNT(tx) AS tx,
      block_time
    FROM
      zora_holograph_protocol_transactions
    GROUP BY
      tx,
      block_time
  )
SELECT
  block_time,
  SUM(tx) AS tx
FROM
  zora_holograph_protocol_transaction_counter
GROUP BY
  block_time
ORDER BY
  block_time ASC