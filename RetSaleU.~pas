unit RetSaleU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Buttons,
  DB, AppEvnts, ActnList, Menus;

type
  TfmRetSale = class(TForm)
    dbtxtChequeID: TDBText;
    dbtxtCPrice: TDBText;
    dbtxtCToPayent: TDBText;
    dbtxtCResp: TDBText;
    dbtxtCRespPartner: TDBText;
    dbgrdRetSaleMove: TDBGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    dtpRetSale: TDateTimePicker;
    statRetSale: TStatusBar;
    txtPriceRetGoods: TStaticText;
    txtToRetSum: TStaticText;
    edtRetSum: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    aplctnvntsRetSale: TApplicationEvents;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    actlst1: TActionList;
    actUnselectAll: TAction;
    dblkcbbResponsible: TDBLookupComboBox;
    dblkcbbRespPartner: TDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    txtCarpet: TStaticText;
    txtElse: TStaticText;
    txtTrack: TStaticText;
    txtPicture: TStaticText;
    txtMetal: TStaticText;
    txtSqTrack: TStaticText;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    procedure dbgrdRetSaleMoveKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure dbgrdRetSaleMoveDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure aplctnvntsRetSaleIdle(Sender: TObject; var Done: Boolean);
    procedure mniN3Click(Sender: TObject);
    procedure edtRetSumKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRetSale: TfmRetSale;

implementation

uses dmCheque, ListPriceGoodsU, AutoBot1U, CarpetFieldU;

var
  ListRet: TListPriceGoods;

{$R *.dfm}

procedure SumRetMoney(var ToRet: Currency);
var
  I: Integer;
  newCurr: Currency;
begin
  ToRet := 0;
  with ListRet do
  for I := 0 to Count - 1 do
    begin
      ifFind(StrToInt(ID[I]), newCurr);
      ToRet := ToRet + newCurr;
    end;
end;

procedure InList(iCount: Integer);
begin
  with DM do
  case cTypeGoods(intgrfldMoveType.Value) of
    tTrack:
      ListRet.Add(atncfldMoveMoveID.Value, crncyfldMoveMPrice.Value,
        crncyfldMoveMToPayment.Value, intgrfldMoveMCount.Value,
          intgrfldMoveType.Value, intgrfldMoveMGoods.Value, intgrfldMoveWidth.Value, intgrfldMoveMCount.Value);
  else
    ListRet.Add(atncfldMoveMoveID.Value, crncyfldMoveMPrice.Value,
      Round(crncyfldMoveMToPayment.Value / intgrfldMoveMCount.Value * iCount),
        iCount, intgrfldMoveType.Value, intgrfldMoveMGoods.Value);
  end;
end;

procedure TfmRetSale.dbgrdRetSaleMoveKeyPress(Sender: TObject;
  var Key: Char);
var
  oldPrice, newPrice: Currency;
  iCount: Integer;
begin
  with DM, ListRet do
  case Key of
    #32:  // space
      begin
        if ifFind(atncfldMoveMoveID.Value, oldPrice, newPrice, iCount) and
            (intgrfldMoveMCount.Value >= iCount)then
          begin
            if intgrfldMoveMCount.Value > iCount then
              InList(iCount + 1);
          end
        else
          InList(1)
      end;
    //: ;
  end;
  SumRetMoney(newPrice);
  edtRetSum.Text := CurrToStr(newPrice);
  dbgrdRetSaleMove.Refresh;
end;

procedure TfmRetSale.FormShow(Sender: TObject);
begin
  ListRet := TListPriceGoods.Create;
  dblkcbbResponsible.KeyValue := DefRespons;
  dblkcbbRespPartner.KeyValue := DM.intgrfldChequeCRespPartner.Value;
  dtpRetSale.Date := LastDate;
  Caption := Caption + ' от ' + DM.dtfldChequeCDate.AsString;
  Application.OnIdle := aplctnvntsRetSaleIdle;
end;

