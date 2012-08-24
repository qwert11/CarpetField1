unit Pricing_PolicyU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, ActnList, Menus, ComCtrls,
  AppEvnts, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TfmPricing_Policy = class(TForm)
    dbgrdPricing: TDBGrid;
    qryPricing: TQuery;
    ds1: TDataSource;
    strngfldPricingTGoods: TStringField;
    strngfldPricingProducerGoods: TStringField;
    strngfldPricingGTitle: TStringField;
    strngfldPricingGArticul: TStringField;
    intgrfldPricingGLength: TIntegerField;
    intgrfldPricingGWidth: TIntegerField;
    intgrfldPricingGType: TIntegerField;
    intgrfldPricingDCount: TIntegerField;
    crncyfldPricingDPriceCoeff: TCurrencyField;
    intgrfldPricingDAddrPartner: TIntegerField;
    crncyfldPricingPrice: TCurrencyField;
    intgrfldPricingDetailGoodsID: TIntegerField;
    crncyfldPricingPriceSq: TCurrencyField;
    pm1: TPopupMenu;
    actlst1: TActionList;
    actNewPriceSquare: TAction;
    actNewPrice: TAction;
    actSelectRollback: TAction;
    actAllRollBack: TAction;
    mniNewPrice: TMenuItem;
    mniNewPriceSquare: TMenuItem;
    mniN1: TMenuItem;
    mniSelectRollback: TMenuItem;
    mniAllRollBack: TMenuItem;
    statPricePolice: TStatusBar;
    aplctnvntsPrPolicy: TApplicationEvents;
    pnl1: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    actApply: TAction;
    dtpPrice: TDateTimePicker;
    lbl1: TLabel;
    dblkcbbResp: TDBLookupComboBox;
    tbcFilterPr: TTabControl;
    edtFind: TEdit;
    procedure dbgrdPricingKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure strngfldPricingGTitleGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure NewPriceUnit;
    procedure RollbackSelect;
    procedure crncyfldPricingPriceGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure crncyfldPricingPriceSqGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure intgrfldPricingDCountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgrdPricingDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure actNewPriceSquareExecute(Sender: TObject);
    procedure actNewPriceExecute(Sender: TObject);
    procedure actNewPriceSquareUpdate(Sender: TObject);
    procedure actAllRollBackExecute(Sender: TObject);
    procedure actAllRollBackUpdate(Sender: TObject);
    procedure actSelectRollbackExecute(Sender: TObject);
    procedure actSelectRollbackUpdate(Sender: TObject);
    procedure aplctnvntsPrPolicyIdle(Sender: TObject; var Done: Boolean);
    procedure actApplyUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
    procedure tbcFilterPrChange(Sender: TObject);
    procedure crncyfldPricingDPriceCoeffGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure edtFindChange(Sender: TObject);
    procedure edtFindClick(Sender: TObject);
    procedure edtFindDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPricing_Policy: TfmPricing_Policy;

implementation

uses dmCheque, AutoBot1U, ListPriceGoodsU;

var
  LPrice: TListPriceGoods;

{$R *.dfm}

procedure TfmPricing_Policy.dbgrdPricingKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      if cTypeGoods(intgrfldPricingGType.Value) in [tTrack, tCarpet] then
        actNewPriceSquareExecute(Sender)
      else
        actNewPriceExecute(Sender);
      { DONE -o-cPricing_Policy -cKeyPress : �������� ����������� ������� ENTER }
      Abort;
    end;     
end;

procedure TfmPricing_Policy.FormShow(Sender: TObject);
begin
  LPrice := TListPriceGoods.Create;
  qryPricing.Open;
  dblkcbbResp.KeyValue := DefRespons;
  dtpPrice.Date := LastDate + 1;
  Application.OnIdle := aplctnvntsPrPolicyIdle
end;

