unit MoneyTransactU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ComCtrls, AutoBot1U;

type
  TfmMoneyTransact = class(TForm)
    dblkcbbResp: TDBLookupComboBox;
    dblkcbbRespPartner: TDBLookupComboBox;
    dblkcbbAddrPartner: TDBLookupComboBox;
    calMonTrans: TMonthCalendar;
    lbl1: TLabel;
    dblkcbbPartner: TDBLookupComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnApply: TBitBtn;
    btnClose: TBitBtn;
    chkEnterRecipient: TCheckBox;
    edtSumMoney: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    procedure btnApplyClick(Sender: TObject);
    procedure edtSumMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure calMonTransClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Sender: TObject; tCheque: TTypeCheque = chMonOperat); reintroduce;
  end;

var
  fmMoneyTransact: TfmMoneyTransact;

implementation

uses dmCheque, CarpetFieldU;

var
  TypeCheque: TTypeCheque;

{$R *.dfm}

procedure TfmMoneyTransact.btnApplyClick(Sender: TObject);
var
  s1, s2: string;
begin
  ModalResult := 0;
  if (Int(calMonTrans.Date) < LastDate) or (Int(calMonTrans.Date) > Date) then
    begin
      ShowMessage('Дата ' + DateToStr(calMonTrans.Date) + ' не подходит');
      Exit
    end;
  if not ifHardStrToFloat(edtSumMoney.Text) then
    begin
      ShowMessage('Введите сумму');
      Exit;
    end;

  if (dblkcbbPartner.KeyValue = 0) or
      (dblkcbbRespPartner.KeyValue = 0) or
      (dblkcbbAddrPartner.KeyValue = 0) or
      (dblkcbbResp.KeyValue = 0) then
    Exit;

  // меняем знак если деньги выходят
  if not chkEnterRecipient.Checked then    // деньги не нам
    if StrToCurr(edtSumMoney.Text) >= 0 then
      edtSumMoney.Text := CurrToStr(-1 * StrToCurr(edtSumMoney.Text));
  // удаляем запятые
  //edtSumMoney.Text := FloatToStrP(StrToFloat(edtSumMoney.Text));

  DM.DB.StartTransaction;
  try
    with DM do
      case TypeCheque of
        chRunOrder:
          begin
            tbCheque.Edit;
            crncyfldChequeCPayedSum.Value := crncyfldChequeCPayedSum.Value + StrToCurr(edtSumMoney.Text);
            tbCheque.Post;
          end;
      else
        tbCheque.Append;
        dtfldChequeCDate.Value := calMonTrans.Date;
        intgrfldChequeCAddress.Value := Address;
        intgrfldChequeCType.Value := Integer(chMonOperat);
        crncyfldChequeCPrice.Value := 0;
        crncyfldChequeCToPayment.Value := 0;
        crncyfldChequeCPayedSum.Value := StrToCurr(edtSumMoney.Text);

        intgrfldChequeCWithCheque.Value := - 1;
        intgrfldChequeCResponsible.Value := dblkcbbResp.KeyValue;
        intgrfldChequeCPartner.Value := 1;
        intgrfldChequeCRespPartner.Value := dblkcbbRespPartner.KeyValue;
        intgrfldChequeCAddrPartner.Value := dblkcbbAddrPartner.KeyValue;
        dtmfldChequeCDateTimeTransact.Value := Now;
        intgrfldChequeCRespTransact.Value := cRespTransact;
        dtfldChequeCRetDate.Value := calMonTrans.Date;
        tbCheque.Post;
      end;

    if NewMiniReportFromLast(calMonTrans.Date) then  // новая дата
      quQuery('INSERT INTO GraphWork (GWDate, GWAddress, GWResp, GWAlgoritm)' +
        'VALUES ("' + DateToStr(Int(calMonTrans.Date)) + '", ' + IntToStr(Address) + ', ' +
          IntToStr(dblkcbbResp.KeyValue) + ', -1)');
    quQuery('INSERT INTO MoveMoney (MMoney, MmChequeID, MmRespPartner, MmResp, MmDate) ' +
      'VALUES (' + FloatToStrP(StrToFloat(edtSumMoney.Text))
       + ', ' + DM.atncfldChequeChequeID.AsString + ', ' + VarToStr(dblkcbbRespPartner.KeyValue) + ', ' +
        VarToStr(dblkcbbResp.KeyValue) + ', "' + DateToStr(Int(calMonTrans.Date)) + '")');
    quQuery('UPDATE PERSONEL SET PFinDelta = PFinDelta + ' + FloatToStrP(StrToFloat(edtSumMoney.Text)) +
      ' WHERE PersonelID = ' + IntToStr(dblkcbbRespPartner.KeyValue));
    quQuery('UPDATE MiniReport SET MrMoney = MrMoney + ' + FloatToStrP(StrToFloat(edtSumMoney.Text)) + ' WHERE MrAddressPartnerID = ' +
      IntToStr(Address) + ' AND MrDate = "' + DateToStr(calMonTrans.Date) + '"');
    if not TESTALL(s1, s2) then
      Abort;
    DM.DB.Commit;
    fmCheque.stat1.Panels[0].Text := s1;
    fmCheque.stat1.Panels[1].Text := s2;
    ModalResult := 1;
  except
    DM.DB.Rollback;
    edtSumMoney.Text := '';
  end;
