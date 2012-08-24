/*
Alias: WORK
LiveAnswer: FALSE

*/

SELECT GArticul, GTitle, GLength, GWidth, DCount, DPriceCoeff
  FROM GOODS, DetailGoods
  WHERE GoodsID = DGoods					
