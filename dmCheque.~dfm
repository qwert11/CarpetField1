object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1005
  Top = 65535
  Height = 766
  Width = 246
  object DB: TDatabase
    AliasName = 'CarpetField'
    Connected = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TransIsolation = tiDirtyRead
    Left = 144
    Top = 8
  end
  object tbCheque: TTable
    Active = True
    BeforeDelete = tbChequeBeforeDelete
    DatabaseName = 'AAA'
    Filtered = True
    SessionName = 'Default'
    IndexName = 'indCDate_CType'
    TableName = 'CHEQUE.DB'
    Left = 72
    Top = 8
    object atncfldChequeChequeID: TAutoIncField
      FieldName = 'ChequeID'
      ReadOnly = True
    end
    object dtfldChequeCDate: TDateField
      FieldName = 'CDate'
    end
    object intgrfldChequeCAddress: TIntegerField
      FieldName = 'CAddress'
    end
    object intgrfldChequeCType: TIntegerField
      FieldName = 'CType'
      Required = True
    end
    object crncyfldChequeCPrice: TCurrencyField
      FieldName = 'CPrice'
      Required = True
      DisplayFormat = '# ##0.00'#1075#1088'.'
    end
    object crncyfldChequeCToPayment: TCurrencyField
      FieldName = 'CToPayment'
      DisplayFormat = '# ##0.00'#1075#1088'.'
    end
    object crncyfldChequeCPayedSum: TCurrencyField
      FieldName = 'CPayedSum'
      DisplayFormat = '# ##0.00'#1075#1088'.'
      EditFormat = '0'
    end
    object intgrfldChequeCWithCheque: TIntegerField
      FieldName = 'CWithCheque'
    end
    object intgrfldChequeCResponsible: TIntegerField
      FieldName = 'CResponsible'
    end
    object intgrfldChequeCPartner: TIntegerField
      FieldName = 'CPartner'
      Required = True
    end
    object intgrfldChequeCRespPartner: TIntegerField
      FieldName = 'CRespPartner'
      Required = True
    end
    object intgrfldChequeCAddrPartner: TIntegerField
      FieldName = 'CAddrPartner'
    end
    object dtmfldChequeCDateTimeTransact: TDateTimeField
      FieldName = 'CDateTimeTransact'
    end
    object intgrfldChequeCRespTransact: TIntegerField
      FieldName = 'CRespTransact'
    end
    object dtfldChequeCRetDate: TDateField
      FieldName = 'CRetDate'
      Required = True
    end
    object strngfldChequePartner: TStringField
      FieldKind = fkLookup
      FieldName = 'Partner'
      LookupDataSet = tbPartner
      LookupKeyFields = 'PartnerID'
      LookupResultField = 'PName'
      KeyFields = 'CPartner'
      OnGetText = strngfldChequePartnerGetText
      Lookup = True
    end
    object strngfldChequeAddress: TStringField
      FieldKind = fkLookup
      FieldName = 'Address'
      LookupDataSet = tbAddressParner
      LookupKeyFields = 'AddressPartnerID'
      LookupResultField = 'ACity'
      KeyFields = 'CAddress'
      Size = 25
      Lookup = True
    end
    object strngfldChequeRespAddrPartner: TStringField
      FieldKind = fkLookup
      FieldName = 'RespAddrPartner'
      LookupDataSet = tbAddressParner
      LookupKeyFields = 'AddressPartnerID'
      LookupResultField = 'ACity'
      KeyFields = 'CAddrPartner'
      Size = 15
      Lookup = True
    end
    object strngfldChequeRespTransact: TStringField
      FieldKind = fkLookup
      FieldName = 'RespTransact'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'CRespTransact'
      Size = 15
      Lookup = True
    end
    object strngfldChequeType: TStringField
      FieldKind = fkLookup
      FieldName = 'Type'
      LookupDataSet = tbTypeCheque
      LookupKeyFields = 'TypeChequeID'
      LookupResultField = 'TypeCheque'
      KeyFields = 'CType'
      Size = 30
      Lookup = True
    end
    object strngfldChequeRespPartner: TStringField
      FieldKind = fkLookup
      FieldName = 'RespPartner'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'CRespPartner'
      Size = 15
      Lookup = True
    end
    object strngfldChequeResponsible: TStringField
      FieldKind = fkLookup
      FieldName = 'Responsible'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'CResponsible'
      OnGetText = strngfldChequeResponsibleGetText
      Size = 15
      Lookup = True
    end
    object strngfldChequeRespName: TStringField
      FieldKind = fkLookup
      FieldName = 'RespName'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PName'
      KeyFields = 'CResponsible'
      Size = 11
      Lookup = True
    end
  end
  object ds1: TDataSource
    DataSet = tbCheque
    OnDataChange = ds1DataChange
    Left = 16
    Top = 8
  end
  object tbMove: TTable
    Active = True
    DatabaseName = 'AAA'
    FilterOptions = [foNoPartialCompare]
    SessionName = 'Default'
    IndexName = 'MOVE_CHEQUE'
    MasterFields = 'ChequeID'
    MasterSource = ds1
    TableName = 'MOVE.DB'
    Left = 72
    Top = 56
    object atncfldMoveMoveID: TAutoIncField
      FieldName = 'MoveID'
      ReadOnly = True
    end
    object intgrfldMoveMGoods: TIntegerField
      FieldName = 'MGoods'
    end
    object intgrfldMoveMCount: TIntegerField
      FieldName = 'MCount'
      OnGetText = intgrfldMoveMCountGetText
    end
    object crncyfldMoveMPrice: TCurrencyField
      FieldName = 'MPrice'
      DisplayFormat = '# ##0.00'#1075#1088'.'
    end
    object crncyfldMoveMToPayment: TCurrencyField
      FieldName = 'MToPayment'
      DisplayFormat = '# ##0.00'#1075#1088'.'
    end
    object intgrfldMoveMChequeID: TIntegerField
      FieldName = 'MChequeID'
    end
    object strngfldMoveName: TStringField
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = tbDetailGoods
      LookupKeyFields = 'DetailGoodsID'
      LookupResultField = 'Goods'
      KeyFields = 'MGoods'
      OnGetText = strngfldMoveNameGetText
      Size = 25
      Lookup = True
    end
    object intgrfldMoveWidth: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Width'
      LookupDataSet = tbDetailGoods
      LookupKeyFields = 'DetailGoodsID'
      LookupResultField = 'Width'
      KeyFields = 'MGoods'
      Lookup = True
    end
    object intgrfldMoveLength: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Length'
      LookupDataSet = tbDetailGoods
      LookupKeyFields = 'DetailGoodsID'
      LookupResultField = 'Length'
      KeyFields = 'MGoods'
      Lookup = True
    end
    object strngfldMoveArticul: TStringField
      FieldKind = fkLookup
      FieldName = 'Articul'
      LookupDataSet = tbDetailGoods
      LookupKeyFields = 'DetailGoodsID'
      LookupResultField = 'Articul'
      KeyFields = 'MGoods'
      Size = 15
      Lookup = True
    end
    object intgrfldMoveType: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Type'
      LookupDataSet = tbDetailGoods
      LookupKeyFields = 'DetailGoodsID'
      LookupResultField = 'ForType'
      KeyFields = 'MGoods'
      Lookup = True
    end
    object crncyfldMovePriceCount: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PriceCount'
      OnGetText = crncyfldMovePriceCountGetText
      Calculated = True
    end
  end
  object ds2: TDataSource
    DataSet = tbMove
    Left = 16
    Top = 56
  end
  object tbTypeCheque: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'TypeCheque.db'
    Left = 72
    Top = 112
  end
  object tbPartner: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'Partner.db'
    Left = 72
    Top = 160
    object atncfldPartnerPartnerID: TAutoIncField
      FieldName = 'PartnerID'
      ReadOnly = True
    end
    object strngfldPartnerPName: TStringField
      FieldName = 'PName'
      Required = True
      Size = 25
    end
    object smlntfldPartnerPCoeff: TSmallintField
      FieldName = 'PCoeff'
    end
    object intgrfldPartnerPRetDays: TIntegerField
      FieldName = 'PRetDays'
    end
  end
  object tbPersonel: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'PERSONEL.DB'
    Left = 72
    Top = 208
    object strngfldPersonelPSurname: TStringField
      FieldName = 'PSurname'
      Required = True
      OnGetText = strngfldPersonelPSurnameGetText
      Size = 30
    end
    object strngfldPersonelPName: TStringField
      FieldName = 'PName'
      Size = 30
    end
    object strngfldPersonelPPatronymic: TStringField
      FieldName = 'PPatronymic'
      Size = 30
    end
    object strngfldPersonelPTelephone: TStringField
      FieldName = 'PTelephone'
    end
    object intgrfldPersonelPAddressPartner: TIntegerField
      FieldName = 'PAddressPartner'
    end
    object intgrfldPersonelPPartner: TIntegerField
      FieldName = 'PPartner'
    end
    object atncfldPersonelPersonelID: TAutoIncField
      FieldName = 'PersonelID'
      ReadOnly = True
    end
    object dtfldPersonelPDOB: TDateField
      FieldName = 'PDOB'
    end
    object crncyfldPersonelPFinDelta: TCurrencyField
      FieldName = 'PFinDelta'
    end
  end
  object tbMoveMoney: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    IndexName = 'MoveMoney_Cheque'
    MasterFields = 'ChequeID'
    MasterSource = ds1
    TableName = 'MoveMoney.db'
    Left = 72
    Top = 256
    object atncfldMoveMoneyMoveMoneyID: TAutoIncField
      FieldName = 'MoveMoneyID'
      ReadOnly = True
    end
    object crncyfldMoveMoneyMMoney: TCurrencyField
      FieldName = 'MMoney'
      Required = True
      DisplayFormat = '# ##0.00'#1075#1088
    end
    object intgrfldMoveMoneyMmChequeID: TIntegerField
      FieldName = 'MmChequeID'
    end
    object intgrfldMoveMoneyMmRespPartner: TIntegerField
      FieldName = 'MmRespPartner'
    end
    object intgrfldMoveMoneyMmResp: TIntegerField
      FieldName = 'MmResp'
    end
    object dtfldMoveMoneyMmDate: TDateField
      FieldName = 'MmDate'
    end
    object strngfldMoveMoneyResp: TStringField
      FieldKind = fkLookup
      FieldName = 'Resp'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'MmResp'
      Size = 15
      Lookup = True
    end
    object strngfldMoveMoneyRespPartner: TStringField
      FieldKind = fkLookup
      FieldName = 'RespPartner'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'MmRespPartner'
      Size = 15
      Lookup = True
    end
  end
  object tbGoods: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'GOODS.DB'
    Left = 72
    Top = 304
    object atncfldGoodsGoodsID: TAutoIncField
      FieldName = 'GoodsID'
      ReadOnly = True
    end
    object strngfldGoodsGTitle: TStringField
      FieldName = 'GTitle'
      Required = True
      Size = 40
    end
    object intgrfldGoodsGLength: TIntegerField
      FieldName = 'GLength'
    end
    object intgrfldGoodsGWidth: TIntegerField
      FieldName = 'GWidth'
    end
    object strngfldGoodsGColor: TStringField
      FieldName = 'GColor'
      Size = 55
    end
    object strngfldGoodsGImageCode: TStringField
      FieldName = 'GImageCode'
      Size = 15
    end
    object intgrfldGoodsGCount: TIntegerField
      FieldName = 'GCount'
      Required = True
    end
    object intgrfldGoodsGMadeIn: TIntegerField
      FieldName = 'GMadeIn'
    end
    object strngfldGoodsGInfo: TStringField
      FieldName = 'GInfo'
      Size = 25
    end
    object intgrfldGoodsGType: TIntegerField
      FieldName = 'GType'
    end
    object strngfldGoodsGFirm: TStringField
      FieldName = 'GFirm'
    end
    object strngfldGoodsGArticul: TStringField
      FieldName = 'GArticul'
    end
  end
  object ds3: TDataSource
    DataSet = tbMoveMoney
    Left = 16
    Top = 256
  end
  object tbAddressParner: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'AddressPartner.db'
    Left = 72
    Top = 352
    object strngfldAddressParnerACity: TStringField
      FieldName = 'ACity'
      OnGetText = strngfldAddressParnerACityGetText
    end
    object strngfldAddressParnerAStreet: TStringField
      FieldName = 'AStreet'
    end
    object strngfldAddressParnerAHouse: TStringField
      FieldName = 'AHouse'
      Size = 5
    end
    object atncfldAddressParnerAddressPartnerID: TAutoIncField
      FieldName = 'AddressPartnerID'
      ReadOnly = True
    end
    object intgrfldAddressParnerAPartner: TIntegerField
      FieldName = 'APartner'
    end
    object strngfldAddressParnerAInfo: TStringField
      FieldName = 'AInfo'
      Size = 7
    end
    object crncyfldAddressParnerASumMoney: TCurrencyField
      FieldName = 'ASumMoney'
    end
  end
  object ds4: TDataSource
    DataSet = tbAddressParner
    Left = 16
    Top = 352
  end
  object ds5: TDataSource
    DataSet = tbPartner
    Left = 16
    Top = 160
  end
  object ds6: TDataSource
    DataSet = tbPersonel
    Left = 16
    Top = 208
  end
  object tbTypeGoods: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'TypeGoods.db'
    Left = 72
    Top = 408
  end
  object tbProducerGoods: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'ProducerGoods.db'
    Left = 72
    Top = 456
  end
  object tbExpenses: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    IndexName = 'EXPENSES_CHEQUE'
    MasterFields = 'ChequeID'
    MasterSource = ds1
    TableName = 'EXPENSES.db'
    Left = 72
    Top = 504
    object atncfldExpensesExpensesID: TAutoIncField
      FieldName = 'ExpensesID'
      ReadOnly = True
    end
    object crncyfldExpensesESumm: TCurrencyField
      FieldName = 'ESumm'
      DisplayFormat = '# ##0.00'#1075#1088
    end
    object strngfldExpensesEInfo: TStringField
      FieldName = 'EInfo'
      Size = 250
    end
    object intgrfldExpensesEResponsible: TIntegerField
      FieldName = 'EResponsible'
    end
    object intgrfldExpensesEChequeID: TIntegerField
      FieldName = 'EChequeID'
    end
    object strngfldExpensesRespon: TStringField
      FieldKind = fkLookup
      FieldName = 'Respon'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'EResponsible'
      Size = 25
      Lookup = True
    end
  end
  object ds7: TDataSource
    DataSet = tbExpenses
    Left = 16
    Top = 504
  end
  object ds8: TDataSource
    DataSet = tbDetailGoods
    Left = 16
    Top = 568
  end
  object tbDetailGoods: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'DetailGoods.DB'
    Left = 72
    Top = 568
    object atncfldDetailGoodsDetailGoodsID: TAutoIncField
      DisplayWidth = 8
      FieldName = 'DetailGoodsID'
      ReadOnly = True
    end
    object intgrfldDetailGoodsDGoods: TIntegerField
      DisplayWidth = 10
      FieldName = 'DGoods'
    end
    object intgrfldDetailGoodsDAddrPartner: TIntegerField
      DisplayWidth = 11
      FieldName = 'DAddrPartner'
    end
    object intgrfldDetailGoodsDCount: TIntegerField
      DisplayWidth = 9
      FieldName = 'DCount'
    end
    object crncyfldDetailGoodsDPriceCoeff: TCurrencyField
      DisplayWidth = 12
      FieldName = 'DPriceCoeff'
    end
    object intgrfldDetailGoodsDTemp: TIntegerField
      DisplayWidth = 12
      FieldName = 'DTemp'
    end
    object strngfldDetailGoodsGoods: TStringField
      DisplayWidth = 120
      FieldKind = fkLookup
      FieldName = 'Goods'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GTitle'
      KeyFields = 'DGoods'
      OnGetText = strngfldDetailGoodsGoodsGetText
      Size = 100
      Lookup = True
    end
    object intgrfldDetailGoodsWidth: TIntegerField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Width'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GWidth'
      KeyFields = 'DGoods'
      Lookup = True
    end
    object intgrfldDetailGoodsLength: TIntegerField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Length'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GLength'
      KeyFields = 'DGoods'
      Lookup = True
    end
    object strngfldDetailGoodsArticul: TStringField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Articul'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GArticul'
      KeyFields = 'DGoods'
      Size = 10
      Lookup = True
    end
    object intgrfldDetailGoodsForMadeIn: TIntegerField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'ForMadeIn'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GMadeIn'
      KeyFields = 'DGoods'
      Lookup = True
    end
    object strngfldDetailGoodsMadeIn: TStringField
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MadeIn'
      LookupDataSet = tbProducerGoods
      LookupKeyFields = 'ProducerGoodsID'
      LookupResultField = 'ProducerGoods'
      KeyFields = 'ForMadeIn'
      Size = 7
      Lookup = True
    end
    object intgrfldDetailGoodsForType: TIntegerField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'ForType'
      LookupDataSet = tbGoods
      LookupKeyFields = 'GoodsID'
      LookupResultField = 'GType'
      KeyFields = 'DGoods'
      Lookup = True
    end
    object strngfldDetailGoodsType: TStringField
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'Type'
      LookupDataSet = tbTypeGoods
      LookupKeyFields = 'TypeGoodsID'
      LookupResultField = 'TGoods'
      KeyFields = 'ForType'
      Size = 11
      Lookup = True
    end
  end
  object qryTestGoods: TQuery
    DatabaseName = 'AAA'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT Goods.GTitle, Cheque.CDate, Move.MCount, Goods.GWidth'
      'FROM "DetailGoods.DB" Detailgoods'
      '   INNER JOIN "GOODS.DB" Goods'
      '   ON  (Detailgoods.DGoods = Goods.GoodsID)  '
      '   INNER JOIN "MOVE.DB" Move'
      '   ON  (Move.MGoods = Detailgoods.DetailGoodsID)  '
      '   INNER JOIN "CHEQUE.DB" Cheque'
      '   ON  (Move.MChequeID = Cheque.ChequeID)  '
      'WHERE   (Goods.GType = 3)  '
      '   AND  (Goods.GWidth = 1000)  '
      '   AND  (Cheque.CDate > '#39'01/11/2011'#39')  '
      'ORDER BY Cheque.CDate')
    Left = 16
    Top = 672
  end
  object qrySet: TQuery
    DatabaseName = 'AAA'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT MCount, GTitle, GArticul, GLength, GWidth, MPrice, TGoods' +
        ', ProducerGoods, GType, GInfo, MToPayment'
      #9'FROM Move'
      #9'INNER JOIN Detailgoods ON  (MGoods = DGoods)'
      #9'INNER JOIN Cheque'
      #9'ON  (ChequeID = MChequeID)'
      
        #9'INNER JOIN Goods ON  (DGoods = GoodsID)  , Typegoods, Producerg' +
        'oods'
      'WHERE  GMadeIn = ProducerGoodsID AND TypeGoodsID = GType')
    Left = 96
    Top = 672
  end
  object tbMiniReport: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'MiniReport.DB'
    Left = 72
    Top = 616
    object dtfldMiniReportMrDate: TDateField
      DisplayWidth = 13
      FieldName = 'MrDate'
    end
    object intgrfldMiniReportMrAddressPartnerID: TIntegerField
      DisplayWidth = 17
      FieldName = 'MrAddressPartnerID'
    end
    object crncyfldMiniReportMrMoney: TCurrencyField
      DisplayWidth = 15
      FieldName = 'MrMoney'
    end
    object intgrfldMiniReportMrCarped: TIntegerField
      DisplayWidth = 8
      FieldName = 'MrCarped'
    end
    object intgrfldMiniReportMrElse: TIntegerField
      DisplayWidth = 8
      FieldName = 'MrElse'
    end
    object intgrfldMiniReportMrMetal: TIntegerField
      DisplayWidth = 6
      FieldName = 'MrMetal'
    end
    object intgrfldMiniReportMrTrack: TIntegerField
      DisplayWidth = 6
      FieldName = 'MrTrack'
    end
    object intgrfldMiniReportMrPicture: TIntegerField
      DisplayWidth = 8
      FieldName = 'MrPicture'
    end
    object fltfldMiniReportMrSqTrack: TFloatField
      DisplayWidth = 10
      FieldName = 'MrSqTrack'
    end
    object crncyfldMiniReportMrValueGoods: TCurrencyField
      FieldName = 'MrValueGoods'
    end
    object strngfldMiniReportAddress: TStringField
      FieldKind = fkLookup
      FieldName = 'Address'
      LookupDataSet = tbAddressParner
      LookupKeyFields = 'AddressPartnerID'
      LookupResultField = 'ACity'
      KeyFields = 'MrAddressPartnerID'
      Size = 25
      Lookup = True
    end
  end
  object ds9: TDataSource
    DataSet = tbMiniReport
    Left = 16
    Top = 616
  end
  object tbGraphWork: TTable
    Active = True
    DatabaseName = 'AAA'
    SessionName = 'Default'
    TableName = 'GraphWork.DB'
    Left = 184
    Top = 616
    object atncfldGraphWorkGraphWorkID: TAutoIncField
      FieldName = 'GraphWorkID'
      ReadOnly = True
    end
    object dtfldGraphWorkGWDate: TDateField
      FieldName = 'GWDate'
    end
    object intgrfldGraphWorkGWAddress: TIntegerField
      FieldName = 'GWAddress'
    end
    object intgrfldGraphWorkGWAlgoritm: TIntegerField
      FieldName = 'GWAlgoritm'
    end
    object strngfldGraphWorkResponsible: TStringField
      FieldKind = fkLookup
      FieldName = 'Responsible'
      LookupDataSet = tbPersonel
      LookupKeyFields = 'PersonelID'
      LookupResultField = 'PSurname'
      KeyFields = 'GWResp'
      Size = 25
      Lookup = True
    end
    object intgrfldGraphWorkGWResp: TIntegerField
      FieldName = 'GWResp'
    end
  end
  object ds10: TDataSource
    DataSet = tbGraphWork
    Left = 128
    Top = 616
  end
  object ds11: TDataSource
    DataSet = tbTypeCheque
    Left = 16
    Top = 112
  end
end
