unit ForRunOrderU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TfmForRunOrder = class(TForm)
    dbgrd1: TDBGrid;
    qryForRunOrder: TQuery;
    ds1: TDataSource;
    intgrfldForRunOrderMCount: TIntegerField;
    strngfldForRunOrderGTitle: TStringField;
    strngfldForRunOrderGArticul: TStringField;
    intgrfldForRunOrderGLength: TIntegerField;
    intgrfldForRunOrderGWidth: TIntegerField;
    crncyfldForRunOrderMPrice: TCurrencyField;
    strngfldForRunOrderTGoods: TStringField;
    strngfldForRunOrderProducerGoods: TStringField;
    intgrfldForRunOrderGType: TIntegerField;
    txtCDate: TStaticText;
    txtCPrice: TStaticText;
    txtCToPayment: TStaticText;
    txtCPayedSum: TStaticText;
    txtResponsible: TStaticText;
    txtRespPartner: TStaticText;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lRemSumm: TLabel;
    strngfldForRunOrderGInfo: TStringField;
    crncyfldForRunOrderMToPayment: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strngfldForRunOrderGTitleGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormHide(Sender: TObject);
    procedure intgrfldForRunOrderMCountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure crncyfldForRunOrderMPriceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmForRunOrder: TfmForRunOrder;

implementation

uses CarpetFieldU, dmCheque, AutoBot1U;

{$R *.dfm}

procedure TfmForRunOrder.FormShow(Sender: TObject);
begin
  //idOrder
end;

procedure TfmForRunOrder.FormCreate(Sender: TObject);
var
  vResult: Variant;
begin
  with qryForRunOrder do
  begin
    //Close;
    //SQL.Clear;
//    SQL.Add('SELECT MCount, GTitle, GArticul, GLength, GWidth, MPrice, TGoods, ProducerGoods');
//    SQL.Add('FROM Move');
//    SQL.Add('INNER JOIN Detailgoods ON  (MGoods = DGoods)');
//    SQL.Add('INNER JOIN Cheque ');
//    SQL.Add('ON  (ChequeID = MChequeID)');
//    SQL.Add('INNER JOIN Goods ON  (DGoods = GoodsID)  , Typegoods, Producergoods');
//    SQL.Add('WHERE  GMadeIn = ProducerGoodsID AND TypeGoodsID = GType AND ChequeID = ' + IntToStr(idOrder));
    //SQL.Add(' AND ChequeID = ' + IntToStr(idOrder));

    //Open;
    //Filter := 'ChequeID = ' + IntToStr(idOrder));
    //Filtered := True;
    Close;
    ParamByName('IDcheque').Value := idOrder;
    Open;
    vResult := quQuery('SELECT CDate, CPrice, CToPayment, CPayedSum, PSurname, PName FROM Cheque, Personel WHERE CResponsible = PersonelID AND ChequeID = ' + IntToStr(idOrder));
    if VarIsArray(vResult) then
      begin
        Caption := 'Заказ от ' + DateToStr(vResult[1]);
        txtCDate.Caption := DateToStr(vResult[1]);
        txtCPrice.Caption := CurrToStr(vResult[2]) + ' грн.';
        txtCToPayment.Caption := CurrToStr(vResult[3]) + ' грн.';
        txtCPayedSum.Caption := CurrToStr(vResult[4]) + ' грн.';
        lRemSumm.Caption := CurrToStr(vResult[3] - vResult[4]);
        txtResponsible.Caption := vResult[5] + ' ' + vResult[6];
      end
    else
      ShowMessage('Не найден чек');
    vResult := quQuery('SELECT PSurname PName FROM Cheque, Personel WHERE CRespPartner = PersonelID AND ChequeID = ' + IntToStr(idOrder));
    if VarIsArray(vResult) then
      txtRespPartner.Caption := vResult[1] + ' ' + vResult[2]
    else
      if not VarIsNull(vResult) then
        txtRespPartner.Caption := vResult;
  end;
end;

procedure TfmForRunOrder.strngfldForRunOrderGTitleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case cTypeGoods(intgrfldForRunOrderGType.Value) of
    tCarpet, tElse, tTrack:
      Text := strngfldForRunOrderGTitle.Value + ' / ' + MmToMetre(intgrfldForRunOrderGWidth.AsString) +
        ' * ' + MmToMetre(intgrfldForRunOrderGLength.AsString) + ' [' +
        strngfldForRunOrderProducerGoods.Value + '] (' +
        strngfldForRunOrderTGoods.Value + ') ' + strngfldForRunOrderGInfo.Value;
  else
    Text := strngfldForRunOrderGTitle.Value + ' [' +
      strngfldForRunOrderProducerGoods.Value + '] (' +
      strngfldForRunOrderTGoods.Value + ')';
  end;

end;

procedure TfmForRunOrder.FormHide(Sender: TObject);
begin
  qryForRunOrder.Close;
end;

procedure TfmForRunOrder.intgrfldForRunOrderMCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case cTypeGoods(intgrfldForRunOrderGType.Value) of
    tTrack:
      Text := MmToMetre(intgrfldForRunOrderMCount.AsString) + 'м.';
  else
    Text := intgrfldForRunOrderMCount.AsString;
  end;
end;

procedure TfmForRunOrder.crncyfldForRunOrderMPriceGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatCurr('# ##0.00гр', intgrfldForRunOrderMCount.Value * crncyfldForRunOrderMPrice.Value)
end;

end.
