SELECT
    week.week_date AS "DATE",
    (
        SELECT
            COALESCE(SUM(Ethereum),0) AS Ethereum_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Ethereum",
    (
        SELECT
            COALESCE(SUM(Polygon),0) AS Polygon_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Polygon",
    (
        SELECT
            COALESCE(SUM("BNB Chain"),0) AS bsc_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "BNB Chain",
    (
        SELECT
            COALESCE(SUM(Avalanche),0) AS Avalanche_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Avalanche",
    (
        SELECT
            COALESCE(SUM("OP Mainnet"),0) AS op_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "OP Mainnet",
    (
        SELECT
            COALESCE(SUM(Arbitrum),0) AS Arbitrum_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Arbitrum",
    (
        SELECT
            COALESCE(SUM(Zora),0) AS Zora_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Zora",
    (
        SELECT
            COALESCE(SUM(Base),0) AS Base_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Base",
    (
        SELECT
            COALESCE(SUM(Line),0) AS Line_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "Line",
     (
        SELECT
           ( COALESCE(SUM(Ethereum),0) 
            +COALESCE(SUM(Polygon),0) 
            +COALESCE(SUM("BNB Chain"),0) 
            +COALESCE(SUM(Avalanche),0) 
            +COALESCE(SUM("OP Mainnet"),0) 
            +COALESCE(SUM(Arbitrum),0) 
            +COALESCE(SUM(Zora),0) 
            +COALESCE(SUM(Base),0) 
            +COALESCE(SUM(Line),0) 
           ) AS total_count
        FROM
            query_3690271
        WHERE
            date >= TRY_CAST (week.week_date AS TIMESTAMP)
            AND date < TRY_CAST (week.next_week_date AS TIMESTAMP)
    ) AS "total"  
FROM
    query_3701020 AS week
    order by week.week_date