WITH bnb_chain_holograph_protocol_transactions AS (
  SELECT
    tx_hash AS tx,
    date_trunc('day', block_time) AS block_time
  FROM bnb.logs
  WHERE
    block_time >= TRY_CAST('2023-01-01 00:00:00' AS TIMESTAMP)
    AND block_time < TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
    AND (
      contract_address IN (
        SELECT
          contract_address
        FROM query_2358000
      ) /* BNB Chain - deployed holographable contracts */
      OR contract_address IN (
        SELECT
          contract_address
        FROM query_2357917
      ) /* Holograph Protocol contract addresses */
    )
  GROUP BY
    tx_hash,
    date_trunc('day', block_time)
), bnb_chain_holograph_protocol_transactionsV2 AS (
  SELECT
    tx_hash AS tx,
    date_trunc('day', block_time) AS block_time
  FROM bnb.logs
  WHERE
    block_time >= TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
    AND block_time < TRY_CAST('2026-01-01 00:00:00' AS TIMESTAMP)
    AND (
      contract_address IN (
        SELECT
          contract_address
        FROM query_3410755
      ) /* BNB Chain - deployed holographable contracts V2 */
      OR contract_address IN (
        SELECT
          contract_address
        FROM query_3410710
      ) /* Holograph Protocol contract addresses V2 */
    )
  GROUP BY
    tx_hash,
    date_trunc('day', block_time)
), bnb_chain_holograph_protocol_combined_transactions AS (
  SELECT * FROM bnb_chain_holograph_protocol_transactions
  UNION ALL
  SELECT * FROM bnb_chain_holograph_protocol_transactionsV2
), bnb_chain_holograph_protocol_transaction_counter AS (
    SELECT
      COUNT(tx) AS tx,
      block_time
    FROM
      bnb_chain_holograph_protocol_combined_transactions
    GROUP BY
      tx, block_time
  )
SELECT
  block_time,
  SUM(tx) AS tx
FROM
  bnb_chain_holograph_protocol_transaction_counter
GROUP BY
  block_time
ORDER BY
  block_time ASC;