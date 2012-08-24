object fmMinReport: TfmMinReport
  Left = 465
  Top = 243
  Width = 709
  Height = 469
  Caption = 'fmMinReport'
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
    Width = 701
    Height = 315
    Align = alClient
    DataSource = DM.ds9
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MrDate'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrMoney'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrCarped'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrElse'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrMetal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrTrack'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrPicture'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrSqTrack'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MrValueGoods'
        Visible = True
      end>
  end
  object dbgrd2: TDBGrid
    Left = 0
    Top = 315
    Width = 701
    Height = 120
    Align = alBottom
    DataSource = DM.ds10
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Responsible'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GWAlgoritm'
        Visible = True
      end>
  end
end
