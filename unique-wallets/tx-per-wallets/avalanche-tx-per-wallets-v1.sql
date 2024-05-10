SELECT
    COUNT(logs.tx) AS transactions,
    tx.wallet AS wallet
FROM
    (
        SELECT
            tx_hash AS tx
        FROM
            avalanche_c.logs
        WHERE
            block_time >= TIMESTAMP '2023-01-01 00:00:00'
            AND block_time < TIMESTAMP '2024-12-31 00:00:00'
            AND (
                contract_address IN (
                    SELECT
                        contract_address
                    FROM
                        query_2357917
                ) -- Holograph Protocol contract addresses
                OR contract_address IN (
                    SELECT
                        contract_address
                    FROM
                        query_2357969
                ) -- Avalanche - deployed holographable contracts
            )
        GROUP BY
            tx_hash
    ) logs
    LEFT JOIN (
        SELECT
            hash as tx,
            "from" AS wallet
        FROM
            avalanche_c.transactions
        WHERE
            block_time >= TIMESTAMP '2023-01-01 00:00:00'
            AND block_time < TIMESTAMP '2024-12-31 00:00:00'
    ) tx ON logs.tx = tx.tx
GROUP BY
    tx.wallet
ORDER BY
    transactions DESC,
    wallet ASC