procedure TfmRetSale.FormHide(Sender: TObject);
begin
  ListRet.Free;
  Application.OnIdle := nil;
  dblkcbbResponsible.CloseUp(True);
  dblkcbbRespPartner.CloseUp(True);
end;

procedure TfmRetSale.dbgrdRetSaleMoveDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  newPrice,
  oldPrice: Currency;
  iCount: Integer;
begin
  with DM do
  if not (gdSelected in State) and ListRet.ifFind(atncfldMoveMoveID.Value,
      oldPrice, newPrice, iCount) then
    with DM, dbgrdRetSaleMove.Canvas do
    begin
      if intgrfldMoveMCount.Value <= iCount then
        Brush.Color := clBlack 
      else
        Brush.Color := clGray;

      FillRect(Rect);
      Font.Color := clWhite;
      if DataCol = 5 then // RetCount
        case cTypeGoods(intgrfldMoveType.Value) of
          tTrack:
            TextOut(Rect.Right - TextWidth(Format('%nм.', [iCount / 1000])) - 2,
              Rect.Top + 2, Format('%nм.', [iCount / 1000]))
        else
          TextOut(Rect.Right - TextWidth(IntToStr(iCount)) - 2,
            Rect.Top + 2, IntToStr(iCount))
        end else
      if DataCol = 6 then // RetMoney
        TextOut(Rect.Right - TextWidth(FormatCurr('# ##0.00гр', newPrice)) - 2,
          Rect.Top + 2, FormatCurr('# ##0.00гр', newPrice)) else
      if Column.Field.DataType = ftString then
      //В строковых полях текст прижимается влево
        TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text)
      else
      //В остальных полях – вправо
        TextOut(Rect.Right - TextWidth(Column.Field.Text) -
          2, Rect.Top + 2, Column.Field.Text)
    end
end;

procedure TfmRetSale.aplctnvntsRetSaleIdle(Sender: TObject;
  var Done: Boolean);

const
  DefMsgForSelect = 'Выбрать мышкой товар для возврата и нажать пробел';

  procedure SetColorRetSum(c: TColor);
  begin
    if edtRetSum.Color <> c then
      edtRetSum.Color := c
  end;
  
var
  I, iCount, iTmp, iType, iWidth, iLength: Integer;
  cuPrice, cuPayment, SumPrice, SumPayment: Currency;
  sCarpet, sElse, sMetal, sPicture, sTrack: Integer;
  sSqTrack: Real;
  s: string;
begin
  Done := False;
  with ListRet do
    if not ifEmpty then
      begin
        cuPrice := 0; cuPayment := 0; SumPrice := 0; SumPayment := 0;
        sCarpet := 0; sElse := 0; sMetal := 0; sPicture := 0; sTrack := 0; sSqTrack := 0; iWidth := 0; iLength := 0;
        s := '';
        if not ifHardStrToFloat(edtRetSum.Text) then
          begin
            statRetSale.Panels.Items[0].Text := '';
            statRetSale.Panels.Items[1].Text := 'Введите сумму возврата';
            edtRetSum.SetFocus;
            Beep;
            Exit;
          end;
        for I := 0 to Count - 1 do
          begin
            ifFind(StrToInt(ID[I]), cuPrice, cuPayment, iCount, iTmp, iType, iWidth, iLength);
            SumPrice := SumPrice + cuPrice * iCount;
            SumPayment := SumPayment + cuPayment;
            case cTypeGoods(iType) of
              tCarpet: Inc(sCarpet);
              tElse: Inc(sElse);
              tTrack:
                begin
                  Inc(sTrack);
                  sSqTrack := sSqTrack + iWidth * iLength / 1000000;
                end;

              tPicture: Inc(sPicture);
              tMetal: Inc(sMetal);
            else
              Exit;
            end;
          end;
        
        case Round(PersOldNew(SumPayment, StrToCurr(edtRetSum.Text))) of
          0: SetColorRetSum(clWindow);
        else
          SetColorRetSum(LighterColor(RGB(255, 0, 0), 100 -
            20 * Abs(Round(PersOldNew(SumPayment, StrToCurr(edtRetSum.Text))))));
        end;

        txtCarpet.Caption := IntToStr(sCarpet);
        txtElse.Caption := IntToStr(sElse);
        txtTrack.Caption := IntToStr(sTrack);
        txtSqTrack.Caption := FloatToStr(sSqTrack);
        txtPicture.Caption := IntToStr(sPicture);
        txtMetal.Caption := IntToStr(sMetal);

        if sCarpet > 0 then
          s := s + 'Ковров: ' + IntToStr(sCarpet) + 'шт.; ';
        if sElse > 0 then
          s := s + 'Разного: ' + IntToStr(sElse) + 'шт.; ';
        if sTrack > 0 then
          s := s + 'Дорожек: ' + IntToStr(sTrack) + 'шт. ' + Format('%nм.кв.', [sSqTrack]);
        if sPicture > 0 then
          s := s + 'Картин: ' + IntToStr(sPicture) + 'шт.; ';
        if sMetal > 0 then
          s := s + 'Метал: ' + IntToStr(sMetal) + 'шт.; ';
        txtPriceRetGoods.Caption := CurrToStr(SumPrice);
        txtToRetSum.Caption := CurrToStr(SumPayment);
