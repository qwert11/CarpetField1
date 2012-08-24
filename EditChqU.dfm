object fmEditCheque: TfmEditCheque
  Left = 526
  Top = 162
  Width = 612
  Height = 342
  Caption = #1042#1074#1086#1076'/'#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1095#1077#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl5: TLabel
    Left = 8
    Top = 192
    Width = 142
    Height = 13
    Caption = #1057#1074#1103#1079#1100' '#1089' '#1095#1077#1082#1086#1084'(-1 '#1089#1074#1103#1079#1080' '#1085#1077#1090')'
  end
  object lbl6: TLabel
    Left = 168
    Top = 232
    Width = 82
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
  end
  object lbl9: TLabel
    Left = 8
    Top = 232
    Width = 111
    Height = 13
    Caption = #1063#1077#1082' '#1074#1099#1076#1072#1085' '#1087#1086' '#1072#1076#1088#1077#1089#1091':'
  end
  object lbl10: TLabel
    Left = 328
    Top = 232
    Width = 161
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1079#1072' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102':'
  end
  object dbrgrpCType: TDBRadioGroup
    Left = 0
    Top = 0
    Width = 193
    Height = 193
    Caption = #1058#1080#1087' '#1095#1077#1082#1072
    DataField = 'CType'
    DataSource = DM.ds1
    Items.Strings = (
      #1055#1088#1086#1076#1072#1078#1072
      #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1072#1078#1080
      #1055#1086#1082#1091#1087#1082#1072' '#1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1082#1080
      #1048#1084#1087#1086#1088#1090' '#1080#1079' Xsl'
      #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1080#1079' '#1073#1072#1079#1099' virtual'
      #1047#1072#1082#1072#1079
      #1054#1090#1082#1072#1079' '#1086#1090' '#1079#1072#1082#1072#1079#1072
      #1056#1072#1089#1093#1086#1076#1099
      #1044#1077#1085#1077#1078#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      #1047#1072#1082#1088#1099#1090#1080#1077' '#1079#1072#1082#1072#1079#1072
      #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072' '#1090#1086#1074#1072#1088#1072
      #1055#1088#1086#1076#1072#1078#1072' ('#1087#1077#1088#1077#1089#1086#1088#1090#1080#1085#1075')')
    ReadOnly = True
    TabOrder = 0
    Values.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16')
  end
  object dbedtCWithCheque: TDBEdit
    Left = 8
    Top = 208
    Width = 41
    Height = 21
    DataField = 'CWithCheque'
    DataSource = DM.ds1
    TabOrder = 1
  end
  object dblkcbbCResponsible: TDBLookupComboBox
    Left = 168
    Top = 256
    Width = 145
    Height = 21
    DataField = 'Responsible'
    DataSource = DM.ds1
    TabOrder = 2
  end
  object dblkcbbCAddress: TDBLookupComboBox
    Left = 8
    Top = 256
    Width = 145
    Height = 21
    DataField = 'Address'
    DataSource = DM.ds1
    ReadOnly = True
    TabOrder = 3
  end
  object dblkcbbCRespTransact: TDBLookupComboBox
    Left = 328
    Top = 256
    Width = 145
    Height = 21
    DataField = 'RespTransact'
    DataSource = DM.ds1
    TabOrder = 4
  end
  object pnl1: TPanel
    Left = 208
    Top = 0
    Width = 393
    Height = 41
    BevelWidth = 2
    TabOrder = 5
    object lbl2: TLabel
      Left = 170
      Top = 16
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072':'
    end
    object lbl1: TLabel
      Left = 12
      Top = 16
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object dbedtCRetDate: TDBEdit
      Left = 256
      Top = 8
      Width = 121
      Height = 21
      DataField = 'CRetDate'
      DataSource = DM.ds1
      TabOrder = 0
    end
    object dbedtCDate: TDBEdit
      Left = 48
      Top = 8
      Width = 92
      Height = 21
      DataField = 'CDate'
      DataSource = DM.ds1
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 208
    Top = 40
    Width = 393
    Height = 89
    BevelWidth = 2
    TabOrder = 6
    object lbl7: TLabel
      Left = 16
      Top = 68
      Width = 84
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1087#1072#1088#1090#1085#1077#1088#1072':'
    end
    object lbl3: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 13
      Caption = #1055#1072#1088#1090#1085#1077#1088':'
    end
    object lbl4: TLabel
      Left = 186
      Top = 16
      Width = 143
      Height = 13
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1086#1090' '#1087#1072#1088#1090#1085#1077#1088#1072
    end
    object dblkcbbCPartner: TDBLookupComboBox
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      DataField = 'Partner'
      DataSource = DM.ds1
      TabOrder = 0
    end
    object dblkcbbCAddrPartner: TDBLookupComboBox
      Left = 112
      Top = 60
      Width = 145
      Height = 21
      DataField = 'RespAddrPartner'
      DataSource = DM.ds1
      TabOrder = 1
    end
    object dblkcbbCRespPartner: TDBLookupComboBox
      Left = 192
      Top = 32
      Width = 105
      Height = 21
      DataField = 'RespPartner'
      DataSource = DM.ds1
      ReadOnly = True
      TabOrder = 2
    end
  end
  object pnl3: TPanel
    Left = 208
    Top = 128
    Width = 393
    Height = 65
    BevelWidth = 2
    TabOrder = 7
    object lbl16: TLabel
      Left = 264
      Top = 12
      Width = 48
      Height = 13
      Caption = #1050' '#1086#1087#1083#1072#1090#1077':'
    end
    object lbl12: TLabel
      Left = 8
      Top = 12
      Width = 67
      Height = 13
      Caption = #1062#1077#1085#1072' '#1090#1086#1074#1072#1088#1072':'
    end
    object lbl14: TLabel
      Left = 8
      Top = 44
      Width = 52
      Height = 13
      Caption = #1059#1087#1083#1072#1095#1077#1085#1086':'
    end
    object lbl11: TLabel
      Left = 144
      Top = 12
      Width = 62
      Height = 13
      Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090
    end
    object dbedtCPrice: TDBEdit
      Left = 80
      Top = 8
      Width = 60
      Height = 21
      DataField = 'CPrice'
      DataSource = DM.ds1
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtCToPayment: TDBEdit
      Left = 320
      Top = 4
      Width = 60
      Height = 21
      DataField = 'CToPayment'
      DataSource = DM.ds1
      TabOrder = 1
    end
    object dbedtCPayedSum: TDBEdit
      Left = 80
      Top = 36
      Width = 60
      Height = 21
      DataField = 'CPayedSum'
      DataSource = DM.ds1
      ReadOnly = True
      TabOrder = 2
    end
    object txtCoeff: TStaticText
      Left = 208
      Top = 8
      Width = 40
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'txtCoeff'
      TabOrder = 3
    end
  end
  object btn1: TBitBtn
    Left = 440
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkOK
  end
  object btn2: TBitBtn
    Left = 528
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 9
    Kind = bkCancel
  end
end
