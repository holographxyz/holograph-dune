WITH
  avalanche_holograph_protocol_contract_deployments AS (
    SELECT
      date_trunc('day', evt_block_time) AS block_time,
      contractAddress AS contract
    FROM
      holograph_factory_avalanche_c.HolographFactory_evt_BridgeableContractDeployed
    WHERE
      evt_block_time >= TIMESTAMP '2023-01-01 00:00:00'
      AND evt_block_time < TIMESTAMP '2024-12-31 00:00:00'
    GROUP BY
      date_trunc('day', evt_block_time),
      contractAddress
  ),
  avalanche_holograph_protocol_contract_deployments_counter AS (
    SELECT
      COUNT(contract) AS contract_count,
      block_time
    FROM
      avalanche_holograph_protocol_contract_deployments
    GROUP BY
      contract,
      block_time
  )
SELECT
  block_time,
  SUM(contract_count) AS contracts
FROM
  avalanche_holograph_protocol_contract_deployments_counter
GROUP BY
  block_time
ORDER BY
  block_time ASC