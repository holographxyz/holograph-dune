WITH
  hlg_contracts_arbitrum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_arbitrum.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_arbitrum AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      arbitrum.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_arbitrum
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_arbitrum.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_contracts_avalanche_c AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_avalanche_c.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_avalanche_c AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      avalanche_c.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_avalanche_c
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_avalanche_c.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_contracts_bnb AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_bnb.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_bnb AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      bnb.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_bnb
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_bnb.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_contracts_ethereum AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_ethereum.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_ethereum AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      ethereum.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_ethereum
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_ethereum.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_contracts_optimism AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_optimism.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_optimism AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      optimism.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_optimism
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_optimism.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_contracts_polygon AS (
    SELECT
      contractAddress
    FROM
      holograph_factory_polygon.HolographFactory_evt_BridgeableContractDeployed
  ),
  hlg_tokens_polygon AS (
    SELECT
      contract_address AS contract,
      topic3 AS tokenId
    FROM
      polygon.logs
    WHERE
      contract_address IN (
        SELECT
          *
        FROM
          hlg_contracts_polygon
      )
      AND topic0 = 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef -- Transfer
      AND topic1 = 0x0000000000000000000000000000000000000000000000000000000000000000 -- Minting
      AND topic3 IS NOT NULL -- ERC721 Transfer
      AND tx_hash NOT IN (
        SELECT
          evt_tx_hash
        FROM
          holograph_operator_polygon.HolographOperator_evt_FinishedOperatorJob
        WHERE
          evt_block_number = block_number
      )
    GROUP BY
      contract_address,
      topic3
  ),
  hlg_totals AS (
    SELECT
      *
    FROM
      (
        SELECT
          'Arbitrum One' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_arbitrum
        UNION
        SELECT
          'Avalanche' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_avalanche_c
        UNION
        SELECT
          'BNB Chain' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_bnb
        UNION
        SELECT
          'Ethereum' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_ethereum
        UNION
        SELECT
          'Optimism' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_optimism
        UNION
        SELECT
          'Polygon' AS chain,
          COUNT(tokenId) AS NFTs
        FROM
          hlg_tokens_polygon
      ) t
    ORDER BY
      1 ASC
  ),
  hlg_contracts AS (
    SELECT
      *
    FROM
      (
        SELECT
          'Arbitrum One' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_arbitrum
        UNION
        SELECT
          'Avalanche' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_avalanche_c
        UNION
        SELECT
          'BNB Chain' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_bnb
        UNION
        SELECT
          'Ethereum' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_ethereum
        UNION
        SELECT
          'Optimism' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_optimism
        UNION
        SELECT
          'Polygon' AS chain,
          COUNT(contractAddress) AS contracts
        FROM
          hlg_contracts_polygon
      ) t
    ORDER BY
      1 ASC
  )
SELECT
  nfts.chain AS "Chain",
  nfts.NFTs AS "NFTs Minted",
  contracts.contracts AS "Contracts Deployed"
FROM
  hlg_totals AS nfts
  LEFT JOIN hlg_contracts AS contracts ON nfts.chain = contracts.chain
ORDER BY
  1 ASC