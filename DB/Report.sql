/*
Alias: WORK
LiveAnswer: FALSE

*/

SELECT Goods.GTitle, Goods.GArticul, Goods.GLength, Goods.GWidth, Typegoods.TGoods, Producergoods.ProducerGoods, Cheque.CDate, Typecheque.TypeCheque, Move.MToPayment, Personel.PSurname, Personel.PName, Move.MCount, Move.MPrice, Movemoney.MMoney, Movemoney.MmDate, Expenses.EInfo, Expenses.ESumm
FROM "GOODS.DB" Goods
	FULL OUTER JOIN "TypeGoods.db" Typegoods
	ON  (Goods.GType = Typegoods.TypeGoodsID)  
	FULL OUTER JOIN "ProducerGoods.db" Producergoods
	ON  (Goods.GMadeIn = Producergoods.ProducerGoodsID)  
	FULL OUTER JOIN "DetailGoods.DB" Detailgoods
	ON  (Detailgoods.DGoods = Goods.GoodsID)  
	FULL OUTER JOIN "MOVE.DB" Move
	ON  (Move.MGoods = Detailgoods.DetailGoodsID)  
	FULL OUTER JOIN "CHEQUE.DB" Cheque
	ON  (Cheque.ChequeID = Move.MChequeID)  
	INNER JOIN "TypeCheque.db" Typecheque
	ON  (Cheque.CType = Typecheque.TypeChequeID)  
	INNER JOIN "PERSONEL.DB" Personel
	ON  (Cheque.CResponsible = Personel.PersonelID)  
	FULL OUTER JOIN "MoveMoney.DB" Movemoney
	ON  (Cheque.ChequeID = Movemoney.MmChequeID)  
	FULL OUTER JOIN "EXPENSES.DB" Expenses
	ON  (Cheque.ChequeID = Expenses.EChequeID)  
ORDER BY Cheque.CDate, Typecheque.TypeCheque, Typegoods.TGoods, Producergoods.ProducerGoods, Goods.GTitle, Goods.GWidth, Goods.GLength
