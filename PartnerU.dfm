object fmPartner: TfmPartner
  Left = 538
  Top = 81
  Width = 463
  Height = 426
  Caption = #1055#1072#1088#1090#1085#1077#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 441
    Height = 145
    DataSource = DM.ds5
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PCoeff'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRetDays'
        Visible = True
      end>
  end
  object btn1: TBitBtn
    Left = 280
    Top = 360
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object btn2: TBitBtn
    Left = 368
    Top = 360
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object dbgrd2: TDBGrid
    Left = 0
    Top = 144
    Width = 441
    Height = 65
    DataSource = DM.ds4
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ACity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AStreet'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AHouse'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AInfo'
        Visible = True
      end>
  end
  object dbgrd3: TDBGrid
    Left = 0
    Top = 208
    Width = 441
    Height = 113
    DataSource = DM.ds6
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PSurname'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PName'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PPatronymic'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDOB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PTelephone'
        Visible = True
      end>
  end
end
