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
            query_3646324
    )
SELECT
    *
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