//        statRetSale.Panels.Items[0].Text := 'Цена: ' + Format('%m', [SumPrice]) +
//          ' Оплата: ' + Format('%m', [SumPayment]) + ' Возврат: ' + edtRetSum.Text
        statRetSale.Panels.Items[0].Text := 'Оплата: ' + FormatCurr('# ##0.00гр', SumPayment) +
          ' Возврат: ' + FormatCurr('# ##0.00гр', StrToCurr(edtRetSum.Text));
        statRetSale.Panels.Items[1].Text := s;
        Done := True;
      end
    else
      begin
        if txtPriceRetGoods.Caption <> '0' then txtPriceRetGoods.Caption := '0';
        if txtToRetSum.Caption <> '0' then txtToRetSum.Caption := '0';
        if edtRetSum.Text <> '0' then edtRetSum.Text := '0';
        if statRetSale.Panels.Items[0].Text <> '' then
          statRetSale.Panels.Items[0].Text := '';
        if statRetSale.Panels.Items[1].Text <> DefMsgForSelect then
          statRetSale.Panels.Items[1].Text := DefMsgForSelect;
      end;
end;

procedure TfmRetSale.mniN3Click(Sender: TObject);
begin
  ListRet.Clear;
  edtRetSum.Clear;
  dbgrdRetSaleMove.Refresh;
end;

