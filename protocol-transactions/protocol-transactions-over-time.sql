SELECT
  days.day AS "date",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3643607
    WHERE
      block_time <= days.day
  ) AS "Ethereum",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652976
    WHERE
      block_time <= days.day
  ) AS "Polygon",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652964
    WHERE
      block_time <= days.day
  ) AS "BNB Chain",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652984
    WHERE
      block_time <= days.day
  ) AS "Avalanche",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3643906
    WHERE
      block_time <= days.day
  ) AS "OP Mainnet",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652981
    WHERE
      block_time <= days.day
  ) AS "Arbitrum",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652990
    WHERE
      block_time <= days.day
  ) AS "Zora",
  (
    SELECT
      COALESCE(SUM(tx), 0)
    FROM
      query_3652988
    WHERE
      block_time <= days.day
  ) AS "Base",
  COALESCE(
    (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3643607
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652976
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652964
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652984
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3643906
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652981
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652990
      WHERE
        block_time <= days.day
    ) + (
      SELECT
        COALESCE(SUM(tx), 0)
      FROM
        query_3652988
      WHERE
        block_time <= days.day
    ),
    0
  ) AS "Total"
FROM
  query_2464155 as days
ORDER BY
  "date" ASC