procedure TfmPricing_Policy.FormHide(Sender: TObject);
begin
  qryPricing.Close;
  LPrice.Free;
  // ���� �� ������� ������ �� ��������� ������
  // Cannot focus a disabled or invisible window
  if dblkcbbResp.ListVisible then
    dblkcbbResp.CloseUp(True);
  Application.OnIdle := nil
end;

procedure TfmPricing_Policy.strngfldPricingGTitleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldPricingGTitle.Value + ' // ' +
    MmToMetre(intgrfldPricingGWidth.AsString) + ' X ' +
      MmToMetre(intgrfldPricingGLength.AsString) + ' [' +
        strngfldPricingProducerGoods.Value + '] ' + '(' +
        strngfldPricingTGoods.Value + ')'
end;

type
  THakBookmark = class(TBookmarkList);


procedure TfmPricing_Policy.NewPriceUnit;
var
  i: Integer;
  s: string;
  newPrice: Real;
begin
  with dbgrdPricing, dbgrdPricing.DataSource.DataSet, qryPricing do
  begin
    try
      DisableControls;
      // ������������� ����� ?
      if SelectedRows.CurrentRowSelected then
        qryPricing.GotoBookmark(TBookmark(SelectedRows[0]))
      else
        THakBookmark(SelectedRows).LinkActive(True);

      s := '';
      repeat
        if not InputQuery('����� ���� �� ��.���.', '������ ���� ', s) then
          Exit;
      until ifHardStrToFloat(s, newPrice);

      for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(TBookmark(SelectedRows[i]));
          LPrice.Add(intgrfldPricingDetailGoodsID.Value,
            crncyfldPricingDPriceCoeff.Value, newPrice,
              intgrfldPricingDCount.Value, intgrfldPricingGType.Value);
        end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfmPricing_Policy.crncyfldPricingPriceGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  curr: Currency;
begin
  with LPrice do
  if not (Assigned(LPrice) and ifFind(intgrfldPricingDetailGoodsID.Value, curr)) then
    curr := crncyfldPricingDPriceCoeff.Value;
  case cTypeGoods(intgrfldPricingGType.Value) of
    tTrack: Text := FormatCurr('# ##0.00�� ��', curr * 1000);
  else
    Text := FormatCurr('# ##0.00��', curr);
  end;
end;

procedure TfmPricing_Policy.crncyfldPricingPriceSqGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  curr: Currency;
begin
  if cTypeGoods(intgrfldPricingGType.Value) in [tCarpet, tTrack] then
    with LPrice do
    begin
      if not (Assigned(LPrice) and
          ifFind(intgrfldPricingDetailGoodsID.Value, curr)) then
        curr := crncyfldPricingDPriceCoeff.Value;

      case cTypeGoods(intgrfldPricingGType.Value) of
        tCarpet:
          Text := FormatCurr('# ##0.00��', curr * 1000000 /
              intgrfldPricingGLength.Value / intgrfldPricingGWidth.Value);
        tTrack:
          Text := FormatCurr('# ##0.00��', curr * 1000000 / intgrfldPricingGWidth.Value);
      end
    end;

end;

procedure TfmPricing_Policy.intgrfldPricingDCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case cTypeGoods(intgrfldPricingGType.Value) of
    tTrack:
      Text := MmToMetre(intgrfldPricingDCount.AsString) + '�.';
  else
    Text := intgrfldPricingDCount.AsString;
  end
end;

procedure TfmPricing_Policy.dbgrdPricingDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  newPrice,
  delta: Currency;
begin
  if not (gdSelected in State) and LPrice.ifFind(intgrfldPricingDetailGoodsID.Value, newPrice) then
    with dbgrdPricing.Canvas do
    begin
      delta := newPrice - crncyfldPricingDPriceCoeff.Value;
      if delta > 0 then
        Brush.Color := clRed else
      if delta < 0 then
        Brush.Color := clGreen
      else
        Brush.Color := clGray;
      FillRect(Rect);
      Font.Color := clWhite;
      if Column.Field.DataType=ftString then
      //� ��������� ����� ����� ����������� �����
        TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text)
      else
      //� ��������� ����� � ������
        TextOut(Rect.Right - TextWidth(Column.Field.Text) -
          2, Rect.Top + 2, Column.Field.Text)
    end

