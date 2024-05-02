
Select
SUM(CASE WHEN dataType = 'NFTs' THEN dataValue ELSE 0 END) as totalNft,
SUM(CASE WHEN dataType = 'Contracts' THEN dataValue ELSE 0 END) as totalContracts
From(
SELECT
  dataType,
  dataValue
FROM query_3200193
union 
SELECT
  dataType,
  dataValue
FROM query_3410769)