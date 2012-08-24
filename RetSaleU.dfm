object fmRetSale: TfmRetSale
  Left = 459
  Top = 240
  Width = 742
  Height = 383
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1072#1078#1080
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
  object dbgrdRetSaleMove: TDBGrid
    Left = 0
    Top = 33
    Width = 734
    Height = 247
    Align = alClient
    DataSource = DM.ds2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pm1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdRetSaleMoveDrawColumnCell
    OnKeyPress = dbgrdRetSaleMoveKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'Articul'
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MCount'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceCount'
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MToPayment'
        Title.Caption = #1050' '#1086#1087#1083#1072#1090#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RetCount'
        Title.Caption = #1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1072' ('#1077#1076'.)'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RetMony'
        Title.Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' ('#1075#1088'.)'
        Width = 119
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 33
    Align = alTop
    TabOrder = 1
    object dbtxtCRespPartner: TDBText
      Left = 592
      Top = 8
      Width = 65
      Height = 17
      DataField = 'RespPartner'
      DataSource = DM.ds1
    end
    object dbtxtCToPayent: TDBText
      Left = 296
      Top = 8
      Width = 65
      Height = 17
      DataField = 'CToPayment'
      DataSource = DM.ds1
    end
    object dbtxtCResp: TDBText
      Left = 432
      Top = 8
      Width = 65
      Height = 17
      DataField = 'Responsible'
      DataSource = DM.ds1
    end
    object dbtxtCPrice: TDBText
      Left = 160
      Top = 8
      Width = 65
      Height = 17
      DataField = 'CPrice'
      DataSource = DM.ds1
    end
    object dbtxtChequeID: TDBText
      Left = 64
      Top = 8
      Width = 65
      Height = 17
      DataField = 'ChequeID'
      DataSource = DM.ds1
    end
    object lbl5: TLabel
      Left = 8
      Top = 8
      Width = 46
      Height = 13
      Caption = 'ID ('#1095#1077#1082#1072'):'
    end
    object lbl7: TLabel
      Left = 128
      Top = 8
      Width = 29
      Height = 13
      Caption = #1062#1077#1085#1072':'
    end
    object lbl9: TLabel
      Left = 240
      Top = 8
      Width = 52
      Height = 13
      Caption = #1055#1088#1086#1087#1083#1072#1090#1072':'
    end
    object lbl10: TLabel
      Left = 376
      Top = 8
      Width = 53
      Height = 13
      Caption = #1055#1088#1086#1076#1072#1074#1077#1094':'
    end
    object lbl11: TLabel
      Left = 520
      Top = 8
      Width = 63
      Height = 13
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 280
    Width = 734
    Height = 50
    Align = alBottom
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 8
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object lbl2: TLabel
      Left = 144
      Top = 8
      Width = 53
      Height = 13
      Caption = #1055#1088#1086#1076#1072#1074#1077#1094':'
    end
    object lbl3: TLabel
      Left = 296
      Top = 8
      Width = 63
      Height = 13
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object lbl4: TLabel
      Left = 440
      Top = 8
      Width = 37
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    object dtpRetSale: TDateTimePicker
      Left = 15
      Top = 24
      Width = 115
      Height = 21
      Date = 40949.568561377320000000
      Time = 40949.568561377320000000
      TabOrder = 0
    end
    object txtPriceRetGoods: TStaticText
      Left = 128
      Top = 0
      Width = 10
      Height = 17
      Caption = '0'
      TabOrder = 1
      Visible = False
    end
    object txtToRetSum: TStaticText
      Left = 136
      Top = 0
      Width = 10
      Height = 17
      Caption = '0'
      TabOrder = 2
      Visible = False
    end
    object edtRetSum: TEdit
      Left = 440
      Top = 24
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0'
      OnKeyPress = edtRetSumKeyPress
    end
    object btnOk: TBitBtn
      Left = 528
      Top = 16
      Width = 75
      Height = 25
      TabOrder = 4
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 624
      Top = 16
      Width = 75
      Height = 25
      TabOrder = 5
      Kind = bkCancel
    end
    object dblkcbbResponsible: TDBLookupComboBox
      Left = 144
      Top = 24
      Width = 121
      Height = 21
      KeyField = 'PersonelID'
      ListField = 'PSurname; PDOB'
      ListSource = DM.ds6
      TabOrder = 6
    end
    object dblkcbbRespPartner: TDBLookupComboBox
      Left = 296
      Top = 24
      Width = 121
      Height = 21
      KeyField = 'PersonelID'
      ListField = 'PSurname; PDOB'
      ListSource = DM.ds6
      TabOrder = 7
    end
  end
  object statRetSale: TStatusBar
    Left = 0
    Top = 330
    Width = 734
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object txtCarpet: TStaticText
    Left = 304
    Top = 184
    Width = 46
    Height = 17
    Caption = 'txtCarpet'
    TabOrder = 4
    Visible = False
  end
  object txtElse: TStaticText
    Left = 304
    Top = 200
    Width = 35
    Height = 17
    Caption = 'txtElse'
    TabOrder = 5
    Visible = False
  end
  object txtTrack: TStaticText
    Left = 304
    Top = 216
    Width = 43
    Height = 17
    Caption = 'txtTrack'
    TabOrder = 6
    Visible = False
  end
  object txtPicture: TStaticText
    Left = 304
    Top = 248
    Width = 48
    Height = 17
    Caption = 'txtPicture'
    TabOrder = 7
    Visible = False
  end
  object txtMetal: TStaticText
    Left = 304
    Top = 264
    Width = 41
    Height = 17
    Caption = 'txtMetal'
    TabOrder = 8
    Visible = False
  end
  object txtSqTrack: TStaticText
    Left = 304
    Top = 232
    Width = 56
    Height = 17
    Caption = 'txtSqTrack'
    TabOrder = 9
    Visible = False
  end
  object aplctnvntsRetSale: TApplicationEvents
    OnIdle = aplctnvntsRetSaleIdle
    Left = 624
    Top = 248
  end
  object pm1: TPopupMenu
    Left = 48
    Top = 160
    object mniN1: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
    end
    object mniN4: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
    end
    object mniN5: TMenuItem
      Caption = '-'
    end
    object mniN2: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    end
    object mniN3: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077
      OnClick = mniN3Click
    end
  end
  object actlst1: TActionList
    Left = 48
    Top = 192
    object actUnselectAll: TAction
      Caption = 'actUnselectAll'
    end
  end
end
