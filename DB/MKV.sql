/*
Alias: WORK
LiveAnswer: FALSE

*/

SELECT SUM(CAST(Move.MCount AS Float) * Cast(Goods.GWidth AS Float)  * Cast(Goods.GLength  AS Float) / 1000000)
FROM "MOVE.DB" Move
	INNER JOIN "CHEQUE.DB" Cheque
	ON  (Cheque.ChequeID = Move.MChequeID)  
	INNER JOIN "DetailGoods.DB" Detailgoods
	ON  (Move.MGoods = Detailgoods.DetailGoodsID)  
	INNER JOIN "TypeCheque.db" Typecheque
	ON  (Cheque.CType = Typecheque.TypeChequeID)  
	INNER JOIN "GOODS.DB" Goods
	ON  (Goods.GoodsID = Detailgoods.DGoods)  
	INNER JOIN "TypeGoods.db" Typegoods
	ON  (Goods.GType = Typegoods.TypeGoodsID)  
	INNER JOIN "ProducerGoods.db" Producergoods
	ON  (Goods.GMadeIn = Producergoods.ProducerGoodsID)  
WHERE CType IN (1, 14) AND ProducerGoods = 'Бельгия' AND TGoods = 'Ковры'
	AND (CDate BETWEEN "1.03.2012" AND "31.03.2012")
