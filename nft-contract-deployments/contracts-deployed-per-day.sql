SELECT
    days.day AS "date",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669337
        WHERE
            block_time = days.day
    ) AS "Ethereum",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669342
        WHERE
            block_time = days.day
    ) AS "Polygon",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669333
        WHERE
            block_time = days.day
    ) AS "BNB Chain",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669331
        WHERE
            block_time = days.day
    ) AS "Avalanche",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669339
        WHERE
            block_time = days.day
    ) AS "OP Mainnet",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3669322
        WHERE
            block_time = days.day
    ) AS "Arbitrum",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3430984
        WHERE
            block_time = days.day
    ) AS "Zora",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3430985
        WHERE
            block_time = days.day
    ) AS "Base",
    (
        SELECT
            COALESCE((contracts), 0)
        FROM
            query_3675395
        WHERE
            block_time = days.day
    ) AS "Line"
FROM
    query_2464155 as days
ORDER BY
    "date" ASC