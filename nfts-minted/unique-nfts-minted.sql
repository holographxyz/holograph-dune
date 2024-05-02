WITH
  hlg_contracts_ethereum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_ethereum.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_polygon AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_polygon.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_bnb AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_bnb.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_avalanche_c AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_avalanche_c.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_arbitrum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_arbitrum.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_optimism AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_optimism.HolographFactory_evt_BridgeableContractDeployed
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
  hlg_contracts_zora AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_v2_zora.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_zora AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      zora.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_zora
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_base AS (
    SELECT
      contract_address as contractAddress
    FROM
      holograph_factory_v2_base.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_base AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      base.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_base
      )
      AND logs.topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND logs.topic3 IS NOT NULL -- ERC721 Transfer
    GROUP BY
      logs.contract_address,
      logs.topic3
  ),
  hlg_contracts_linea AS (
    SELECT
      contract_address as contractAddress
    FROM
      holograph_factory_v2_linea.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_linea AS (
    SELECT
      logs.contract_address AS contract,
      logs.topic3 AS tokenId
    FROM
      linea.logs AS logs
    WHERE
      logs.contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_linea
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
          hlg_tokens_ethereum
        UNION
        SELECT
          *
        FROM
          hlg_tokens_polygon
        UNION
        SELECT
          *
        FROM
          hlg_tokens_bnb
        UNION
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
          hlg_tokens_optimism
        UNION
        SELECT
          *
        FROM
          hlg_tokens_zora
        UNION
        SELECT
          *
        FROM
          hlg_tokens_base
        UNION
        SELECT
          *
        FROM
          hlg_tokens_linea
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
  ) t
ORDER BY
  dataType ASC