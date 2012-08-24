object fmGoods: TfmGoods
  Left = 233
  Top = 38
  Width = 792
  Height = 673
  Caption = #1054#1090#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1090#1086#1074#1072#1088
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
  object pnl1: TPanel
    Left = 0
    Top = 386
    Width = 784
    Height = 234
    Align = alBottom
    TabOrder = 0
    object lbl1: TLabel
      Left = 111
      Top = 8
      Width = 100
      Height = 13
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
    end
    object lbl9: TLabel
      Left = 10
      Top = 54
      Width = 53
      Height = 13
      Caption = #1055#1088#1086#1076#1072#1074#1077#1094':'
    end
    object lbl10: TLabel
      Left = 10
      Top = 8
      Width = 76
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080':'
    end
    object lbl7: TLabel
      Left = 494
      Top = 52
      Width = 63
      Height = 13
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object btnAddRespPartner: TSpeedButton
      Left = 664
      Top = 48
      Width = 23
      Height = 22
      Caption = '...'
    end
    object lblCoeff: TLabel
      Left = 224
      Top = 56
      Width = 35
      Height = 13
      Caption = 'lblCoeff'
      Color = clBtnFace
      ParentColor = False
    end
    object pnl2: TPanel
      Left = 1
      Top = 72
      Width = 782
      Height = 161
      Align = alBottom
      TabOrder = 0
      object strngrdFromDetGoods: TStringGrid
        Left = 1
        Top = 1
        Width = 780
        Height = 159
        Align = alClient
        ColCount = 12
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        TabOrder = 0
        OnGetEditMask = strngrdFromDetGoodsGetEditMask
        OnKeyDown = strngrdFromDetGoodsKeyDown
        OnKeyUp = strngrdFromDetGoodsKeyUp
        OnMouseDown = strngrdFromDetGoodsMouseDown
        OnSelectCell = strngrdFromDetGoodsSelectCell
        OnSetEditText = strngrdFromDetGoodsSetEditText
        ColWidths = (
          107
          391
          49
          69
          76
          69
          44
          37
          47
          58
          47
          53)
      end
    end
    object btnOk: TBitBtn
      Left = 696
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btn2: TBitBtn
      Left = 696
      Top = 48
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkCancel
    end
    object edtFindName: TEdit
      Left = 108
      Top = 24
      Width = 107
      Height = 21
      TabOrder = 3
      OnChange = edtFindNameChange
      OnClick = edtFindNameClick
    end
    object pnl3: TPanel
      Left = 221
      Top = 0
      Width = 270
      Height = 45
      BevelOuter = bvLowered
      TabOrder = 4
      object lbl4: TLabel
        Left = 68
        Top = 8
        Width = 76
        Height = 13
        Caption = #1077#1076'. '#1090#1086#1074'.   '#1062#1077#1085#1072':'
      end
      object lbl2: TLabel
        Left = 3
        Top = 8
        Width = 33
        Height = 13
        Caption = #1048#1090#1086#1075#1086':'
      end
      object lbl11: TLabel
        Left = 208
        Top = 8
        Width = 20
        Height = 13
        Caption = #1075#1088#1085'.'
      end
      object lbl5: TLabel
        Left = 100
        Top = 29
        Width = 20
        Height = 13
        Caption = #1075#1088#1085'.'
      end
      object lbl3: TLabel
        Left = 3
        Top = 27
        Width = 48
        Height = 13
        Caption = #1050' '#1086#1087#1083#1072#1090#1077':'
      end
      object txtCount: TStaticText
        Left = 43
        Top = 5
        Width = 43
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'txtCount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object txtPrice: TStaticText
        Left = 152
        Top = 5
        Width = 39
        Height = 17
        Caption = 'txtPrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object txtCarped: TStaticText
        Left = 3
        Top = 48
        Width = 49
        Height = 17
        Caption = 'txtCarped'
        TabOrder = 2
      end
      object txtElse: TStaticText
        Left = 32
        Top = 48
        Width = 35
        Height = 17
        Caption = 'txtElse'
        TabOrder = 3
      end
      object txtMetal: TStaticText
        Left = 67
        Top = 48
        Width = 41
        Height = 17
        Caption = 'txtMetal'
        TabOrder = 4
      end
      object txtTrack: TStaticText
        Left = 160
        Top = 48
        Width = 43
        Height = 17
        Caption = 'txtTrack'
        TabOrder = 5
      end
      object txtPic: TStaticText
        Left = 115
        Top = 48
        Width = 30
        Height = 17
        Caption = 'txtPic'
        TabOrder = 6
      end
      object pnlToPay: TPanel
        Left = 54
        Top = 24
        Width = 69
        Height = 19
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 7
        object txtSumToPay: TStaticText
          Left = 1
          Top = 1
          Width = 67
          Height = 17
          BevelOuter = bvNone
          Caption = 'txtSumToPay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = txtSumToPayClick
          OnMouseMove = txtSumToPayMouseMove
        end
      end
      object pnlRemPayment: TPanel
        Left = 129
        Top = 22
        Width = 128
        Height = 22
        BevelOuter = bvNone
        TabOrder = 8
        object lbl12: TLabel
          Left = 4
          Top = 6
          Width = 40
          Height = 13
          Caption = #1054#1087#1083#1072#1090#1072':'
        end
        object lbl13: TLabel
          Left = 109
          Top = 6
          Width = 20
          Height = 13
          Caption = #1075#1088#1085'.'
        end
        object edtPayed: TEdit
          Left = 49
          Top = 1
          Width = 56
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnKeyPress = edtPayedKeyPress
        end
      end
      object txtSqTrack: TStaticText
        Left = 208
        Top = 48
        Width = 56
        Height = 17
        Caption = 'txtSqTrack'
        TabOrder = 9
      end
    end
    object pnlPartner: TPanel
      Left = 488
      Top = 0
      Width = 201
      Height = 49
      BevelOuter = bvNone
      TabOrder = 5
      Visible = False
      object lbl6: TLabel
        Left = 6
        Top = 5
        Width = 46
        Height = 13
        Caption = #1055#1072#1088#1090#1085#1077#1088':'
      end
      object lbl8: TLabel
        Left = 7
        Top = 28
        Width = 57
        Height = 13
        Caption = #1040#1076#1088'.'#1087#1072#1088#1090#1085'.:'
      end
      object btn3: TSpeedButton
        Left = 176
        Top = 24
        Width = 23
        Height = 22
        Caption = '...'
      end
      object btnAddPartner: TSpeedButton
        Left = 176
        Top = 0
        Width = 23
        Height = 22
        Action = actAddPartner
      end
      object dblkcbbPartner: TDBLookupComboBox
        Left = 71
        Top = 0
        Width = 105
        Height = 21
        DataField = 'Partner'
        DataSource = DM.ds1
        TabOrder = 0
      end
      object dblkcbbRespAddrPartner: TDBLookupComboBox
        Left = 71
        Top = 24
        Width = 105
        Height = 21
        DataField = 'RespAddrPartner'
        DataSource = DM.ds1
        TabOrder = 1
      end
    end
    object dblkcbbResponsible: TDBLookupComboBox
      Left = 109
      Top = 49
      Width = 81
      Height = 21
      DataField = 'Responsible'
      DataSource = DM.ds1
      TabOrder = 6
    end
    object dtpDate: TDateTimePicker
      Left = 8
      Top = 24
      Width = 91
      Height = 21
      Date = 40894.466099537040000000
      Time = 40894.466099537040000000
      TabOrder = 7
      OnChange = dtpDateChange
    end
    object dblkcbbRespPartner: TDBLookupComboBox
      Left = 559
      Top = 48
      Width = 105
      Height = 21
      DataField = 'RespPartner'
      DataSource = DM.ds1
      TabOrder = 8
    end
  end
  object tbcFilter: TTabControl
    Left = 0
    Top = 0
    Width = 784
    Height = 386
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      #1074#1089#1077
      #1050#1086#1074#1088#1099
      #1056#1072#1079#1085#1086#1077
      #1044#1086#1088#1086#1078#1082#1080
      #1050#1072#1088#1090#1080#1085#1099
      #1052#1077#1090#1072#1083#1083)
    TabIndex = 0
    OnChange = tbcFilterChange
    object dbgrdDetGoods: TDBGrid
      Left = 4
      Top = 24
      Width = 776
      Height = 358
      Align = alClient
      DataSource = ds1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrdDetGoodsCellClick
      OnDrawColumnCell = dbgrdDetGoodsDrawColumnCell
      OnKeyPress = dbgrdDetGoodsKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'GArticul'
          Title.Caption = #1040#1088#1090#1080#1082#1091#1083
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GTitle'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
          Width = 364
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DCount'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PrSquare'
          Title.Caption = #1062#1077#1085#1072' '#1084'.'#1082#1074'.'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DPriceCoeff'
          Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SelectCount'
          Title.Caption = #1042#1099#1073#1088#1072#1085#1086
          Visible = True
        end>
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 620
    Width = 784
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object aplctnvnts1: TApplicationEvents
    OnIdle = aplctnvnts1Idle
    Left = 696
    Top = 264
  end
  object qryGoods: TQuery
    OnCalcFields = qryGoodsCalcFields
    DatabaseName = 'AAA'
    SQL.Strings = (
      
        'SELECT Detailgoods.DCount, Detailgoods.DPriceCoeff, Typegoods.TG' +
        'oods, LOWER( Goods.GTitle ) GTitle, Goods.GArticul, Goods.GLengt' +
        'h, Goods.GWidth, Addresspartner.ACity, Addresspartner.AStreet, P' +
        'roducergoods.ProducerGoods, Detailgoods.DetailGoodsID, Addresspa' +
        'rtner.AddressPartnerID, Goods.GType, Goods.GInfo, Goods.GColor, ' +
        'Goods.GImageCode, Goods.GFirm'
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
    Left = 72
    Top = 64
    object intgrfldGoodsDCount: TIntegerField
      FieldName = 'DCount'
      Origin = 'AAA."DetailGoods.DB".DCount'
      OnGetText = intgrfldGoodsDCountGetText
    end
    object crncyfldGoodsDPriceCoeff: TCurrencyField
      FieldName = 'DPriceCoeff'
      Origin = 'AAA."DetailGoods.DB".DPriceCoeff'
      OnGetText = crncyfldGoodsDPriceCoeffGetText
    end
    object strngfldGoodsTGoods: TStringField
      FieldName = 'TGoods'
      Origin = 'AAA."TypeGoods.DB".TGoods'
    end
    object strngfldGoodsGTitle: TStringField
      FieldName = 'GTitle'
      Origin = 'AAA."GOODS.DB".GTitle'
      OnGetText = strngfldGoodsGTitleGetText
      Size = 40
    end
    object strngfldGoodsGArticul: TStringField
      FieldName = 'GArticul'
      Origin = 'AAA."GOODS.DB".GArticul'
    end
    object intgrfldGoodsGLength: TIntegerField
      FieldName = 'GLength'
      Origin = 'AAA."GOODS.DB".GLength'
    end
    object intgrfldGoodsGWidth: TIntegerField
      FieldName = 'GWidth'
      Origin = 'AAA."GOODS.DB".GWidth'
    end
    object strngfldGoodsACity: TStringField
      FieldName = 'ACity'
      Origin = 'AAA."AddressPartner.DB".ACity'
    end
    object strngfldGoodsAStreet: TStringField
      FieldName = 'AStreet'
      Origin = 'AAA."AddressPartner.DB".AStreet'
    end
    object strngfldGoodsProducerGoods: TStringField
      FieldName = 'ProducerGoods'
      Origin = 'AAA."ProducerGoods.DB".ProducerGoods'
      Size = 11
    end
    object crncyfldGoodsPrSquare: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PrSquare'
      DisplayFormat = '# ##0.00'#1075#1088
      Calculated = True
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
    object intgrfldGoodsSelectCount: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SelectCount'
      OnGetText = intgrfldGoodsSelectCountGetText
      Calculated = True
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
    Left = 48
    Top = 64
  end
  object pm1: TPopupMenu
    Left = 104
    Top = 64
    object mniAddgoods: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
    end
    object mniSelectAll1: TMenuItem
      Action = actSelectAll
    end
  end
  object pm2: TPopupMenu
    Left = 105
    Top = 489
    object mniAddgoods1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
    end
  end
  object actlst1: TActionList
    Left = 664
    Top = 264
    object actAddGoods: TAction
      Caption = 'actAddGoods'
    end
    object actAddPartner: TAction
      Caption = '...'
    end
    object actAddRespPartner: TAction
      Caption = '...'
    end
    object actSelectAll: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnExecute = actSelectAllExecute
    end
  end
end
