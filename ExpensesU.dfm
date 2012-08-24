object fmExpenses: TfmExpenses
  Left = 472
  Top = 187
  Width = 563
  Height = 296
  Caption = #1056#1072#1089#1093#1086#1076
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
  object lbl1: TLabel
    Left = 392
    Top = 168
    Width = 82
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
  end
  object btnCansel: TBitBtn
    Left = 479
    Top = 216
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkCancel
  end
  object btnOk: TBitBtn
    Left = 391
    Top = 216
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object cal1: TMonthCalendar
    Left = 390
    Top = 0
    Width = 162
    Height = 153
    Date = 40896.887093819450000000
    TabOrder = 2
    OnClick = cal1Click
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 393
    Height = 97
    DataSource = DM.ds7
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Respon'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EInfo'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESumm'
        Width = 61
        Visible = True
      end>
  end
  object strngrdExpenses: TStringGrid
    Left = 0
    Top = 96
    Width = 393
    Height = 145
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 4
    OnKeyDown = strngrdExpensesKeyDown
    OnKeyPress = strngrdExpensesKeyPress
    ColWidths = (
      281
      73)
  end
  object txtExpenses: TStaticText
    Left = 256
    Top = 160
    Width = 10
    Height = 17
    Caption = '0'
    TabOrder = 5
    Visible = False
  end
  object stat1: TStatusBar
    Left = 0
    Top = 243
    Width = 555
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object dblkcbbResponsible: TDBLookupComboBox
    Left = 392
    Top = 184
    Width = 161
    Height = 21
    KeyField = 'PersonelID'
    ListField = 'PSurname; PDOB'
    ListSource = DM.ds6
    TabOrder = 7
  end
  object aplctnvnts1: TApplicationEvents
    OnIdle = aplctnvnts1Idle
    Left = 488
    Top = 120
  end
end
