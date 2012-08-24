object fmPrint: TfmPrint
  Left = 476
  Top = 137
  Width = 759
  Height = 494
  Caption = #1055#1077#1095#1072#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tbcFilter: TTabControl
    Left = 0
    Top = 0
    Width = 751
    Height = 414
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      #1074#1089#1077
      #1050#1086#1074#1088#1099
      #1056#1072#1079#1085#1086#1077
      #1044#1086#1088#1086#1078#1082#1080
      #1050#1072#1088#1090#1080#1085#1099
      #1052#1077#1090#1072#1083#1083)
    TabIndex = 0
    OnChange = tbcFilterChange
    object dbgrdGoods: TDBGrid
      Left = 4
      Top = 24
      Width = 743
      Height = 386
      Align = alClient
      DataSource = ds1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdGoodsDrawColumnCell
      OnKeyPress = dbgrdGoodsKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'GArticul'
          Title.Caption = #1040#1088#1090#1080#1082#1091#1083
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GTitle'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 343
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DCount'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PrSquare'
          Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1084'.'#1082#1074
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DPriceCoeff'
          Title.Caption = #1062#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CountCennik'
          Title.Caption = #1062#1077#1085#1085#1080#1082#1086#1074
          Width = 54
          Visible = True
        end>
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 414
    Width = 751
    Height = 27
    Align = alBottom
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088#1099':'
    end
    object lbl2: TLabel
      Left = 312
      Top = 8
      Width = 37
      Height = 13
      Caption = #1057#1082#1080#1076#1082#1072
    end
    object lbl3: TLabel
      Left = 424
      Top = 8
      Width = 8
      Height = 13
      Caption = '%'
    end
    object chkNotNull: TCheckBox
      Left = 72
      Top = 8
      Width = 89
      Height = 17
      Caption = #1085#1077' '#1085#1091#1083#1077#1074#1099#1077
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkNotNullClick
    end
    object btnPrint: TButton
      Left = 648
      Top = 0
      Width = 97
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1086#1074
      TabOrder = 1
      OnClick = btnPrintClick
    end
    object btnPrintC: TButton
      Left = 512
      Top = 0
      Width = 115
      Height = 25
      Action = actPrintCennik
      TabOrder = 2
    end
    object edtFind: TEdit
      Left = 168
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = edtFindChange
      OnClick = edtFindClick
      OnDblClick = edtFindDblClick
    end
    object edtDiscount: TEdit
      Left = 360
      Top = 0
      Width = 57
      Height = 21
      TabOrder = 4
      OnChange = edtDiscountChange
      OnKeyPress = edtDiscountKeyPress
    end
    object btn1: TButton
      Left = 432
      Top = 0
      Width = 75
      Height = 25
      Caption = 'To Xls'
      TabOrder = 5
      OnClick = btn1Click
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 441
    Width = 751
    Height = 19
    Panels = <>
  end
  object qryGoods: TQuery
    OnCalcFields = qryGoodsCalcFields
    DatabaseName = 'AAA'
    SQL.Strings = (
      
        'SELECT Detailgoods.DCount, Detailgoods.DPriceCoeff, Typegoods.TG' +
        'oods, LOWER( Goods.GTitle ) GTitle, Goods.GArticul, Goods.GLengt' +
        'h, Goods.GWidth, Addresspartner.ACity, Addresspartner.AStreet, P' +
        'roducergoods.ProducerGoods, Detailgoods.DetailGoodsID, Addresspa' +
        'rtner.AddressPartnerID, Goods.GType, Goods.GInfo, Goods.GoodsID,' +
        ' Goods.GColor, Goods.GImageCode, Goods.GFirm'
      'FROM "GOODS.DB" Goods'
      '   INNER JOIN "DetailGoods.DB" Detailgoods'
      '   ON  (Detailgoods.DGoods = Goods.GoodsID)  '
      '   INNER JOIN "TypeGoods.db" Typegoods'
      '   ON  (Goods.GType = Typegoods.TypeGoodsID)  '
      '   INNER JOIN "ProducerGoods.db" Producergoods'
      '   ON  (Goods.GMadeIn = Producergoods.ProducerGoodsID)  '
      '   INNER JOIN "AddressPartner.DB" Addresspartner'
      
        '   ON  (Addresspartner.AddressPartnerID = Detailgoods.DAddrPartn' +
        'er)  '
      
        'ORDER BY Goods.GType, Producergoods.ProducerGoods, GTitle, Goods' +
        '.GWidth, Goods.GLength')
    Left = 88
    Top = 120
    object intgrfldGoodsDCount: TIntegerField
      FieldName = 'DCount'
      OnGetText = intgrfldGoodsDCountGetText
    end
    object crncyfldGoodsDPriceCoeff: TCurrencyField
      FieldName = 'DPriceCoeff'
      OnGetText = crncyfldGoodsDPriceCoeffGetText
    end
    object strngfldGoodsTGoods: TStringField
      FieldName = 'TGoods'
    end
    object strngfldGoodsGTitle: TStringField
      FieldName = 'GTitle'
      OnGetText = strngfldGoodsGTitleGetText
      Size = 40
    end
    object strngfldGoodsGArticul: TStringField
      FieldName = 'GArticul'
    end
    object intgrfldGoodsGLength: TIntegerField
      FieldName = 'GLength'
    end
    object intgrfldGoodsGWidth: TIntegerField
      FieldName = 'GWidth'
    end
    object strngfldGoodsACity: TStringField
      FieldName = 'ACity'
    end
    object strngfldGoodsAStreet: TStringField
      FieldName = 'AStreet'
    end
    object strngfldGoodsProducerGoods: TStringField
      FieldName = 'ProducerGoods'
      Size = 11
    end
    object intgrfldGoodsDetailGoodsID: TIntegerField
      FieldName = 'DetailGoodsID'
    end
    object intgrfldGoodsAddressPartnerID: TIntegerField
      FieldName = 'AddressPartnerID'
    end
    object intgrfldGoodsGType: TIntegerField
      FieldName = 'GType'
    end
    object strngfldGoodsGInfo: TStringField
      FieldName = 'GInfo'
      Size = 25
    end
    object crncyfldGoodsPrSquare: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PrSquare'
      DisplayFormat = '# ##0.00'#1075#1088
      Calculated = True
    end
    object intgrfldGoodsGoodsID: TIntegerField
      FieldName = 'GoodsID'
    end
    object strngfldGoodsGColor: TStringField
      FieldName = 'GColor'
      Size = 55
    end
    object strngfldGoodsGImageCode: TStringField
      FieldName = 'GImageCode'
      Size = 15
    end
    object strngfldGoodsGFirm: TStringField
      FieldName = 'GFirm'
    end
  end
  object ds1: TDataSource
    DataSet = qryGoods
    Left = 56
    Top = 120
  end
  object rvprjctPrint: TRvProject
    ProjectFile = 'PrintGoods.rav'
    Left = 624
    Top = 417
  end
  object conGoods: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryGoods
    Left = 120
    Top = 120
  end
  object actlst1: TActionList
    Left = 536
    Top = 352
    object actPrintCennik: TAction
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1080
      OnExecute = actPrintCennikExecute
      OnUpdate = actPrintCennikUpdate
    end
    object actClearList: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1094#1077#1085#1085#1080#1082#1086#1074
      OnExecute = actClearListExecute
      OnUpdate = actPrintCennikUpdate
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actAddExecute
    end
    object actAddAllSelect: TAction
      Caption = #1042#1089#1077' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
      OnExecute = actAddAllSelectExecute
    end
  end
  object pm1: TPopupMenu
    Left = 56
    Top = 192
    object mniClearList: TMenuItem
      Action = actClearList
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniAdd: TMenuItem
      Action = actAdd
    end
    object mniAddAllSelect: TMenuItem
      Action = actAddAllSelect
    end
  end
end
