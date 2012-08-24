object fmPricing_Policy: TfmPricing_Policy
  Left = 372
  Top = 191
  Width = 741
  Height = 500
  Caption = #1055#1086#1083#1080#1090#1080#1082#1072' '#1094#1077#1085
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
  object statPricePolice: TStatusBar
    Left = 0
    Top = 447
    Width = 733
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 416
    Width = 733
    Height = 31
    Align = alBottom
    TabOrder = 1
    object lbl1: TLabel
      Left = 288
      Top = 14
      Width = 82
      Height = 13
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
      OnClick = lbl1Click
    end
    object btnCancel: TBitBtn
      Left = 632
      Top = 3
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkCancel
    end
    object btnOk: TBitBtn
      Left = 536
      Top = 3
      Width = 75
      Height = 25
      Action = actApply
      Caption = 'Ok'
      TabOrder = 1
      Kind = bkOK
    end
    object dtpPrice: TDateTimePicker
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Date = 40930.969769594910000000
      Format = '  d MMM yyyy    ddd'
      Time = 40930.969769594910000000
      TabOrder = 2
    end
    object dblkcbbResp: TDBLookupComboBox
      Left = 376
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'PersonelID'
      ListField = 'PSurname; PDOB'
      ListSource = DM.ds6
      TabOrder = 3
    end
    object edtFind: TEdit
      Left = 136
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 4
      OnChange = edtFindChange
      OnClick = edtFindClick
      OnDblClick = edtFindDblClick
    end
  end
  object tbcFilterPr: TTabControl
    Left = 0
    Top = 0
    Width = 733
    Height = 416
    Align = alClient
    TabOrder = 2
    Tabs.Strings = (
      #1074#1089#1077
      #1050#1086#1074#1088#1099
      #1056#1072#1079#1085#1086#1077
      #1044#1086#1088#1086#1078#1082#1080
      #1050#1072#1088#1090#1080#1085#1099
      #1052#1077#1090#1072#1083#1083)
    TabIndex = 0
    OnChange = tbcFilterPrChange
    object dbgrdPricing: TDBGrid
      Left = 4
      Top = 24
      Width = 725
      Height = 388
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = pm1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdPricingDrawColumnCell
      OnKeyPress = dbgrdPricingKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'GArticul'
          Title.Caption = #1040#1088#1090#1080#1082#1091#1083
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GTitle'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
          Width = 356
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
          FieldName = 'DPriceCoeff'
          Title.Caption = #1062#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Price'
          Title.Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceSq'
          Title.Caption = #1062#1077#1085#1072' '#1084'.'#1082#1074'.'
          Visible = True
        end>
    end
  end
  object qryPricing: TQuery
    DatabaseName = 'AAA'
    SQL.Strings = (
      
        'SELECT LOWER(Goods.GTitle) AS GTitle, Goods.GArticul, Goods.GLen' +
        'gth, Goods.GWidth, Typegoods.TGoods, Producergoods.ProducerGoods' +
        ', Goods.GType, Detailgoods.DCount, Detailgoods.DPriceCoeff, Deta' +
        'ilgoods.DAddrPartner, Detailgoods.DetailGoodsID'
      'FROM "GOODS.DB" Goods'
      '   INNER JOIN "TypeGoods.db" Typegoods'
      '   ON  (Goods.GType = Typegoods.TypeGoodsID)  '
      '   INNER JOIN "ProducerGoods.db" Producergoods'
      '   ON  (Goods.GMadeIn = Producergoods.ProducerGoodsID)  '
      '   INNER JOIN "DetailGoods.DB" Detailgoods'
      '   ON  (Goods.GoodsID = Detailgoods.DGoods)  '
      
        'ORDER BY Goods.GType, Producergoods.ProducerGoods, GTitle, Goods' +
        '.GWidth, Goods.GLength')
    Left = 40
    Top = 56
    object strngfldPricingTGoods: TStringField
      FieldName = 'TGoods'
    end
    object strngfldPricingProducerGoods: TStringField
      FieldName = 'ProducerGoods'
      Size = 11
    end
    object strngfldPricingGTitle: TStringField
      FieldName = 'GTitle'
      OnGetText = strngfldPricingGTitleGetText
      Size = 40
    end
    object strngfldPricingGArticul: TStringField
      FieldName = 'GArticul'
    end
    object intgrfldPricingGLength: TIntegerField
      FieldName = 'GLength'
    end
    object intgrfldPricingGWidth: TIntegerField
      FieldName = 'GWidth'
    end
    object intgrfldPricingGType: TIntegerField
      FieldName = 'GType'
    end
    object intgrfldPricingDCount: TIntegerField
      FieldName = 'DCount'
      OnGetText = intgrfldPricingDCountGetText
    end
    object crncyfldPricingDPriceCoeff: TCurrencyField
      FieldName = 'DPriceCoeff'
      OnGetText = crncyfldPricingDPriceCoeffGetText
    end
    object intgrfldPricingDAddrPartner: TIntegerField
      FieldName = 'DAddrPartner'
    end
    object crncyfldPricingPrice: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Price'
      OnGetText = crncyfldPricingPriceGetText
      Calculated = True
    end
    object intgrfldPricingDetailGoodsID: TIntegerField
      FieldName = 'DetailGoodsID'
    end
    object crncyfldPricingPriceSq: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PriceSq'
      OnGetText = crncyfldPricingPriceSqGetText
      Calculated = True
    end
  end
  object ds1: TDataSource
    DataSet = qryPricing
    Left = 16
    Top = 56
  end
  object pm1: TPopupMenu
    Left = 16
    Top = 104
    object mniNewPrice: TMenuItem
      Action = actNewPrice
    end
    object mniNewPriceSquare: TMenuItem
      Action = actNewPriceSquare
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniSelectRollback: TMenuItem
      Action = actSelectRollback
    end
    object mniAllRollBack: TMenuItem
      Action = actAllRollBack
    end
  end
  object actlst1: TActionList
    Left = 16
    Top = 144
    object actNewPriceSquare: TAction
      Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072' ('#1075#1088#1085'.) '#1079#1072' '#1084'.'#1082#1074'.'
      OnExecute = actNewPriceSquareExecute
      OnUpdate = actNewPriceSquareUpdate
    end
    object actNewPrice: TAction
      Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072' ('#1075#1088#1085'.)'
      OnExecute = actNewPriceExecute
    end
    object actSelectRollback: TAction
      Caption = #1057#1090#1072#1088#1099#1077' '#1094#1077#1085#1099' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnExecute = actSelectRollbackExecute
      OnUpdate = actSelectRollbackUpdate
    end
    object actAllRollBack: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077
      OnExecute = actAllRollBackExecute
      OnUpdate = actAllRollBackUpdate
    end
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
      OnUpdate = actApplyUpdate
    end
  end
  object aplctnvntsPrPolicy: TApplicationEvents
    OnIdle = aplctnvntsPrPolicyIdle
    Left = 16
    Top = 184
  end
end