end;

procedure TfmPricing_Policy.actNewPriceSquareExecute(Sender: TObject);
  function UnitTrack(I: Integer): Integer;
  begin
    if I > 0 then
      Result := 1
    else
      Result := 0
  end;
var
  i: Integer;
  snPrice: string;
  newPriceSq: Real;
begin
  //actNewPriceSquareUpdate(actNewPriceSquare);
//  if not actNewPriceSquare.Enabled then
//    begin
//      Beep;
//      Exit;
//    end;

  case cTypeGoods(intgrfldPricingGType.Value) of
    tCarpet, tTrack: ;
  else
    actNewPriceExecute(Sender);
    Exit;
  end;

  with dbgrdPricing, dbgrdPricing.DataSource.DataSet, qryPricing do
    try
      DisableControls;
      // ������������� ����� ?
      if SelectedRows.CurrentRowSelected then
        qryPricing.GotoBookmark(TBookmark(SelectedRows[0]))
      else
        THakBookmark(SelectedRows).LinkActive(True);

      case cTypeGoods(intgrfldPricingGType.Value) of
        tCarpet: snPrice := CurrToStr(crncyfldPricingDPriceCoeff.Value * 1000000 /
          intgrfldPricingGLength.Value / intgrfldPricingGWidth.Value);
        tTrack: snPrice := CurrToStr(crncyfldPricingDPriceCoeff.Value * 1000000 /
          intgrfldPricingGWidth.Value);
      end;

      repeat
        if not InputQuery('����� ���� �.��.', '������ ���� ', snPrice) then
          Exit;
      until ifHardStrToFloat(snPrice, NewPriceSq);

      for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(TBookmark(SelectedRows[i]));

          case cTypeGoods(intgrfldPricingGType.Value) of
            tCarpet:
              LPrice.Add(intgrfldPricingDetailGoodsID.Value,
                crncyfldPricingDPriceCoeff.Value, newPriceSq *
                intgrfldPricingGLength.Value * intgrfldPricingGWidth.Value /
                1000000, intgrfldPricingDCount.Value, intgrfldPricingGType.Value);
            tTrack:
              LPrice.Add(intgrfldPricingDetailGoodsID.Value,
                crncyfldPricingDPriceCoeff.Value, newPriceSq *
                intgrfldPricingGWidth.Value / 1000000, intgrfldPricingDCount.Value, intgrfldPricingGType.Value);
          end;
        end;
    finally
      EnableControls;
    end;
end;

procedure TfmPricing_Policy.actNewPriceExecute(Sender: TObject);
var
  i: Integer;
  snPrice: string;
  newPrice: Real;
begin
  with dbgrdPricing, dbgrdPricing.DataSource.DataSet, qryPricing do
    try
      DisableControls;
      // ������������� ����� ?
      if SelectedRows.CurrentRowSelected then
        qryPricing.GotoBookmark(TBookmark(SelectedRows[0]))
      else
        THakBookmark(SelectedRows).LinkActive(True);

      case cTypeGoods(intgrfldPricingGType.Value) of
        tTrack: snPrice := CurrToStr(crncyfldPricingDPriceCoeff.Value * 1000);
      else
        snPrice := CurrToStr(crncyfldPricingDPriceCoeff.Value);
      end;

      repeat
        if not InputQuery('����� ���� �.��.', '������ ���� ', snPrice) then
          Exit;
      until ifHardStrToFloat(snPrice, NewPrice);

      for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(TBookmark(SelectedRows[i]));

          case cTypeGoods(intgrfldPricingGType.Value) of
            tTrack:
              LPrice.Add(intgrfldPricingDetailGoodsID.Value,
                crncyfldPricingDPriceCoeff.Value, newPrice / 1000,
                  intgrfldPricingDCount.Value, intgrfldPricingGType.Value);
          else
            LPrice.Add(intgrfldPricingDetailGoodsID.Value,
              crncyfldPricingDPriceCoeff.Value, newPrice,
                intgrfldPricingDCount.Value, intgrfldPricingGType.Value);
          end;
        end;
    finally
      EnableControls;
    end;
