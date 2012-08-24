object fmForRunOrder: TfmForRunOrder
  Left = 486
  Top = 42
  Width = 788
  Height = 133
  Caption = 'fmForRunOrder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 504
    Top = 8
    Width = 68
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072':'
  end
  object lbl2: TLabel
    Left = 656
    Top = 8
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object lbl3: TLabel
    Left = 608
    Top = 80
    Width = 53
    Height = 13
    Caption = #1055#1088#1086#1076#1072#1074#1077#1094':'
  end
  object lbl4: TLabel
    Left = 624
    Top = 56
    Width = 63
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
  end
  object lbl5: TLabel
    Left = 504
    Top = 32
    Width = 48
    Height = 13
    Caption = #1050' '#1086#1087#1083#1072#1090#1077':'
  end
  object lbl6: TLabel
    Left = 640
    Top = 32
    Width = 64
    Height = 13
    Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072':'
  end
  object lbl7: TLabel
    Left = 536
    Top = 56
    Width = 45
    Height = 13
    Caption = #1054#1089#1090#1072#1090#1086#1082':'
  end
  object lRemSumm: TLabel
    Left = 584
    Top = 56
    Width = 53
    Height = 13
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1091#1102' '#1089#1091#1084#1084#1091
    Caption = 'lRemSumm'
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 497
    Height = 99
    Align = alLeft
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GArticul'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTitle'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MCount'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MPrice'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MToPayment'
        Visible = True
      end>
  end
  object txtCDate: TStaticText
    Left = 584
    Top = 8
    Width = 45
    Height = 17
    Caption = 'txtCDate'
    TabOrder = 1
  end
  object txtCPrice: TStaticText
    Left = 696
    Top = 8
    Width = 46
    Height = 17
    Caption = 'txtCPrice'
    TabOrder = 2
  end
  object txtCToPayment: TStaticText
    Left = 568
    Top = 32
    Width = 76
    Height = 17
    Hint = #1045#1089#1083#1080' '#1074#1074#1077#1089#1090#1080' '#1085#1086#1074#1091#1102' '#1094#1077#1085#1091', '#1101#1090#1086' '#1080#1079#1084#1077#1085#1080#1090' '#1094#1077#1085#1091' '#1074' '#1095#1077#1082#1077' '#1079#1072#1082#1072#1079#1072
    Caption = 'txtCToPayment'
    TabOrder = 3
  end
  object txtCPayedSum: TStaticText
    Left = 704
    Top = 32
    Width = 73
    Height = 17
    Caption = 'txtCPayedSum'
    TabOrder = 4
  end
  object txtResponsible: TStaticText
    Left = 672
    Top = 80
    Width = 73
    Height = 17
    Caption = 'txtResponsible'
    TabOrder = 5
  end
  object txtRespPartner: TStaticText
    Left = 688
    Top = 56
    Width = 74
    Height = 17
    Caption = 'txtRespPartner'
    TabOrder = 6
  end
  object qryForRunOrder: TQuery
    DatabaseName = 'AAA'
    SQL.Strings = (
      
        'SELECT Move.MCount, Goods.GTitle, Goods.GArticul, Goods.GLength,' +
        ' Goods.GWidth, Move.MPrice, Typegoods.TGoods, Producergoods.Prod' +
        'ucerGoods, Goods.GType, Goods.GInfo, Move.MToPayment'
      'FROM Move'
      '   INNER JOIN Detailgoods'
      '   ON  (Move.MGoods = Detailgoods.DetailGoodsID)  '
      '   INNER JOIN Cheque'
      '   ON  (Cheque.ChequeID = Move.MChequeID)  '
      '   INNER JOIN Goods'
      '   ON  (Detailgoods.DGoods = Goods.GoodsID)  '
      '   INNER JOIN Producergoods'
      '   ON  (Goods.GMadeIn = Producergoods.ProducerGoodsID)  '
      '   INNER JOIN Typegoods'
      '   ON  (Typegoods.TypeGoodsID = Goods.GType)  '
      'WHERE ChequeID = :IDcheque')
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDcheque'
        ParamType = ptUnknown
        Value = 0
      end>
    object intgrfldForRunOrderMCount: TIntegerField
      DisplayWidth = 10
      FieldName = 'MCount'
      OnGetText = intgrfldForRunOrderMCountGetText
    end
    object strngfldForRunOrderGTitle: TStringField
      DisplayWidth = 21
      FieldName = 'GTitle'
      OnGetText = strngfldForRunOrderGTitleGetText
      Size = 40
    end
    object strngfldForRunOrderGArticul: TStringField
      DisplayWidth = 11
      FieldName = 'GArticul'
    end
    object intgrfldForRunOrderGLength: TIntegerField
      DisplayWidth = 12
      FieldName = 'GLength'
    end
    object intgrfldForRunOrderGWidth: TIntegerField
      DisplayWidth = 10
      FieldName = 'GWidth'
    end
    object crncyfldForRunOrderMPrice: TCurrencyField
      DisplayWidth = 12
      FieldName = 'MPrice'
      OnGetText = crncyfldForRunOrderMPriceGetText
    end
    object strngfldForRunOrderTGoods: TStringField
      DisplayWidth = 12
      FieldName = 'TGoods'
    end
    object strngfldForRunOrderProducerGoods: TStringField
      DisplayWidth = 11
      FieldName = 'ProducerGoods'
      Size = 11
    end
    object intgrfldForRunOrderGType: TIntegerField
      FieldName = 'GType'
    end
    object strngfldForRunOrderGInfo: TStringField
      FieldName = 'GInfo'
      Size = 25
    end
    object crncyfldForRunOrderMToPayment: TCurrencyField
      FieldName = 'MToPayment'
    end
  end
  object ds1: TDataSource
    DataSet = qryForRunOrder
    Left = 104
    Top = 64
  end
end
