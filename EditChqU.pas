unit EditChqU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons;

type
  TfmEditCheque = class(TForm)
    dbrgrpCType: TDBRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedtCRetDate: TDBEdit;
    lbl3: TLabel;
    dblkcbbCPartner: TDBLookupComboBox;
    lbl4: TLabel;
    dbedtCPrice: TDBEdit;
    dbedtCToPayment: TDBEdit;
    dbedtCPayedSum: TDBEdit;
    dbedtCWithCheque: TDBEdit;
    dblkcbbCResponsible: TDBLookupComboBox;
    dblkcbbCAddress: TDBLookupComboBox;
    dblkcbbCAddrPartner: TDBLookupComboBox;
    dblkcbbCRespTransact: TDBLookupComboBox;
    dblkcbbCRespPartner: TDBLookupComboBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl14: TLabel;
    lbl16: TLabel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dbedtCDate: TDBEdit;
    txtCoeff: TStaticText;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditCheque: TfmEditCheque;

implementation

uses dmCheque, DBTables, AutoBot1U;

{$R *.dfm}

procedure TfmEditCheque.FormShow(Sender: TObject);
var
  Auto1: TAutoBot1;
begin
  Auto1 := TAutoBot1.Create;
  with DM.tbCheque, Auto1 do
    begin
      Caption := 'Ввод/редактирование чека от ' + DateToStr(Date);

      // если поле не новое тогда пропускаем инициализацию
{1}   if FieldValues['ChequeID'] <> null then
        Exit;
{2}   FieldValues['CRetDate'] := Date + RetPeriod;
{3}   FieldValues['CType'] := defTypeCheque;
//{4}   FieldValues['CCoeff'] := defCoeff;
{5}   FieldValues['CPrice'] := 0;
      if FieldValues['CPrice'] <> null then
//{6}     FieldValues['CPriceCoeff'] := FieldValues['CPrice'] *
//            FieldValues['CType'] / 100
//      else
//        FieldValues['CPriceCoeff'] := 0;
{7}   FieldValues['CToPayment'] := 0;
{8}   FieldValues['CPayedSum'] := 0;
{9}   FieldValues['CRetSum'] := 0;
//{10}  FieldValues['CRemSumm'] := FieldValues['CToPayment'] -
//          FieldValues['CPayedSum'];
{11}  FieldValues['CWithCheque'] := -1;
{12}  FieldValues['CDate'] := Date;
{13}  FieldValues['CResponsible'] := Responsible;
{14}  FieldValues['CAddress'] := Address;
{15}  FieldValues['CPartner'] := Partner;
{16}  FieldValues['CRespPartner'] := RespPartner;
{17}  FieldValues['CAddrPartner'] := AddrPartner;
{18}  FieldValues['CDateTimeTransact'] := Now;
{19}  FieldValues['CRespTransact'] := RespTransact;
{20}  FieldValues['CExpenses'] := 0;
    end;
  Auto1.Free;
end;

end.
