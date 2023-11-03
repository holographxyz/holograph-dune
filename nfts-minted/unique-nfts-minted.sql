WITH
  hlg_contracts_arbitrum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_arbitrum.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_arbitrum AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      arbitrum.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_arbitrum
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_avalanche_c AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_avalanche_c.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_avalanche_c AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      avalanche_c.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_avalanche_c
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_bnb AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_bnb.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_bnb AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      bnb.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_bnb
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_ethereum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_ethereum.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_ethereum AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      ethereum.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_ethereum
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_optimism AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_optimism.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_optimism AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      optimism.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_optimism
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_polygon AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_polygon.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_polygon AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      polygon.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_polygon
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_totals AS (
    SELECT
      *
    FROM
      (
        SELECT
          *
        FROM
          hlg_tokens_arbitrum
        UNION
        SELECT
          *
        FROM
          hlg_tokens_avalanche_c
        UNION
        SELECT
          *
        FROM
          hlg_tokens_bnb
        UNION
        SELECT
          *
        FROM
          hlg_tokens_ethereum
        UNION
        SELECT
          *
        FROM
          hlg_tokens_optimism
        UNION
        SELECT
          *
        FROM
          hlg_tokens_polygon
      ) t
    GROUP BY
      contract,
      tokenId
  ),
  hlg_contracts AS (
    SELECT DISTINCT
      contract
    FROM
      hlg_totals
  )
SELECT
  *
FROM
  (
    SELECT
      'Contracts' AS dataType,
      COUNT(contract) AS dataValue
    FROM
      hlg_contracts
    UNION
    SELECT
      'NFTs' AS dataType,
      COUNT(tokenId) AS dataValue
    FROM
      hlg_totals
  ) t ORDER BY dataType ASC