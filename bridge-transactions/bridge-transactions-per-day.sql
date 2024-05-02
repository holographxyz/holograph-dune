SELECT
    days.day AS "date",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662580
        WHERE
            block_time = days.day
    ) AS "Arbitrum",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662385
        WHERE
            block_time = days.day
    ) AS "Avalanche",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3431201
        WHERE
            block_time = days.day
    ) AS "Base",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662576
        WHERE
            block_time = days.day
    ) AS "BNB Chain",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662301
        WHERE
            block_time = days.day
    ) AS "Ethereum",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662582
        WHERE
            block_time = days.day
    ) AS "OP Mainnet",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3662588
        WHERE
            block_time = days.day
    ) AS "Polygon",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3431200
        WHERE
            block_time = days.day
    ) AS "Zora",
    (
        SELECT
            COALESCE((msg_count), 0)
        FROM
            query_3675390
        WHERE
            block_time = days.day
    ) AS "Linea"
FROM
    query_2464155 as days
ORDER BY
    "date" ASC