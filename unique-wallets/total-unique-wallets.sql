WITH
  holograph AS (
    SELECT
      contract_address
    FROM
      query_2357917 -- Holograph Protocol contract addresses
  ),
  arbitrum_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_arbitrum.HolographFactory_evt_BridgeableContractDeployed
  ),
  arbitrum_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          arbitrum.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      arbitrum.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          arbitrum_contracts
      )
    GROUP BY
      1
  ),
  avalanche_c_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_avalanche_c.HolographFactory_evt_BridgeableContractDeployed
  ),
  avalanche_c_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          avalanche_c.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      avalanche_c.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          avalanche_c_contracts
      )
    GROUP BY
      1
  ),
  bnb_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_bnb.HolographFactory_evt_BridgeableContractDeployed
  ),
  bnb_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          bnb.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      bnb.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          bnb_contracts
      )
    GROUP BY
      1
  ),
  ethereum_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_ethereum.HolographFactory_evt_BridgeableContractDeployed
  ),
  ethereum_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          ethereum.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      ethereum.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          ethereum_contracts
      )
    GROUP BY
      1
  ),
  optimism_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_optimism.HolographFactory_evt_BridgeableContractDeployed
  ),
  optimism_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          optimism.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      optimism.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          optimism_contracts
      )
    GROUP BY
      1
  ),
  polygon_contracts AS (
    SELECT
      contract_address
    FROM
      holograph
    UNION
    SELECT
      contractAddress AS contract_address
    FROM
      holograph_factory_polygon.HolographFactory_evt_BridgeableContractDeployed
  ),
  polygon_wallets AS (
    SELECT
      (
        SELECT
          "from" AS wallet
        FROM
          polygon.transactions
        WHERE
          block_number = logs.block_number
          AND hash = logs.tx_hash
      ) AS wallet
    FROM
      polygon.logs AS logs
    WHERE
      block_time > TIMESTAMP '2022-12-31 23:59:59'
      AND logs.contract_address IN (
        SELECT
          contract_address
        FROM
          polygon_contracts
      )
    GROUP BY
      1
  ),
  wallets AS (
    SELECT
      wallet
    FROM
      arbitrum_wallets
    UNION
    SELECT
      wallet
    FROM
      avalanche_c_wallets
    UNION
    SELECT
      wallet
    FROM
      bnb_wallets
    UNION
    SELECT
      wallet
    FROM
      ethereum_wallets
    UNION
    SELECT
      wallet
    FROM
      optimism_wallets
    UNION
    SELECT
      wallet
    FROM
      polygon_wallets
  )
SELECT
  COUNT(wallet) AS "Unique Wallets"
FROM
  wallets