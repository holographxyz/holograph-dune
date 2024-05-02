SELECT V2.Chain, V1.nfts AS "nftsV1", V2.nfts AS "nftsV2",
((IF(V1.nfts > 0, V1.nfts , 0)) + v2.nfts) as Total 
from query_3672206 AS V2
left join query_3672209 AS V1 on (V2.Chain = V1.Chain)