end;

procedure TfmPricing_Policy.actNewPriceSquareUpdate(Sender: TObject);
begin
  if dbgrdPricing.SelectedRows.Count > 0 then
    (Sender as TAction).Enabled := cTypeGoods(intgrfldPricingGType.Value) in [tTrack, tCarpet]
  else
    (Sender as TAction).Enabled := False
end;

procedure TfmPricing_Policy.actAllRollBackExecute(Sender: TObject);
begin
  LPrice.Clear;
  dbgrdPricing.Refresh
end;

procedure TfmPricing_Policy.actAllRollBackUpdate(Sender: TObject);
begin
  actAllRollBack.Enabled := not LPrice.ifEmpty
end;

procedure TfmPricing_Policy.RollbackSelect;
var
  i: Integer;
begin
  with dbgrdPricing, dbgrdPricing.DataSource.DataSet, qryPricing do
    try
      DisableControls;
      // ������������� ����� ?
      if SelectedRows.CurrentRowSelected then
        qryPricing.GotoBookmark(TBookmark(SelectedRows[0]))
      else
        THakBookmark(SelectedRows).LinkActive(True);

      for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(TBookmark(SelectedRows[i]));
          LPrice.Delete(intgrfldPricingDetailGoodsID.Value);
        end;
    finally
      EnableControls;
    end;
end;

procedure TfmPricing_Policy.actSelectRollbackExecute(Sender: TObject);
begin
  RollbackSelect;
  dbgrdPricing.Refresh;
end;

procedure TfmPricing_Policy.actSelectRollbackUpdate(Sender: TObject);
var
  i: Integer;
  b: Boolean;
begin
  b := False;
  with dbgrdPricing, dbgrdPricing.DataSource.DataSet, qryPricing do
    try
      DisableControls;
      // ������������� ����� ?
      if SelectedRows.CurrentRowSelected then
        qryPricing.GotoBookmark(TBookmark(SelectedRows[0]))
      else
        THakBookmark(SelectedRows).LinkActive(True);
      for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(TBookmark(SelectedRows[i]));
          b := True;
          if not LPrice.ifFind(intgrfldPricingDetailGoodsID.Value) then
            begin
              b := False;
              Break;
            end;
        end;
    finally
      EnableControls;
    end;
  actSelectRollback.Enabled := b;
end;


procedure TfmPricing_Policy.actApplyUpdate(Sender: TObject);
begin
  if LPrice.ifEmpty then
    actApply.Enabled := False
  else
    actApply.Enabled := True
end;

procedure TfmPricing_Policy.aplctnvntsPrPolicyIdle(Sender: TObject;
  var Done: Boolean);
var
  iAll, iUp, iLow, iNotChange: Integer;
  cuAll, cuUp, cuLow: Currency;
  sResult: string;
