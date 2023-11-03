WITH
  bsc_holograph_protocol_transactions AS (
    SELECT
      tx_hash AS tx,
      COUNT(index) AS id
    FROM
      bnb.logs
    WHERE
      block_time >= TIMESTAMP '2023-01-01 00:00:00'
      AND block_time < TIMESTAMP '2024-01-01 00:00:00'
      AND (
        contract_address IN (SELECT contract_address FROM query_2358000) -- Binance Smart Chain - deployed holographable contracts
        OR contract_address IN (SELECT contract_address FROM query_2357917) -- Holograph Protocol contract addresses
      )
    GROUP BY
      tx_hash
  )
SELECT
  COUNT(bsc_holograph_protocol_transactions.tx) AS total_transactions
FROM
  bsc_holograph_protocol_transactions