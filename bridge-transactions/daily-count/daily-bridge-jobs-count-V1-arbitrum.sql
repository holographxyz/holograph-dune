WITH
  arbitrum_holograph_protocol_bridge_jobs AS (
    SELECT
      date_trunc('day', evt_block_time) AS block_time,
      messageHash AS msg
    FROM
      holograph_operator_arbitrum.HolographOperator_evt_CrossChainMessageSent
    WHERE
      evt_block_time >= TIMESTAMP '2023-01-01 00:00:00'
      AND evt_block_time < TIMESTAMP '2024-12-31 00:00:00'
    GROUP BY
      date_trunc('day', evt_block_time),
      messageHash
  ),
  arbitrum_holograph_protocol_bridge_jobs_counter AS (
    SELECT
      COUNT(msg) AS msg_count,
      block_time
    FROM
      arbitrum_holograph_protocol_bridge_jobs
    GROUP BY
      msg,
      block_time
  )
SELECT
  block_time,
  SUM(msg_count) AS msg_count
FROM
  arbitrum_holograph_protocol_bridge_jobs_counter
GROUP BY
  block_time
ORDER BY
  block_time ASC