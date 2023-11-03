SELECT
  days.day AS "date",
  COALESCE(
    (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2465033
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2465008
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2465035
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2465041
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2506134
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_2611160
      WHERE
        block_time <= days.day
    ),
    0
  ) AS "Total",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2611160
    WHERE
      block_time <= days.day
  ) AS "Arbitrum",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2465008
    WHERE
      block_time <= days.day
  ) AS "Avalanche",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2465035
    WHERE
      block_time <= days.day
  ) AS "BNB Chain",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2465041
    WHERE
      block_time <= days.day
  ) AS "Ethereum",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2506134
    WHERE
      block_time <= days.day
  ) AS "Optimism",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_2465033
    WHERE
      block_time <= days.day
  ) AS "Polygon"
FROM
  query_2464155 as days
ORDER BY
  "date" ASC