begin
  LPrice.INFO(iAll, iUp, iLow, iNotChange, cuAll, cuUp, cuLow);
  with statPricePolice.Panels do
  begin
    if LPrice.ifEmpty then
      begin
        Items[0].Text := '';
        Items[1].Text := '�������� ����� ��� �� �������� ���� ';
        Exit;
      end;
    if cuUp - cuLow > 0 then
        Items[0].Text := '���� �������� �� ' + CurrToStr(cuUp - cuLow) + '��.: ' + IntToStr(iAll) + '��.���.'
      else
    if cuUp - cuLow < 0 then
      Items[0].Text := '���� �������� �� ' + CurrToStr(cuUp - cuLow) + '��.: ' + IntToStr(iAll) + '��.���.'
    else
      Items[0].Text := '��������� ���� ��� ���������: ' + IntToStr(iAll) + '��.���.';

    if iUp > 0 then
      sResult := '���������� ' + IntToStr(iUp) + '��.���. �� ' +
        CurrToStr(cuUp) + '��. ';
    if iLow > 0 then
      sResult := sResult + '������� ' + IntToStr(iLow) + '��.���. �� ' +
        CurrToStr(cuLow) + '��. ';
    if iNotChange > 0 then
      sResult := sResult + '��� ��������� ' + IntToStr(iNotChange) +
        '��.���.';
    if (sResult <> Items[1].Text) then
      Items[1].Text := sResult
  end;
end;


procedure TfmPricing_Policy.actApplyExecute(Sender: TObject);
var
  iAll, iUp, iLow, iNotChange, I, IDG: Integer;
  cuAll, cuUp, cuLow, cuNew, cuOld: Currency;
  vResult: Variant;
  sSqTrack: Real;
  sCarpet, sElse, sTrack, sPicture, sMetal: Integer;
  sMoney, nValGoods: Currency;
begin
  ModalResult := 0;
  actApplyUpdate(Sender);

  vResult := quQuery('SELECT MAX(MrDate) FROM MiniReport WHERE MrAddressPartnerID = ' + IntToStr(Address));
  if not((actApply.Enabled) and (VarIsNull(vResult) or
      (vResult < Int(dtpPrice.Date)))) then
    begin
      MessageDlg('������ ������� ���� ������ ' + VarToStr(vResult + 1), mtError, [mbOK], 0);
      Exit;
    end;

  LPrice.INFO(iAll, iUp, iLow, iNotChange, cuAll, cuUp, cuLow);
  if (iLow = 0) and (iUp = 0) then
    if MessageDlg('���� �� ����������.' + #13#10 +
      '�� �������, ��� ������ ������� ���������?', mtWarning, mbOKCancel, 0) <>
        mrOk then
      Exit;
      
  with DM do
    begin
      tbCheque.Append;
      dtfldChequeCDate.Value := dtpPrice.Date;
      intgrfldChequeCAddress.Value := Address;
      intgrfldChequeCType.Value := Integer(chReassessment);
      crncyfldChequeCPrice.Value := 0;
      crncyfldChequeCToPayment.Value := 0;
      crncyfldChequeCPayedSum.Value := 0;

      
      intgrfldChequeCWithCheque.Value := - 1;
      intgrfldChequeCResponsible.Value := dblkcbbResp.KeyValue;
      intgrfldChequeCPartner.Value := 1;
      intgrfldChequeCRespPartner.Value := dblkcbbResp.KeyValue;
      intgrfldChequeCAddrPartner.Value := Address;
      dtmfldChequeCDateTimeTransact.Value := Now;
      intgrfldChequeCRespTransact.Value := cRespTransact;
      dtfldChequeCRetDate.Value := dtpPrice.Date;
      tbCheque.Post;
    end;
  with LPrice, DM do
  for I := 0 to Count - 1 do
    begin
      if not PricePolicy(I, cuNew, cuOld, iAll, IDG) then
        Exit;
      quQuery('UPDATE DetailGoods SET DPriceCoeff = ' + FloatToStrP(cuNew) + ' WHERE DetailGoodsID = ' + IntToStr(IDG));
      quQuery('INSERT INTO MOVE (MGoods, MCount, MPrice, MToPayment, MChequeID) ' +
          'VALUES (' + IntToStr(IDG) + ', ' + IntToStr(iAll) + ', ' + FloatToStrP(cuOld) + ', ' + FloatToStrP(cuNew * iAll) + ', ' + atncfldChequeChequeID.AsString + ')');
      quQuery('INSERT INTO PRICE (PrGoodsID, Price, PrDate)' +
          'VALUES (' + IntToStr(IDG) + ', ' + FloatToStrP(cuOld) + ', "' + DateToStr(dtpPrice.Date) + '")');
    end;
  quLastCount(sSqTrack, sCarpet, sElse, sTrack, sPicture, sMetal, sMoney, nValGoods, Address, DateToStr(dtpPrice.Date + 1));
  vResult := quQuery('SELECT MrDate, MrAddressPartnerID FROM MiniReport WHERE MrAddressPartnerID = ' + IntToStr(Address) + ' AND MrDate = "' + DateToStr(dtpPrice.Date) + '"');
  if VarIsNull(vResult) then
    quQuery('INSERT INTO MiniReport (MrDate, MrAddressPartnerID, MrMoney, MrCarped, MrElse, MrMetal, MrTrack, MrPicture, MrSqTrack, MrValueGoods) ' +
        'VALUES ("' + DateToStr(dtpPrice.Date) + '", ' + IntToStr(Address) + ', ' + FloatToStrP(sMoney) + ', ' + IntToStr(sCarpet) + ', ' + IntToStr(sElse) + ', ' + IntToStr(sMetal) + ', ' + FloatToStrP(sTrack) + ', ' + IntToStr(sPicture) + ', ' + FloatToStrP(sSqTrack) + ', ' + FloatToStrP(nValGoods + cuAll) + ')')
  else
    quQuery('UPDATE MiniReport SET MrValueGoods = MrValueGoods + ' + FloatToStrP(nValGoods + cuAll) + ' WHERE MrAddressPartnerID = ' + IntToStr(vResult[2]) + ' AND MrDate = "' + DateToStr(vResult[1]) + '"');
  quQuery('INSERT INTO GraphWork (GWDate, GWAddress, GWResp, GWAlgoritm)' +
      'VALUES ("' + DateToStr(dtpPrice.Date) + '", ' + IntToStr(Address) + ', ' +
          IntToStr(dblkcbbResp.KeyValue) + ', -1)');
  ModalResult := 1;