end;

procedure TfmMoneyTransact.edtSumMoneyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = ',' then
    Key := DecimalSeparator; // запятую заменяем на разделитель для числа

  if Key = '.' then
    Key := DecimalSeparator; // точку заменяем на сепаратор (на всякий случай)

  if not (Key in ['0'..'9',DecimalSeparator,#8,#13]) // символы которые пропускаются
    or ((Key = DecimalSeparator) // все цифры знак минус разделитель
    and (POS (DecimalSeparator, edtSumMoney.Text) > 0)) // запрет на второй сепаратор
    or ((Key = '-') and (POS ('-', edtSumMoney.Text) > 0)) // запрет на второй минус
    or ((Key = '-') and (edtSumMoney.SelStart <> 0)) // запрет на минус не вначале цифры
    then // (можно и предыдущей строчки но так лучше для понимания)
  begin
    Key := #0; // запрещенный символ заменяем нулем
    MessageBeep (MB_OK); // биб в спикир
  end;

end;

procedure TfmMoneyTransact.calMonTransClick(Sender: TObject);
begin
  if calMonTrans.Date < LastDate then
    calMonTrans.Date := LastDate else
  if calMonTrans.Date > Date then
    calMonTrans.Date := Date; 
end;

procedure TfmMoneyTransact.FormHide(Sender: TObject);
begin
  if dblkcbbResp.ListVisible then
    dblkcbbResp.CloseUp(True);
  if dblkcbbRespPartner.ListVisible then
    dblkcbbRespPartner.CloseUp(True);
  if dblkcbbAddrPartner.ListVisible then
    dblkcbbAddrPartner.CloseUp(True);
  if dblkcbbPartner.ListVisible then
    dblkcbbPartner.CloseUp(True);
end;

procedure TfmMoneyTransact.FormShow(Sender: TObject);
begin
  with DM do
  case TypeCheque of
    chRunOrder:
      begin
        dblkcbbPartner.KeyValue := intgrfldChequeCPartner.Value;
        dblkcbbRespPartner.KeyValue := intgrfldChequeCRespPartner.Value;
        dblkcbbAddrPartner.KeyValue := intgrfldChequeCAddrPartner.Value;
        chkEnterRecipient.Checked := True;
      end;
  else
    dblkcbbPartner.KeyValue := 0;
    dblkcbbRespPartner.KeyValue := 0;
    dblkcbbAddrPartner.KeyValue := 0;
    chkEnterRecipient.Checked := False;
  end;
  calMonTrans.Date := LastDate;
  dblkcbbResp.KeyValue := 0;
  edtSumMoney.Text := ''
end;

constructor TfmMoneyTransact.Create(Sender: TObject;
  tCheque: TTypeCheque);
begin
  inherited Create(Sender as TComponent);
  TypeCheque := tCheque;
end;

end.
