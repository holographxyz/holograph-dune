WITH
  hlg_contracts_linea AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_linea.HolographFactory_evt_BridgeableContractDeployed
  )
SELECT
  contract_address AS contract,
  topic3 AS tokenId
FROM
  base.logs
WHERE
  contract_address IN (
    SELECT
      *
    FROM
      hlg_contracts_linea
  )
  AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
  AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
  AND topic3 IS NOT NULL -- ERC721 Transfer
  AND tx_hash NOT IN (
    SELECT
      evt_tx_hash
    FROM
      holograph_operator_v2_linea.HolographOperator_evt_FinishedOperatorJob
    WHERE
      evt_block_number = block_number
  )
GROUP BY
  contract_address,
  topic3
