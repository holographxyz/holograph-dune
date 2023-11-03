SELECT
  days.day AS "date",
  COALESCE(
    (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2465079
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2465061
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2465084
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2465088
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2506131
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(msg_count), 0)
      FROM
        query_2611173
      WHERE
        block_time <= days.day
    ),
    0
  ) AS "Total",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2611173
    WHERE
      block_time <= days.day
  ) AS "Arbitrum",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2465061
    WHERE
      block_time <= days.day
  ) AS "Avalanche",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2465084
    WHERE
      block_time <= days.day
  ) AS "BNB Chain",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2465088
    WHERE
      block_time <= days.day
  ) AS "Ethereum",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2506131
    WHERE
      block_time <= days.day
  ) AS "Optimism",
  (
    SELECT
      COALESCE(SUM(msg_count), 0)
    FROM
      query_2465079
    WHERE
      block_time <= days.day
  ) AS "Polygon"
FROM
  query_2464155 as days
ORDER BY
  "date" ASC