SELECT
  days.day AS "date",
  COALESCE(
    (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669337
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669342
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669333
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669331
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669339
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3669322
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3430984
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(contracts), 0)
      FROM
        query_3430985
      WHERE
        block_time <= days.day
    ),
    0
  ) AS "Total",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669337
    WHERE
      block_time <= days.day
  ) AS "Ethereum",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669342
    WHERE
      block_time <= days.day
  ) AS "Polygon",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669333
    WHERE
      block_time <= days.day
  ) AS "BNB Chain",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669331
    WHERE
      block_time <= days.day
  ) AS "Avalanche",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669339
    WHERE
      block_time <= days.day
  ) AS "OP Mainnet",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3669322
    WHERE
      block_time <= days.day
  ) AS "Arbitrum",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3430984
    WHERE
      block_time <= days.day
  ) AS "Zora",
  (
    SELECT
      COALESCE(SUM(contracts), 0)
    FROM
      query_3430985
    WHERE
      block_time <= days.day
  ) AS "Base"
FROM
  query_2464155 as days
ORDER BY
  "date" ASC