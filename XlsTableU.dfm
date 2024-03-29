object fmXlsTable: TfmXlsTable
  Left = 435
  Top = 123
  Width = 721
  Height = 434
  Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object strngrdGOODS_IMPORT: TStringGrid
    Left = 0
    Top = 0
    Width = 713
    Height = 304
    Align = alClient
    ColCount = 11
    FixedCols = 0
    PopupMenu = pm1
    TabOrder = 0
    OnKeyDown = strngrdGOODS_IMPORTKeyDown
    ColWidths = (
      27
      56
      190
      39
      39
      31
      38
      60
      43
      47
      40)
  end
  object pnl1: TPanel
    Left = 0
    Top = 304
    Width = 713
    Height = 76
    Align = alBottom
    TabOrder = 1
    object btnOpenTable: TSpeedButton
      Left = 320
      Top = 35
      Width = 25
      Height = 22
      Action = actOpenFile
      Caption = '...'
    end
    object lbl1: TLabel
      Left = 16
      Top = 43
      Width = 65
      Height = 13
      Caption = #1060#1072#1081#1083' '#1074#1074#1086#1076#1072':'
    end
    object btnOk: TBitBtn
      Left = 496
      Top = 32
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btn2: TBitBtn
      Left = 592
      Top = 32
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkClose
    end
    object edtLoadFile: TEdit
      Left = 88
      Top = 37
      Width = 225
      Height = 21
      TabOrder = 2
      OnKeyPress = edtLoadFileKeyPress
    end
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 711
      Height = 30
      Align = alTop
      TabOrder = 3
      object lbl2: TLabel
        Left = 5
        Top = 13
        Width = 29
        Height = 13
        Caption = #1044#1072#1090#1072':'
        OnClick = lbl2Click
      end
      object lbl3: TLabel
        Left = 126
        Top = 13
        Width = 59
        Height = 13
        Caption = #1054#1090#1074#1077#1090#1089#1090#1074'-'#1081':'
      end
      object lbl4: TLabel
        Left = 291
        Top = 13
        Width = 46
        Height = 13
        Caption = #1055#1072#1088#1090#1085#1077#1088':'
      end
      object lbl5: TLabel
        Left = 533
        Top = 13
        Width = 66
        Height = 13
        Caption = #1054#1090' '#1087#1072#1088#1090#1085#1077#1088#1072':'
      end
      object dblkcbbCRespons: TDBLookupComboBox
        Left = 189
        Top = 8
        Width = 72
        Height = 21
        DataField = 'Responsible'
        DataSource = DM.ds1
        TabOrder = 0
      end
      object dtpCDate: TDateTimePicker
        Left = 40
        Top = 8
        Width = 81
        Height = 21
        Date = 40906.418897384260000000
        Time = 40906.418897384260000000
        TabOrder = 1
        OnChange = dtpCDateChange
      end
      object dblkcbbCPartner: TDBLookupComboBox
        Left = 343
        Top = 8
        Width = 90
        Height = 21
        DataField = 'Partner'
        DataSource = DM.ds1
        TabOrder = 2
      end
      object dblkcbbRespPartner: TDBLookupComboBox
        Left = 603
        Top = 8
        Width = 68
        Height = 21
        DataField = 'RespPartner'
        DataSource = DM.ds1
        TabOrder = 3
      end
      object dblkcbbCAddrPartner: TDBLookupComboBox
        Left = 440
        Top = 8
        Width = 81
        Height = 21
        DataField = 'RespAddrPartner'
        DataSource = DM.ds1
        TabOrder = 4
      end
    end
    object statImp: TStatusBar
      Left = 1
      Top = 56
      Width = 711
      Height = 19
      Panels = <
        item
          Width = 150
        end
        item
          Width = 50
        end>
    end
  end
  object txtCarpet: TStaticText
    Left = 320
    Top = 184
    Width = 46
    Height = 17
    Caption = 'txtCarpet'
    TabOrder = 2
    Visible = False
  end
  object txtTrack: TStaticText
    Left = 320
    Top = 200
    Width = 43
    Height = 17
    Caption = 'txtTrack'
    TabOrder = 3
    Visible = False
  end
  object txtElse: TStaticText
    Left = 320
    Top = 216
    Width = 35
    Height = 17
    Caption = 'txtElse'
    TabOrder = 4
    Visible = False
  end
  object txtPicture: TStaticText
    Left = 320
    Top = 232
    Width = 48
    Height = 17
    Caption = 'txtPicture'
    TabOrder = 5
    Visible = False
  end
  object txtMetal: TStaticText
    Left = 320
    Top = 248
    Width = 41
    Height = 17
    Caption = 'txtMetal'
    TabOrder = 6
    Visible = False
  end
  object txtSqTrack: TStaticText
    Left = 320
    Top = 264
    Width = 56
    Height = 17
    Caption = 'txtSqTrack'
    TabOrder = 7
    Visible = False
  end
  object txtSUM_PRICE: TStaticText
    Left = 320
    Top = 280
    Width = 77
    Height = 17
    Caption = 'txtSUM_PRICE'
    TabOrder = 8
    Visible = False
  end
  object actlst1: TActionList
    Left = 544
    Top = 15
    object actOpenFile: TAction
      Caption = 'actOpenFile'
      OnExecute = actOpenFileExecute
    end
    object actDelColRow: TAction
      Caption = 'actDelColRow'
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = 'Excel files 97-2003 (*.xls)|*.xls'
    Left = 352
    Top = 335
  end
  object mm1: TMainMenu
    Left = 136
    Top = 16
    object mniFile1: TMenuItem
      Caption = 'File'
      object mniOpen1: TMenuItem
        Action = actOpenFile
        Caption = 'Open...'
      end
    end
  end
  object pm1: TPopupMenu
    Left = 168
    Top = 16
    object mniDelCol: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091
      OnClick = mniDelColClick
    end
    object mniDelRow: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = mniDelRowClick
    end
  end
  object aplctnvnts1: TApplicationEvents
    OnIdle = aplctnvnts1Idle
    Left = 528
    Top = 280
  end
end
