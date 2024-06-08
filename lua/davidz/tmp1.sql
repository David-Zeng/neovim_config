-- Update schema when check different division
-- Check AUS PTH Duplication
SELECT
    basketkey,
    COUNT(*) AS basket_count
FROM gcp-wow-corp-qretail-qdh-prod.WOOLWORTHS_AUS_CDA_ETL.POS_TXN_HEADER
WHERE txnstartdate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 year)
GROUP BY basketkey
HAVING basket_count >= 2
;

-- Check AUS PIL Duplication
SELECT
  basketkey,
  productnumber,
  COUNT(*) AS basket_count
FROM gcp-wow-corp-qretail-qdh-prod.WOOLWORTHS_AUS_CDA_ETL.POS_ITEM_LINE_DETAIL
WHERE txnstartdate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 year)
GROUP BY basketkey,productnumber
HAVING basket_count >= 2
;

-- Check AUS PRL Duplication
SELECT
  basketkey,
  productnumber,
  offerid,
  COUNT(*) AS basket_count
FROM gcp-wow-corp-qretail-qdh-prod.WOOLWORTHS_AUS_CDA_ETL.POS_REWARD_LINE_DETAIL
WHERE txnstartdate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 year)
GROUP BY basketkey, productnumber, offerid
HAVING basket_count >= 2

-- Check AUS POS_TXN_HEADER_CUST Duplication: from 2024
SELECT
  basketkey,
  MIN(txnstartdate),
  MAX(txnstartdate),
  COUNT(*)
FROM gcp-wow-corp-qretail-qdh-prod.WOOLWORTHS_AUS_CDA_ETL.POS_TXN_HEADER_CUST
WHERE txnstartdate >= DATE('2024-01-01')
GROUP BY basketkey
HAVING COUNT(*) > 1
;

-- Check AUS POS_ITEM_LINE_DETAIL_CUST Duplication: from 2024
SELECT
  basketkey,
  productnumber,
  MIN(txnstartdate),
  MAX(txnstartdate),
  COUNT(*)
FROM gcp-wow-corp-qretail-qdh-prod.WOOLWORTHS_AUS_CDA_ETL.POS_ITEM_LINE_DETAIL_CUST
WHERE txnstartdate >= DATE('2024-01-01')
GROUP BY basketkey,productnumber
HAVING COUNT(*) > 1
;