end;
        

procedure TfmPricing_Policy.lbl1Click(Sender: TObject);
var
  vResult: Variant;
begin
  vResult := quQuery('SELECT MrDate, MrAddressPartnerID FROM MiniReport WHERE MrAddressPartnerID = ' + IntToStr(Address) + ' AND MrDate = "' + DateToStr(dtpPrice.Date) + '"');
  if VarIsArray(vResult) then
    ShowMessage('');
end;

procedure TfmPricing_Policy.tbcFilterPrChange(Sender: TObject);
begin
  with qryPricing, tbcFilterPr do
  if Tabs[TabIndex] = '���' then
    Filter := 'DAddrPartner = ' + IntToStr(Address)
  else
    Filter := 'DAddrPartner = ' + IntToStr(Address) +
      ' AND TGoods = ''' + Tabs[TabIndex] + '''';
  qryPricing.Filtered := True;
end;

procedure TfmPricing_Policy.crncyfldPricingDPriceCoeffGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  case cTypeGoods(intgrfldPricingGType.Value) of
    tTrack: Text := FormatCurr('# ##0.00�� ��', crncyfldPricingDPriceCoeff.Value * 1000);
  else
    Text := FormatCurr('# ##0.00��', crncyfldPricingDPriceCoeff.Value);
  end;
end;

procedure TfmPricing_Policy.edtFindChange(Sender: TObject);
begin
  qryPricing.Locate('GTitle', edtFind.Text, [loCaseInsensitive, loPartialKey])
end;

procedure TfmPricing_Policy.edtFindClick(Sender: TObject);
begin
  edtFind.SelectAll
end;

procedure TfmPricing_Policy.edtFindDblClick(Sender: TObject);
begin
  edtFind.Clear
end;

end.