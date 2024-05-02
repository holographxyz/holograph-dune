WITH
    ethereum_contracts AS (
        SELECT
            *
        FROM
            query_3646067
    ),
    polygon_contracts AS (
        SELECT
            *
        FROM
            query_3646138
    ),
    avalanche_contracts AS (
        SELECT
            *
        FROM
            query_3646152
    ),
    arbitrum_contracts AS (
        SELECT
            *
        FROM
            query_3646141
    ),
    base_contracts AS (
        SELECT
            *
        FROM
            query_3646330
    ),
    bsc_contracts AS (
        SELECT
            *
        FROM
            query_3646134
    ),
    op_contracts AS (
        SELECT
            *
        FROM
            query_3646313
    ),
    zora_contracts AS (
        SELECT
            *
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
          'Arbitrum' AS chain,
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
          'OP Mainnet' AS chain,
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
          'Arbitrum' AS chain,
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
          'OP Mainnet' AS chain,
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
  nfts.chain AS "chain",
  nfts.NFTs AS "nfts",
  contracts.contracts AS "Contracts Deployed"
FROM
    (
        SELECT
            'Ethereum' AS chain,
            contracts_deployed
        FROM
            ethereum_contracts
        UNION
        SELECT
            'Polygon' AS chain,
            contracts_deployed
        FROM
            polygon_contracts
        UNION
        SELECT
            'Avalanche' AS chain,
            contracts_deployed
        FROM
            avalanche_contracts
        UNION
        SELECT
            'Arbitrum' AS chain,
            contracts_deployed
        FROM
            arbitrum_contracts
        UNION
        SELECT
            'Base' AS chain,
            contracts_deployed
        FROM
            base_contracts
        UNION
        SELECT
            'BNB Chain' AS chain,
            contracts_deployed
        FROM
            bsc_contracts
        UNION
        SELECT
            'OP Mainnet' AS chain,
            contracts_deployed
        FROM
            op_contracts
        UNION
        SELECT
            'Zora' AS chain,
            contracts_deployed
        FROM
            zora_contracts
    )