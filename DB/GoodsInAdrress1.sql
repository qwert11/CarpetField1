/* ALIAS: AAA */
SELECT Goods.GTitle, Goods.GArticul, Goods.GLength, Goods.GWidth, Detailgoods.DCount, Detailgoods.DPriceCoeff, Typegoods.TGoods
FROM "GOODS.DB" Goods
   INNER JOIN "DetailGoods.DB" Detailgoods
   ON  (Detailgoods.DetailGoodsID = Goods.GoodsID)  , "TypeGoods.db" Typegoods
WHERE  Goods.GType = Typegoods.TypeGoodsID 
