SELECT
  COALESCE(SUM(LINEA.contracts), 0) as contracts_deployed
FROM
  query_3675395 AS LINEA