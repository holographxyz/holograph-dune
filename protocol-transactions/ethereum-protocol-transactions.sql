WITH
  ethereum_holograph_protocol_transactions AS (
    SELECT
      tx_hash AS tx,
      COUNT(index) AS id
    FROM
      ethereum.logs
    WHERE
      block_time >= TIMESTAMP '2023-01-01 00:00:00'
      AND block_time < TIMESTAMP '2024-01-01 00:00:00'
      AND (
        contract_address IN (SELECT contract_address FROM query_2357903) -- Ethereum - deployed holographable contracts
        OR contract_address IN (SELECT contract_address FROM query_2357917) -- Holograph Protocol contract addresses
      )
    GROUP BY
      tx_hash
  )
SELECT
  COUNT(ethereum_holograph_protocol_transactions.tx) AS total_transactions
FROM
  ethereum_holograph_protocol_transactions