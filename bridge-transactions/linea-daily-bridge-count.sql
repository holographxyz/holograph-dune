WITH
  linea_holograph_protocol_bridge_jobs AS (
    SELECT
      date_trunc('day', evt_block_time) AS block_time,
      messageHash AS msg
    FROM
        holograph_operator_v2_linea.HolographOperator_evt_CrossChainMessageSent
    WHERE
      evt_block_time >= TIMESTAMP '2024-01-01 00:00:00'
    GROUP BY
      date_trunc('day', evt_block_time),
      messageHash
  ),
  linea_holograph_protocol_bridge_jobs_counter AS (
    SELECT
      COUNT(msg) AS msg_count,
      block_time
    FROM
      linea_holograph_protocol_bridge_jobs
    GROUP BY
      msg,
      block_time
  )
SELECT
  block_time,
  SUM(msg_count) AS msg_count
FROM
  linea_holograph_protocol_bridge_jobs_counter
GROUP BY
  block_time
ORDER BY
  block_time ASC
  