procedure TfmRetSale.edtRetSumKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then
    Key := DecimalSeparator; // запятую заменяем на разделитель для числа

  if Key = '.' then
    Key := DecimalSeparator; // точку заменяем на сепаратор (на всякий случай)

  if not (Key in ['0'..'9', DecimalSeparator, #8, #13]) // символы которые пропускаются
    or ((Key = DecimalSeparator) // все цифры знак минус разделитель
    and (POS (DecimalSeparator, edtRetSum.Text) > 0)) // запрет на второй сепаратор
    //or ((Key = '-') and (POS ('-', edtRetSum.Text) > 0)) // запрет на второй минус
    //or ((Key = '-') and (edtRetSum.SelStart <> 0)) // запрет на минус не вначале цифры
    then // (можно и предыдущей строчки но так лучше для понимания)
  begin
    Key := #0; // запрещенный символ заменяем нулем
    MessageBeep (MB_OK); // биб в спикир
  end;
end;

procedure TfmRetSale.btnOkClick(Sender: TObject);
var
  Done: Boolean;
  iCount: Integer;
  SumIn, oldCurr, newCurr: Currency;
  s1, s2: string;
  ID_OLD_CHEQUE: Integer;
  I,
  ID_PARTNER,
  DetailGoodsID: Integer;
  ValGoods: Currency;
  else1,
  iType,
  TrackCount: Integer;
  tmpRec: Variant;
begin
  ModalResult := 0;
  Done := False;
  SumIn := 0;
  ValGoods := 0;
  aplctnvntsRetSaleIdle(Sender, Done);
  if not Done
      or not ifHardStrToFloat(edtRetSum.Text)
      or ((Int(dtpRetSale.Date) < LastDate)
      or (Int(dtpRetSale.Date) > Date))
      or (dblkcbbResponsible.KeyValue < 1)
      or (dblkcbbRespPartner.KeyValue < 1) then
    Exit;

  ID_OLD_CHEQUE := DM.atncfldChequeChequeID.Value;
  ID_PARTNER := DM.intgrfldChequeCPartner.Value;

  DM.DB.StartTransaction;
  with DM do
  try
    with ListRet do
      begin
        // ЧЕК
        tbCheque.Append;
        dtfldChequeCDate.Value := dtpRetSale.Date;
        intgrfldChequeCAddress.Value := Address;
        intgrfldChequeCType.Value := Integer(chRetSale);
        crncyfldChequeCPrice.Value := StrToCurr(txtPriceRetGoods.Caption);
        crncyfldChequeCToPayment.Value := StrToCurr(txtToRetSum.Caption);
        crncyfldChequeCPayedSum.Value := -1 * StrToCurr(edtRetSum.Text);
        intgrfldChequeCWithCheque.Value := ID_OLD_CHEQUE;
        intgrfldChequeCPartner.Value := ID_PARTNER;
        intgrfldChequeCResponsible.Value := dblkcbbResponsible.KeyValue;
        intgrfldChequeCRespPartner.Value := dblkcbbRespPartner.KeyValue;
        intgrfldChequeCAddrPartner.Value := Address;
        dtmfldChequeCDateTimeTransact.Value := Now;
        intgrfldChequeCRespTransact.Value := RespTransact;
        dtfldChequeCRetDate.Value :=  dtpRetSale.Date + RetPeriod;
        tbCheque.Post;

        // Дельта покупателя
        quQuery('UPDATE PERSONEL SET PFinDelta = PFinDelta - ' + edtRetSum.Text +
          ' WHERE PersonelID = ' + IntToStr(dblkcbbRespPartner.KeyValue));

        // МиниОтчет UPDATE OLD
        if NewMiniReportFromLast(dtpRetSale.Date) then
          quQuery('INSERT INTO GraphWork (GWDate, GWAddress, GWResp, GWAlgoritm)' +
            'VALUES ("' + DateToStr(dtpRetSale.Date) + '", ' + IntToStr(Address) + ', ' +
                IntToStr(dblkcbbResponsible.KeyValue) + ', -1)');

        // Деньги
        quQuery('INSERT INTO MoveMoney (MmDate, MMoney, MmResp, MmRespPartner, MmChequeID) VALUES ("' +
          DateToStr(dtpRetSale.Date) + '", -' + edtRetSum.Text + ', ' + IntToStr(dblkcbbResponsible.KeyValue) + ', ' +
            IntToStr(dblkcbbRespPartner.KeyValue) + ', ' + atncfldChequeChequeID.AsString + ')');

        for I := 0 to Count - 1 do
        begin
            ifFind(StrToInt(ID[I]), oldCurr, newCurr, iCount, DetailGoodsID, iType, else1, TrackCount);
            begin
              // Сколько стоит товар из тб. DetailGoods
              ValGoods := ValGoods + iCount * quQuery('SELECT DPriceCoeff FROM DetailGoods WHERE DetailGoodsID = ' +
                IntToStr(DetailGoodsID));

              case cTypeGoods(iType) of
                tTrack:
                  begin
                    // MOVE
                    quQuery('INSERT INTO MOVE (MGoods, MCount, MPrice, MToPayment, MChequeID) VALUES (' +
                      IntToStr(DetailGoodsID) + ', ' + IntToStr(iCount) + ', ' +
                        FloatToStrP(oldCurr) + ', ' + FloatToStrP(newCurr) + ', ' + atncfldChequeChequeID.AsString + ')');

                    if not tbDetailGoods.Locate('DetailGoodsID', DetailGoodsID, []) then
                      Abort;
                    with  tbGoods do
                      begin                                                                                                                                                     { TODO 5 : ОБЯЗАТЕЛЬНО проверить GPrice }
                        tmpRec := Lookup('GoodsID', intgrfldDetailGoodsDGoods.Value, 'GTitle; GArticul; GLength; GWidth; GColor; GParish; GLeaving; GImageCode; GForm; GImage; GPrice; GTypePayment; GYearOutput; GMadeIn; GType; GInfo');
                        if VarType(tmpRec) = varNull then
                          Abort;
                        Append;                                                                                           { TODO 5 : ОБЯЗАТЕЛЬНО проверить GPrice }
                        tbGoods['GTitle; GArticul; GLength; GWidth; GColor; GParish; GLeaving; GImageCode; GForm; GImage; GPrice; GTypePayment; GYearOutput; GMadeIn; GType; GInfo'] := tmpRec;
                        intgrfldGoodsGCount.Value := TrackCount;
                        Post;
                      end;

                    tmpRec := tbDetailGoods['DAddrPartner; DPriceCoeff; DTemp'];
                    with tbDetailGoods do
                      begin
                        Append;
                        tbDetailGoods['DAddrPartner; DPriceCoeff; DTemp'] := tmpRec;
                        intgrfldDetailGoodsDGoods.Value := atncfldGoodsGoodsID.Value;
                        intgrfldDetailGoodsDCount.Value := TrackCount;
                        Post;
                      end;  

                    //quQuery('UPDATE DetailGoods SET DCount = DCount + ' + IntToStr(iCount) + ' WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID));
                    // GOODS
                    //quQuery('UPDATE GOODS SET GCount = GCount + '  + IntToStr(iCount) + ' WHERE GoodsID = ' + VarToStr(quQuery('SELECT DGoods FROM DetailGoods WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID))));

                    SumIn := SumIn + quQuery('SELECT DPriceCoeff FROM DetailGoods WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID));
                  end;
              else
                // MOVE
                quQuery('INSERT INTO MOVE (MGoods, MCount, MPrice, MToPayment, MChequeID) VALUES (' +
                  IntToStr(DetailGoodsID) + ', ' + IntToStr(iCount) + ', ' +
                    FloatToStrP(oldCurr) + ', ' + FloatToStrP(Round(newCurr / iCount)) + ', ' + atncfldChequeChequeID.AsString + ')');
                // DetailGoods
                quQuery('UPDATE DetailGoods SET DCount = DCount + ' + IntToStr(iCount) + ' WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID));
                // GOODS
                quQuery('UPDATE GOODS SET GCount = GCount + '  + IntToStr(iCount) + ' WHERE GoodsID = ' + VarToStr(quQuery('SELECT DGoods FROM DetailGoods WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID))));
                SumIn := SumIn + quQuery('SELECT DPriceCoeff FROM DetailGoods WHERE DetailGoodsID = ' + IntToStr(DetailGoodsID));
              end;
            end;
        end;

//        s1 := txtSqTrack.Caption;
//
//        if Pos('.', s1) > 0then
//          s1[Pos('.', s1)] := DecimalSeparator;
//        txtSqTrack.Caption := s1;

        MrEnterGoods(dtpRetSale.Date, '=', StrToCurr(edtRetSum.Text), ValGoods, StrToInt(txtCarpet.Caption),
          StrToInt(txtElse.Caption), StrToInt(txtMetal.Caption), StrToInt(txtPicture.Caption), StrToInt(txtTrack.Caption),
            StrToFloat(txtSqTrack.Caption));
      end;

    if not TESTALL(s1, s2) then
      Abort;
    fmCheque.stat1.Panels[0].Text := s1;
    fmCheque.stat1.Panels[1].Text := s2;
    DB.Commit;
  except
    DB.Rollback;
    tbCheque.Locate('ChequeID', ID_OLD_CHEQUE, []);
    tbCheque.Refresh;
  end;
  ModalResult := 1;
end;

end.
