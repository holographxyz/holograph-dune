SELECT
  bytearray_substring (topic1, 13, 20) AS contract_address
FROM
  linea.logs
WHERE
  block_time >= TRY_CAST('2024-01-01 00:00:00' AS TIMESTAMP)
  AND block_time < TRY_CAST('2026-01-01 00:00:00' AS TIMESTAMP)
  AND contract_address = 0xf3dDf3Dc6ebB5c5Dc878c7A0c8B2C5e051c37594
  AND topic0 = 0xa802207d4c618b40db3b25b7b90e6f483e16b2c1f8d3610b15b345a718c6b41b