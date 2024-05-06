SELECT
    days.day AS "date",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663559
        WHERE
            block_time = days.day
    ) AS "Ethereum",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663575
        WHERE
            block_time = days.day
    ) AS "Polygon",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663548
        WHERE
            block_time = days.day
    ) AS "BNB Chain",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663538
        WHERE
            block_time = days.day
    ) AS "Avalanche",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663569
        WHERE
            block_time = days.day
    ) AS "OP Mainnet",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663471
        WHERE
            block_time = days.day
    ) AS "Arbitrum",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663580
        WHERE
            block_time = days.day
    ) AS "Zora",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3663579
        WHERE
            block_time = days.day
    ) AS "Base",
    (
        SELECT
            COALESCE((tx), 0)
        FROM
            query_3681808
        WHERE
            block_time = days.day
    ) AS "Line"
FROM
    query_2464155 as days
ORDER BY
    "date" ASC