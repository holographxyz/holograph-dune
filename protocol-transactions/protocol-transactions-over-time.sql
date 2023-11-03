SELECT
  days.day AS "date",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2611087
    WHERE
      block_time <= days.day
  ) AS "Arbitrum",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2464251
    WHERE
      block_time <= days.day
  ) AS "Avalanche",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2464261
    WHERE
      block_time <= days.day
  ) AS "BNB Chain",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2464267
    WHERE
      block_time <= days.day
  ) AS "Ethereum",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2517310
    WHERE
      block_time <= days.day
  ) AS "Optimism",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_2464217
    WHERE
      block_time <= days.day
  ) AS "Polygon",
  COALESCE(
    (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2611087
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2464251
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2464261
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2464267
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2517310
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_2464217
      WHERE
        block_time <= days.day
    ),
    0
  ) AS "Total"
FROM
  query_2464155 as days
ORDER BY
  "date" ASC