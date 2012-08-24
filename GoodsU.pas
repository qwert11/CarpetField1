unit GoodsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons,
  CheckLst, AppEvnts, ComCtrls, DBCtrls, Mask, AutoBot1U, ActnList, Menus;

const
  hArticul = 0;
  hTitle = 1;
  hCount = 2;
  hPrice = 3;
  hCoeff = 4;
  hToPayment = 5;
  hDetGoodsID = 6;
  hPriceUnit = 7;
  hMaxCount = 8;
  hTypeGoods = 9;
  hWidth = 10;
  hLength = 11;
  hTitle2 = 12;

  { DONE 4 -ostrngrdDetailGoods -cTRACK : для дорожек нужна запись Длины }

type
  TDBGrid = class(DBGrids.TDBGrid)
  protected
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
  end;

  TPanelToPay = class(ExtCtrls.TPanel)
  private
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  end;

  //TTypeMove = (mOrder, mSale);
  { TODO -cMOVE (товара) : Почему не отображаетcя цена м.кв.  для РАЗНОГО }
  TfmGoods = class(TForm)
    dbgrdDetGoods: TDBGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    strngrdFromDetGoods: TStringGrid;
    btnOk: TBitBtn;
    btn2: TBitBtn;
    edtFindName: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    txtCount: TStaticText;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl3: TPanel;
    aplctnvnts1: TApplicationEvents;
    tbcFilter: TTabControl;
    qryGoods: TQuery;
    ds1: TDataSource;
    intgrfldGoodsDCount: TIntegerField;
    crncyfldGoodsDPriceCoeff: TCurrencyField;
    strngfldGoodsTGoods: TStringField;
    strngfldGoodsGTitle: TStringField;
    strngfldGoodsGArticul: TStringField;
    intgrfldGoodsGLength: TIntegerField;
    intgrfldGoodsGWidth: TIntegerField;
    strngfldGoodsACity: TStringField;
    strngfldGoodsAStreet: TStringField;
    strngfldGoodsProducerGoods: TStringField;
    crncyfldGoodsPrSquare: TCurrencyField;
    intgrfldGoodsDetailGoodsID: TIntegerField;
    intgrfldGoodsAddressPartnerID: TIntegerField;
    lbl5: TLabel;
    stat1: TStatusBar;
    pnlPartner: TPanel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dblkcbbPartner: TDBLookupComboBox;
    dblkcbbRespPartner: TDBLookupComboBox;
    dblkcbbRespAddrPartner: TDBLookupComboBox;
    dblkcbbResponsible: TDBLookupComboBox;
    lbl9: TLabel;
    txtPrice: TStaticText;
    txtCarped: TStaticText;
    txtElse: TStaticText;
    txtMetal: TStaticText;
    txtTrack: TStaticText;
    txtPic: TStaticText;
    intgrfldGoodsGType: TIntegerField;
    lbl10: TLabel;
    txtSumToPay: TStaticText;
    pnlToPay: TPanel;
    lbl11: TLabel;
    dtpDate: TDateTimePicker;
    lbl12: TLabel;
    edtPayed: TEdit;
    pnlRemPayment: TPanel;
    txtSqTrack: TStaticText;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    mniAddgoods: TMenuItem;
    actlst1: TActionList;
    actAddGoods: TAction;
    mniAddgoods1: TMenuItem;
    btnAddRespPartner: TSpeedButton;
    btn3: TSpeedButton;
    btnAddPartner: TSpeedButton;
    actAddPartner: TAction;
    actAddRespPartner: TAction;
    lbl13: TLabel;
    strngfldGoodsGInfo: TStringField;
    lblCoeff: TLabel;
    intgrfldGoodsSelectCount: TIntegerField;
    actSelectAll: TAction;
    mniSelectAll1: TMenuItem;
    strngfldGoodsGColor: TStringField;
    strngfldGoodsGImageCode: TStringField;
    strngfldGoodsGFirm: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbgrdDetGoodsCellClick(Column: TColumn);
    procedure aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
    procedure tbcFilterChange(Sender: TObject);
    procedure strngfldGoodsGTitleGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryGoodsCalcFields(DataSet: TDataSet);
    procedure intgrfldGoodsDCountGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure crncyfldGoodsDPriceCoeffGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure strngrdFromDetGoodsGetEditMask(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure strngrdFromDetGoodsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure strngrdFromDetGoodsSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure strngrdFromDetGoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function calc_discount(sPrice, sToPayment: string): string;
    procedure strngrdFromDetGoodsSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure edtFindNameChange(Sender: TObject);
    procedure txtSumToPayClick(Sender: TObject);
    procedure txtSumToPayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dtpDateChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure edtPayedKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdDetGoodsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdDetGoodsKeyPress(Sender: TObject; var Key: Char);
    procedure edtFindNameClick(Sender: TObject);
    procedure intgrfldGoodsSelectCountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure strngrdFromDetGoodsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSelectAllExecute(Sender: TObject);
  private
    { Private declarations }
    procedure WMMove(Var MSG : TWMMove); message WM_Move;
    procedure SumToPay_TO_Payed;
  public
    { Public declarations }
    constructor Create(TypeCheque: TTypeCheque; Sender: TObject); reintroduce; 
  end;

var
  fmGoods: TfmGoods;
  ifClickShift,
  ifClickCtrl: Boolean;
  TypeCheque: TTypeCheque;
  ifFcsTxtToPay: Boolean;

implementation

uses dmCheque, ForRunOrderU, CarpetFieldU;

{$R *.dfm}

procedure TfmGoods.FormShow(Sender: TObject);
  procedure PickListAdd(List: TStrings; Table: TTable; const FieldName: string);
  begin
    with DM, Table do
      begin
        First;
        while not Eof do
        begin
          List.Add(Table.FieldByName(FieldName).AsString);
          Next;
        end;
      end;
  end;
var
  Auto: TAutoBot1;
  MaxDate: TDate;
  vResult: Variant;
begin
  Auto := TAutoBot1.Create;
  qryGoods.Open;
  with strngrdFromDetGoods, dbgrdDetGoods.Columns do
  begin
    ColCount := 12;
    Cells[hArticul, 0] := 'Артикул';
    Cells[hTitle, 0] := 'Название товара';
    Cells[hCount, 0] := 'Кол. ед.';
    Cells[hPrice, 0] := 'Цена грн.';
    Cells[hCoeff, 0] := 'Коэф. %';
    Cells[hToPayment, 0] := 'К оплате грн.';
    Cells[hDetGoodsID, 0] := 'IDDetGoods';
    Cells[hPriceUnit, 0] := 'hPriceUnit';
    Cells[hMaxCount, 0] := 'hMaxCount';
    Cells[hTypeGoods, 0] := 'hTypeGoods';
    Cells[hWidth, 0] := 'hWidth';
    Cells[hLength, 0] := 'hLength';
    Cells[hTitle2, 0] := 'hTitle2';
    ColWidths[hMaxCount] := 0;
    ColWidths[hDetGoodsID] := 0;
    ColWidths[hPriceUnit] := 0;
    ColWidths[hTypeGoods] := 0;
    ColWidths[hWidth] := 0;
    ColWidths[hLength] := 0;
  end;

  try

    // если в отчете последнее число меньше сегодняшнего на IntervalSale
    // то ставим ответственного, который был последним
    //MaxDate := quQuery('SELECT MAX(CDate) FROM CHEQUE WHERE CAddress =  ' + IntToStr(Auto.Address));
    MaxDate := LastDate;
    with DM, tbCheque do
      begin
        if MaxDate <> Date then
          begin
            if MaxDate + IntervalSale < Date then
              begin
                dtfldChequeCDate.Value := MaxDate;
                //ShowMessage(DateToStr(MaxDate) + ' ' + IntToStr());
                if tbGraphWork.Locate('GWDate; GWAddress', VarArrayOf(
                    [MaxDate, Address]), []) then
                  intgrfldChequeCResponsible.Value := intgrfldGraphWorkGWResp.Value
                else
                  begin
                    MessageDlg('Не найдена последняя дата табл. чек в т. GraphicWork', mtError, [mbOk], 0);
                    Abort;
                  end;

                  //intgrfldChequeCResponsible.Value := Auto.Responsible;
              end
            else
              begin
                dtfldChequeCDate.Value := Date;
                intgrfldChequeCResponsible.Value := DefRespons;
              end;
          end
        else
          begin
            if Date < MaxDate then
              dtfldChequeCDate.Value := MaxDate
            else
              dtfldChequeCDate.Value := Date;
            intgrfldChequeCResponsible.Value := DefRespons;
          end;

        dtfldChequeCRetDate.Value := dtfldChequeCDate.Value + Auto.RetPeriod;
        //
        dtpDate.Date := dtfldChequeCDate.Value;
        //

        case TypeCheque of
          chSale:
            begin
              //pnlRemPayment.Visible := False;
              Caption := 'Продажа товара. ' + Caption;
              intgrfldChequeCPartner.Value := Auto.Partner;
            end;
          chOrder:
            begin
              pnlPartner.Visible := True;
              Caption := 'Заказ товара. ' + Caption;
              intgrfldChequeCPartner.Value := Auto.Partner;
            end;
          chInternalMov:
            begin
              pnlPartner.Visible := True;
              pnl3.Height := 23;
              Caption := 'Внутреннее перемещение товара. ' + Caption;
              intgrfldChequeCPartner.Value := cPartnerWe;
            end;
          chRunOrder:
            begin
              pnlPartner.Visible := True;
              fmForRunOrder := TfmForRunOrder.Create(Self);
              fmForRunOrder.Show;
              Top := fmForRunOrder.Height;
              //CarpetFieldU.idOrder
              // pnl3.Height := 23;
              Caption := 'Выполнить заказ. ' + Caption;
              intgrfldChequeCPartner.Value := Auto.Partner;
              vResult := quQuery('SELECT CPartner, CRespPartner FROM CHEQUE WHERE ChequeID = ' + IntToStr(idOrder));
              if VarIsArray(vResult) then
                begin
                  intgrfldChequeCPartner.Value := vResult[1];
                  intgrfldChequeCRespPartner.Value := vResult[2];
                  edtPayed.Text := fmForRunOrder.lRemSumm.Caption;
                end;
            end;
          chSalePeresorting:
            begin
              pnlRemPayment.Visible := False;
              Caption := 'Продажа с пересортингом ' + Caption;
              intgrfldChequeCPartner.Value := Auto.Partner;
            end;
        else
          ShowMessage('Данный тип чека отсутствует');
        end;
        intgrfldChequeCAddress.Value := Auto.Address;
        intgrfldChequeCRespPartner.Value := Auto.RespPartner;
        intgrfldChequeCAddrPartner.Value := Auto.Address;
        intgrfldChequeCRespTransact.Value := Auto.RespTransact;
      end;
    ////////
    Application.OnIdle := aplctnvnts1Idle;
    tbcFilterChange(Sender);
  finally
    Auto.Free;
  end;
end;

{ TDBGrid }

procedure TDBGrid.WMLButtonDown(var Msg: TWMLButtonDown);
begin
  ifClickShift := False;
  ifClickCtrl := False;
  case Msg.Keys of
    5: ifClickShift := True;  // shift
    9: ifClickCtrl := True;   // ctrl
  end;
  inherited
end;

type
  THackStringGrid = class(TStringGrid)
  end;

procedure TfmGoods.dbgrdDetGoodsCellClick(Column: TColumn);
  // возвращает № рядка в StrnGrid или -1 
  function sgFindField(ID: string): Integer;
  var
    i: Integer;
  begin
    Result := - 1;
    with strngrdFromDetGoods do
      for i := 0 to RowCount - 1 do
        if Cells[hDetGoodsID, i] = ID then
        begin
          Result := i;
          Exit;
        end;
  end;

  function Summ(ID: string; h: Integer = hCount): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    with strngrdFromDetGoods do
      for i := 0 to RowCount - 1 do
        if Cells[hDetGoodsID, i] = ID then
          Result := Result + StrToInt(Cells[h, i]);
  end;

var
  rPos,
  i,
  RemTrack: Integer;
  sLTrack: string;
  LTrack,
  r: Real;
begin
  LTrack := 0;
  sLTrack := '';
  // добавить товар
  if ifClickShift then
    with strngrdFromDetGoods, qryGoods do
    begin
      // дорожки считаем по др.
      case cTypeGoods(FieldByName('GType').AsInteger) of
        tTrack:
          begin
            RemTrack := FieldByName('DCount').Value -
              Summ(FieldByName('DetailGoodsID').AsString, hLength);
            case TypeCheque of
              chOrder, chSalePeresorting:
                repeat
                  sLTrack := '';
                  if not InputQuery('Размер дорожки', 'введите длину (м)', sLTrack) then
                    Exit;
                until ifHardStrToFloat(sLTrack, LTrack);
              chSale, chInternalMov, chRunOrder:
                  if RemTrack <= 0 then Exit else
                  repeat
                    if ifHardStrToFloat(sLTrack, LTrack) and
                        (LTrack * 1000 > RemTrack) then
                      sLTrack := FloatToStr(RemTrack / 1000)
                    else
                      sLTrack := '';
                    if not InputQuery('Размер дорожки', 'длина не должна превышать ' +
                        MmToMetre(IntToStr(RemTrack)) + ' м', sLTrack) then
                      Exit;
                    ifHardStrToFloat(sLTrack, LTrack);
                    r := 1000 * LTrack;
                    // только так работает 17.55 * 1000 <> 17550 ?????????
                  until ifHardStrToFloat(sLTrack, LTrack) and (RemTrack >= r);

            else
              ShowMessage('Отсутствует бизнес правило');
              Exit;
            end;
          end;
      else
        begin
          case TypeCheque of
            chOrder, chSalePeresorting: ;
          else
            if Summ(FieldByName('DetailGoodsID').AsString) >=
                FieldByName('DCount').Value then
              Exit;
          end;

          // ищем добавляемый товар в УЖЕ добавленном
          rPos := sgFindField(FieldByName('DetailGoodsID').AsString);
          if rPos <> - 1 then
            begin
              Cells[hCount, rPos] := IntToStr(StrToInt(Cells[hCount, rPos]) + 1);
              Cells[hPrice, rPos] := CurrToStr(FieldByName('DPriceCoeff').Value *
                StrToInt(Cells[hCount, rPos]));
              Cells[hToPayment, rPos] := CurrToStr(FieldByName('DPriceCoeff').Value *
                StrToInt(Cells[hCount, rPos]) *
                  (100 - StrToFloat(Cells[hCoeff, rPos])) / 100);
              Exit;
            end;
        end;
      end;


      Cells[hArticul, RowCount - 1] := FieldByName('GArticul').AsString;
      Cells[hCount, RowCount - 1] := IntToStr(1);
      Cells[hCoeff, RowCount - 1] := IntToStr(0);
      case cTypeGoods(FieldByName('GType').AsInteger) of
        tTrack:
          begin
            Cells[hTitle, RowCount - 1] := FieldByName('GTitle').AsString + ' / ' +
                MmToMetre(intgrfldGoodsGWidth.AsString) + ' * ' +
                sLTrack + ' [' +
                strngfldGoodsProducerGoods.Value + '](' + strngfldGoodsTGoods.Value + ')' + strngfldGoodsGInfo.AsString;
            Cells[hTitle2, RowCount - 1] := FieldByName('GTitle').AsString;
            Cells[hPrice, RowCount - 1] := CurrToStr(
                FieldByName('DPriceCoeff').Value * LTrack * 1000);
            Cells[hWidth, RowCount - 1] := intgrfldGoodsGWidth.AsString;
            Cells[hToPayment, RowCount - 1] := CurrToStr(
              FieldByName('DPriceCoeff').Value * 1000 * LTrack *
                (100 - StrToFloat(Cells[hCoeff, RowCount - 1])) / 100);
            { DONE 5 -oTRUNC -cbagz  : LTrack умножить на 1000 для trunc }
            LTrack := LTrack * 1000;
            Cells[hLength, RowCount - 1] := IntToStr(Trunc(LTrack));
          end;
      else
        Cells[hTitle, RowCount - 1] := FieldByName('GTitle').AsString + ' / ' +
            MmToMetre(intgrfldGoodsGWidth.AsString) + ' * ' +
            MmToMetre(intgrfldGoodsGLength.AsString) + ' (' +
            strngfldGoodsGImageCode.Value + ' # ' +
            strngfldGoodsGColor.Value + ' )[' +
            strngfldGoodsGFirm.Value + '] '+ strngfldGoodsGInfo.AsString;
        Cells[hPrice, RowCount - 1] := FieldByName('DPriceCoeff').AsString;
        Cells[hToPayment, RowCount - 1] := CurrToStr(
          FieldByName('DPriceCoeff').Value *
            (100 - StrToFloat(Cells[hCoeff, RowCount - 1])) / 100);
      end;

      Cells[hPriceUnit, RowCount - 1] := FieldByName('DPriceCoeff').AsString;
      Cells[hMaxCount, RowCount - 1] := FieldByName('DCount').AsString;
      Cells[hDetGoodsID, RowCount - 1] := FieldByName('DetailGoodsID').AsString;
      Cells[hTypeGoods, RowCount - 1] := FieldByName('GType').AsString;
      RowCount := RowCount + 1;

      SumToPay_TO_Payed;
    end;

  // отнять товар  
  if ifClickCtrl then
    with strngrdFromDetGoods, qryGoods do
    begin
      rPos := sgFindField(FieldByName('DetailGoodsID').AsString);
      if rPos <> - 1 then
        begin

          // дорожки считаем по др.
          if cTypeGoods(FieldByName('GType').AsInteger) = tTrack then
            Exit;

          if Summ(FieldByName('DetailGoodsID').AsString) > 0 then
            begin
              Cells[hCount, rPos] := IntToStr(StrToInt(Cells[hCount, rPos]) - 1);
              Cells[hPrice, rPos] := CurrToStr(FieldByName('DPriceCoeff').Value *
                StrToInt(Cells[hCount, rPos]));
              Cells[hToPayment, rPos] := CurrToStr(
                FieldByName('DPriceCoeff').Value * StrToInt(Cells[hCount, rPos])*
                  (100 - StrToFloat(Cells[hCoeff, rPos])) / 100);
            end;

          if Summ(FieldByName('DetailGoodsID').AsString) = 0 then
            begin
              for i := 0 to ColCount - 1 do
                Cells[i, rPos] := '';
              THackStringGrid(strngrdFromDetGoods).DeleteRow(rPos);
            end;
          if Summ(FieldByName('DetailGoodsID').AsString) < 0 then
            MessageDlg('Сумма не должна быть меньше', mtError, [mbOK], 0);
        end;

      SumToPay_TO_Payed;
    end;
  dbgrdDetGoods.Refresh;

end;

{ TODO 4 -oMOVE GOODS -cINS_BEFO_DATE : УЗНАТЬ цену товара на конкретную дату}
procedure TfmGoods.aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
var
  i,
  sCarped,
  sElse,
  sMetal,
  sTrack,
  sPicture,
  count: Integer;
  sumToPay,
  sPrice,
  ToPayment: Currency;
  info: string;
  sSqTrack: Real;
  Correct: Boolean;
begin
  //Exit;
  info := '';
  sumToPay := 0;
  count := 0;
  sPrice := 0;
  sCarped := 0;
  sElse := 0;
  sMetal := 0;
  sTrack := 0;
  sPicture := 0;
  sSqTrack := 0;
  Correct := True;
  i := 1;
  if not ifFcsTxtToPay then
    txtSumToPay.BorderStyle := sbsNone;
  ifFcsTxtToPay := False;
  if strngrdFromDetGoods.RowCount < 3 then
    stat1.Panels.Items[1].Text := '';
  with strngrdFromDetGoods do
  begin
    //if Pos(',', edtPayed.Text) > 0 then

    if not ifHardStrToFloat(edtPayed.Text) then
      Correct := False;
    if Correct then
      for i := 1 to RowCount - 2 do
        if (Cells[hCount, i] <> '') and
            ifStrToCurr(Cells[hToPayment, i], ToPayment) then
          begin
            sumToPay := sumToPay + ToPayment;
            count := count + StrToInt(Cells[hCount, i]);
            sPrice := sPrice + StrToCurr(Cells[hPrice, i]);
            case cTypeGoods(StrToInt(Cells[hTypeGoods, i])) of
              tCarpet: sCarped := sCarped + StrToInt(Cells[hCount, i]);
              tElse: sElse := sElse + StrToInt(Cells[hCount, i]);
              { DONE 3 -oЯ  -caplctvnts1Idle : sTrack и sSqTrack }
              tTrack:
                begin
                  Inc(sTrack);
                  sSqTrack := sSqTrack + StrToInt(Cells[hWidth, i]) *
                    StrToInt(Cells[hLength, i]) / 1000000
                end;
              tPicture: sPicture := sPicture + StrToInt(Cells[hCount, i]);
              tMetal: sMetal := sMetal + StrToInt(Cells[hCount, i]);
            end;
          end
        else
          begin
            Correct := False;
            Break;
          end;
    if not Correct then
      begin
        txtPrice.Caption := 'Error';
        txtSumToPay.Caption := 'Error';
        txtCount.Caption := 'Error';
        txtCarped.Caption := 'Error';
        txtElse.Caption := 'Error';
        txtMetal.Caption := 'Error';
        txtTrack.Caption := 'Error';
        txtPic.Caption := 'Error';
        txtSqTrack.Caption := 'Error';
        lblCoeff.Caption := 'Error';
        stat1.Panels.Items[0].Text := 'Error';
        Beep;
        Sleep(1000);
        stat1.Panels.Items[0].Text := '';
        THackStringGrid(strngrdFromDetGoods).FocusCell(hToPayment, i, True);
        Exit;
      end;  
  end;

  txtCarped.Caption := IntToStr(sCarped);
  txtElse.Caption := IntToStr(sElse);
  txtMetal.Caption := IntToStr(sMetal);
  txtTrack.Caption := IntToStr(sTrack);
  txtSqTrack.Caption := FloatToStr(sSqTrack);
  txtPic.Caption := IntToStr(sPicture);
  txtCount.Caption := IntToStr(count);

  case TypeCheque of
    chInternalMov:
      begin
        txtSumToPay.Caption := CurrToStr(0);
        edtPayed.Text := CurrToStr(0);
      end;
    chRunOrder, chOrder:
      txtSumToPay.Caption := CurrToStr(sumToPay);
  else
    txtSumToPay.Caption := CurrToStr(sumToPay);
    //edtPayed.Text := txtSumToPay.Caption;
  end;

  txtPrice.Caption := CurrToStr(sPrice);

  if Abs(PersOldNew(StrToCurr(txtPrice.Caption), sumToPay)) > 3 then
    begin
      if lblCoeff.Color <> clRed then
        lblCoeff.Color := clRed
    end
  else
    if lblCoeff.Color <> clBtnFace then
      lblCoeff.Color := clBtnFace;
  lblCoeff.Caption := Format('Скидка %2.1n', [PersOldNew(StrToCurr(txtPrice.Caption), sumToPay)]) + '% ' + FormatCurr('  # ##0.00гр', StrToCurr(txtPrice.Caption) - sumToPay);

  if strngrdFromDetGoods.RowCount < 3 then
    Exit;

  info := '';
  if sCarped > 0 then
    info := info + 'Ковров: ' + txtCarped.Caption + ' ед.;  ';
  if sElse > 0 then
    info := info + 'Разного: ' + txtElse.Caption + ' ед.;  ';
  if sMetal > 0 then
    info := info + 'Металла: ' + txtMetal.Caption + ' ед.;  ';
  if sTrack > 0 then
    info := info + 'Дорожек: ' + txtTrack.Caption + ' ед.';
  if sSqTrack > 0 then
    info := info + ', ' + txtSqTrack.Caption + ' м.кв.;  ';
  if sPicture > 0 then
    info := info + 'Картин: ' + txtPic.Caption + ' ед.;  ';

  if strngrdFromDetGoods.RowCount > 2 then
    case TypeCheque of
      chOrder, chRunOrder:
        if not ifHardStrToFloat(edtPayed.Text) then
          begin
            edtPayed.SetFocus;
            edtPayed.SelectAll;
            Beep;
            Exit;
          end;
    end;

  stat1.Panels.Items[0].Text := 'Всего ' + txtCount.Caption + ' ед. товара на сумму ' + txtSumToPay.Caption + ' грн.';
  stat1.Panels.Items[1].Text := info;       // если все НОРМАЛЬНО
end;

procedure TfmGoods.tbcFilterChange(Sender: TObject);
begin
  with qryGoods do
  if tbcFilter.Tabs[tbcFilter.TabIndex] = 'все' then
    case TypeCheque of
      chSale, chInternalMov, chRunOrder:
        Filter := 'AddressPartnerID = ' + IntToStr(Address) +
          ' AND DCount <> 0';
      chOrder:
        Filter := 'AddressPartnerID = ' + IntToStr(Address);
      chSalePeresorting:
        Filter := 'AddressPartnerID = ' + IntToStr(Address) +
          ' AND DCount < 1';
    else
      ShowMessage('Отсутствует бизнес правило');
    end
  else
    case TypeCheque of
      chSale, chInternalMov, chRunOrder:
        Filter := 'AddressPartnerID = ' + IntToStr(Address) +
          ' AND DCount <> 0 AND TGoods = ''' + tbcFilter.Tabs[tbcFilter.TabIndex] + '''';
      chOrder:
        Filter := 'AddressPartnerID = ' + IntToStr(Address) +
          ' AND TGoods = ''' + tbcFilter.Tabs[tbcFilter.TabIndex] + '''';
      chSalePeresorting:
        Filter := 'AddressPartnerID = ' + IntToStr(Address) +
          ' AND DCount < 1 AND TGoods = ''' + tbcFilter.Tabs[tbcFilter.TabIndex] + '''';
    else
      ShowMessage('Отсутствует бизнес правило');
    end;
  qryGoods.Filtered := True;
  edtFindName.SetFocus;
  edtFindName.SelectAll
end;

procedure TfmGoods.strngfldGoodsGTitleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldGoodsGTitle.Value + ' / ' +
      MmToMetre(intgrfldGoodsGWidth.AsString) + ' * ' +
      MmToMetre(intgrfldGoodsGLength.AsString) + ' (' +
      strngfldGoodsGImageCode.Value + ' # ' +
      strngfldGoodsGColor.Value + ') [' +
      strngfldGoodsGFirm.Value + ']' + strngfldGoodsGInfo.Value;
end;

procedure TfmGoods.qryGoodsCalcFields(DataSet: TDataSet);
begin
  if strngfldGoodsTGoods.AsString = 'Ковры' then
        crncyfldGoodsPrSquare.Value := crncyfldGoodsDPriceCoeff.Value * 1000000 /
      intgrfldGoodsGWidth.Value / intgrfldGoodsGLength.Value else
  if strngfldGoodsTGoods.AsString = 'Дорожки' then
        crncyfldGoodsPrSquare.Value := crncyfldGoodsDPriceCoeff.Value * 1000000 /
      intgrfldGoodsGWidth.Value
end;

procedure TfmGoods.intgrfldGoodsDCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if strngfldGoodsTGoods.AsString = 'Дорожки' then
    Text := MmToMetre(intgrfldGoodsDCount.AsString) + 'м'
  else
    Text := intgrfldGoodsDCount.AsString
end;

procedure TfmGoods.crncyfldGoodsDPriceCoeffGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if strngfldGoodsTGoods.AsString = 'Дорожки' then
    Text := CurrToStr(crncyfldGoodsDPriceCoeff.Value * 1000) + 'гр.мп'
  else
    Text := crncyfldGoodsDPriceCoeff.AsString + 'гр';
end;

procedure TfmGoods.strngrdFromDetGoodsGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
//  if ACol = hToPayment then
//    Value :=  '0000000000';
//  if ACol = hCount then
//    Value :=  '000'
end;

{ TStringGrid }


procedure TfmGoods.strngrdFromDetGoodsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then
    with (Sender as TStringGrid) do
    begin
      // провер.вых. за поля
      if (Row = RowCount - 1) or (Row = 0) then
        Exit;

      // дорожки добавляем по др.
      if cTypeGoods(StrToInt(Cells[hTypeGoods, Row])) = tTrack then
        Exit;

      if StrToInt(Cells[hCount, Row]) <= 1 then
        Exit;
      Cells[hCount, Row] := IntToStr(StrToInt(Cells[hCount, Row]) - 1);
      Cells[hPrice, Row] := CurrToStr(StrToCurr(Cells[hPriceUnit, Row]) *
        StrToInt(Cells[hCount, Row]));
      Cells[hToPayment, Row] := CurrToStr(StrToCurr(Cells[hPriceUnit, Row]) *
        StrToInt(Cells[hCount, Row]) *
          (100 - StrToFloat(Cells[hCoeff, Row])) / 100);
      SumToPay_TO_Payed;
    end else
  if ssShift in Shift then
    with (Sender as TStringGrid) do
    begin
      // провер.вых. за поля
      if (Row = RowCount - 1) or (Row = 0) then
        Exit;

      // дорожки добавляем по др.
      if cTypeGoods(StrToInt(Cells[hTypeGoods, Row])) = tTrack then
        Exit;

      case TypeCheque of
        chOrder, chSalePeresorting: ;
      else
        if StrToInt(Cells[hCount, Row]) >= StrToInt(Cells[hMaxCount, Row]) then
          Exit;
      end;

      Cells[hCount, Row] := IntToStr(StrToInt(Cells[hCount, Row]) + 1);
      Cells[hPrice, Row] := CurrToStr(StrToCurr(Cells[hPriceUnit, Row]) *
        StrToInt(Cells[hCount, Row]));
      Cells[hToPayment, Row] := CurrToStr(StrToCurr(Cells[hPriceUnit, Row]) *
        StrToInt(Cells[hCount, Row]) *
          (100 - StrToFloat(Cells[hCoeff, Row])) / 100);
      SumToPay_TO_Payed;
      Exit;
    end;
end;

procedure TfmGoods.strngrdFromDetGoodsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  with (Sender as TStringGrid) do
  if ACol = hToPayment then
    Options := Options + [goEditing]
  else
    Options := Options - [goEditing]
end;

procedure TfmGoods.strngrdFromDetGoodsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i,
  rtmp: Integer;
begin
  if Key = VK_DELETE then
    with (Sender as TStringGrid) do
    begin
      if Row = RowCount - 1 then
        Exit;
      rtmp := Row;
      for i := 0 to ColCount - 1 do
        Cells[i, Row] := '';
      THackStringGrid(strngrdFromDetGoods).DeleteRow(Row);
      if rtmp = RowCount - 1 then
        Row := rtmp - 1
      else
        Row := rtmp;
      dbgrdDetGoods.Refresh
    end;
end;

function TfmGoods.calc_discount(sPrice, sToPayment: string): string;
var
  Price,
  toPayment: Currency;
begin
  Result := 'Error';
  if ifStrToCurr(sPrice, Price) and ifStrToCurr(sToPayment, toPayment)
      then
    Result := CurrToStr((Price - ToPayment) * 100 / Price);
end;

procedure TfmGoods.strngrdFromDetGoodsSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  with (Sender as TStringGrid) do
  case ACol of
    hToPayment:
      begin
        try
          Cells[hCoeff, ARow] :=
            calc_discount(Cells[hPrice, ARow], Value);

        except
          stat1.Panels.Items[0].Text := 'Error';
          Beep;
          Sleep(500);
          stat1.Panels.Items[0].Text := '';
        end;
      end;
  end;
end;

constructor TfmGoods.Create(TypeCheque: TTypeCheque; Sender: TObject);
begin
  inherited Create(Sender as TComponent);
  GoodsU.TypeCheque := TypeCheque;
end;

procedure TfmGoods.edtFindNameChange(Sender: TObject);
begin
  qryGoods.Locate('GTitle', edtFindName.Text, [loCaseInsensitive, loPartialKey])
end;

procedure TfmGoods.txtSumToPayClick(Sender: TObject);
type
  toPlace = record
    positionInCheque: Integer;
    Weight,
    //relativeWeight: Real;
    price,
    newPrice: Currency;
  end;

  procedure PlacePrice(const sumMoney: Currency);
    procedure SortOnWeight(var mPlace: array of toPlace);
    var
      tmpPlace: toPlace;
      i,
      ii: Integer;
    begin
      if Length(mPlace) < 2 then
        Exit;
      for i := 0 to Length(mPlace) - 2 do
        for ii := i + 1 to Length(mPlace) - 1 do
          if mPlace[i].Weight < mPlace[ii].Weight then
            begin
              //ShowMessage(IntToStr(ii));
              tmpPlace := mPlace[ii];
              mPlace[ii] := mPlace[i];
              mPlace[i] := tmpPlace;
            end;
    end;
    procedure StandartPlacePrice(coeff: Real; var mPlace: array of toPlace);
    var
      i: Integer;
    begin
      for i := 0 to Length(mPlace) - 1 do
        mPlace[i].newPrice := mPlace[i].price * coeff;
    end;

    function DeltaNewPrice(var mPlace: array of toPlace): Real;
    var
      i: Integer;
      sum: Currency;
    begin
      sum := 0;
      for i:= 0 to Length(mPlace) - 1 do
        sum := sum + mPlace[i].newPrice;
      Result := sum - sumMoney;
    end;

    procedure RoundPrice(var mPlace: array of toPlace);
      function SumRoundPlase(): Currency;
      var
        i: Integer;
      begin
        Result := 0;
        for i := 0 to Length(mPlace) - 1 do
          Result := Result + mPlace[i].newPrice;
      end;
    var
      i: Integer;
    begin
      if (Abs(DeltaNewPrice(mPlace)) > Length(mPlace)) or
          (StrToCurr(txtPrice.Caption) < 100) then
        Exit;

      for i := 0 to Length(mPlace) - 1 do
        mPlace[i].newPrice := Round(mPlace[i].newPrice);

      if sumMoney > SumRoundPlase() then
        for i := 0 to Length(mPlace) - 1 do
          begin
            mPlace[i].newPrice := mPlace[i].newPrice + 1;
            if SumRoundPlase >= sumMoney then
              Break;
          end else
      if sumMoney < SumRoundPlase() then
        for i := 0 to Length(mPlace) - 1 do
          begin
            mPlace[i].newPrice := mPlace[i].newPrice - 1;
            if SumRoundPlase <= sumMoney then
              Break;
          end;
    end;
  var
    mPlace: array of toPlace;
    i,
    count: Integer;
    coeff,
//     SummCoeff_Weight: Real;
    SumOnPrice: Currency;
  begin
    SumOnPrice := StrToCurr(txtPrice.Caption);
    coeff := sumMoney  / SumOnPrice;
    SetLength(mPlace, strngrdFromDetGoods.RowCount - 2);
    count := strngrdFromDetGoods.RowCount - 2;
    for i := 1 to count do
      begin
        mPlace[i - 1].Weight := StrToCurr(strngrdFromDetGoods.Cells[hPrice, i]) *
          100 / SumOnPrice;
        mPlace[i - 1].positionInCheque := i;
        mPlace[i - 1].price := StrToCurr(strngrdFromDetGoods.Cells[hPrice, i]);
//        mPlace[i - 1].relativeWeight := (mPlace[i - 1].price -
//          SumOnPrice / count) * 100 / SumOnPrice;
        mPlace[i - 1].newPrice := 0;
      end;

    SortOnWeight(mPlace);
    { убираем расстановку цен по весу
    **********************************
    // подсчет кол-ва весомых и их общий вес
    SummCoeff_Weight := 0;
    count := 0;
    for i := 0 to Length(mPlace) - 1 do
      if mPlace[i].Weight < 20 then
        Break
      else
        begin
          SummCoeff_Weight := SummCoeff_Weight + mPlace[i].Weight;
          Inc(count);
        end;
    // новые цены только на дорогой товар
    if SummCoeff_Weight >= 20 then
      begin
        for i := 0 to count - 1 do
          mPlace[i].newPrice := (mPlace[i].price * coeff) - (1 - coeff) *
            SumOnPrice * (100 - SummCoeff_Weight) * mPlace[i].Weight /
              SummCoeff_Weight / 100;
        for i := count to Length(mPlace) - 1 do
          mPlace[i].newPrice := mPlace[i].price;
      end;

    if Abs(DeltaNewPrice(mPlace)) > Length(mPlace) then}
    StandartPlacePrice(coeff, mPlace);
    RoundPrice(mPlace);

    // проверяем на правильность всех действий
    // если суммы совпадают устанавливаем новые значения
    if DeltaNewPrice(mPlace) = 0 then
      for i := 1 to strngrdFromDetGoods.RowCount - 2 do
        for count := 0 to Length(mPlace) - 1 do
          if mPlace[count].positionInCheque = i then
            strngrdFromDetGoods.Cells[hToPayment, i] :=
              CurrToStr(mPlace[count].newPrice);

    // корректируем коэфициенты в сетке strnGrig
    with fmGoods, strngrdFromDetGoods do
    if RowCount > 2 then
      for i := 1 to RowCount - 2 do
        strngrdFromDetGoodsSetEditText(strngrdFromDetGoods,
          hToPayment, i, Cells[hToPayment, i]);
  end;
var
  sumMoney: Currency;
  strMoney: string;
begin
  with DM do
    repeat
      strMoney := txtPrice.Caption;
      if not InputQuery(strngfldChequeResponsible.Value + ', введите сумму:',
          'Цена товара: ' + txtPrice.Caption + 'гр.', strMoney) then
        Exit;
      txtSumToPay.Caption := strMoney;
      if not ifStrToCurr(txtSumToPay.Caption, sumMoney) then
        Continue;

      if sumMoney > (StrToCurr(txtPrice.Caption) * 1.03) then
        if MessageDlg('Вы предлагаете ' + FormatCurr('# ##0.00гр', sumMoney) + ' больше от ' + txtPrice.Caption + 'р. на: ' +
            FormatCurr('# ##0.00гр', Abs(StrToCurr(txtPrice.Caption) - sumMoney)) +
              Format(' (%d', [Round(Abs(PersOldNew(StrToCurr(txtPrice.Caption), sumMoney)))]) + '%)',
                mtWarning, mbOKCancel, 0) <> mrOk then
          Continue;

      if sumMoney < (StrToCurr(txtPrice.Caption) * 0.97) then
        if MessageDlg('Вы предлагаете ' + FormatCurr('# ##0.00гр', sumMoney) + ' меньше от ' + txtPrice.Caption + 'р. на: ' +
            FormatCurr('# ##0.00гр', Abs(StrToCurr(txtPrice.Caption) - sumMoney)) +
              Format(' (%d', [Round(Abs(PersOldNew(StrToCurr(txtPrice.Caption), sumMoney)))]) + '%)',
              mtWarning, mbOKCancel, 0) <> mrOk then
          Continue;
      Break;
    until False;

  PlacePrice(sumMoney);
  SumToPay_TO_Payed;
  //txtSumToPay.Caption := CurrToStr(sumMoney);
end;

{ TPanel }

procedure TPanelToPay.CMMouseEnter(var Message: TMessage);
begin
  if BevelOuter <> bvRaised then
    BevelOuter := bvRaised
end;

procedure TPanelToPay.CMMouseLeave(var Message: TMessage);
begin
  if BevelOuter <> bvNone then
    BevelOuter := bvNone
end;

procedure TfmGoods.txtSumToPayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if txtSumToPay.BorderStyle <> sbsSunken then
    txtSumToPay.BorderStyle := sbsSunken;
  ifFcsTxtToPay := True
end;

procedure TfmGoods.dtpDateChange(Sender: TObject);
begin
  with DM, tbCheque do
    dtfldChequeCDate.Value := dtpDate.Date;
end;

procedure TfmGoods.btnOkClick(Sender: TObject);
var
  Done: Boolean;
begin
  ModalResult := 0;

  Done := True;
  aplctnvnts1Idle(Sender, Done);

  if (stat1.Panels.Items[0].Text = '') or (stat1.Panels.Items[1].Text = '') or
      (LowerCase(stat1.Panels.Items[0].Text) = 'error') then
    Exit;

  if Int(dtpDate.Date) <> Date then
    if MessageDlg('Вы подтверждаете выбранную дату ' +
        DateToStr(dtpDate.Date) + ' ?' + #13#10 +
        'если "да" нажмите Ok', mtInformation, mbOKCancel, 0
        ) <> mrOk then
      Exit;
      
  ModalResult := 1
end;

procedure TfmGoods.FormHide(Sender: TObject);
begin
//  fmForRunOrder.Free;
  Application.OnIdle := nil
end;

procedure TfmGoods.edtPayedKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then
    Key := DecimalSeparator; // запятую заменяем на разделитель для числа

  if Key = '.' then
    Key := DecimalSeparator; // точку заменяем на сепаратор (на всякий случай)

  if not (Key in ['0'..'9','-',DecimalSeparator,#8,#13]) // символы которые пропускаются
    or ((Key = DecimalSeparator) // все цифры знак минус разделитель
    and (POS (DecimalSeparator, edtPayed.Text) > 0)) // запрет на второй сепаратор
    or ((Key = '-') and (POS ('-', edtPayed.Text) > 0)) // запрет на второй минус
    or ((Key = '-') and (edtPayed.SelStart <> 0)) // запрет на минус не вначале цифры
    then // (можно и предыдущей строчки но так лучше для понимания)
  begin
    Key := #0; // запрещенный символ заменяем нулем
    MessageBeep (MB_OK); // биб в спикир
  end;
end;

procedure TfmGoods.WMMove(var MSG: TWMMove);
begin
  inherited;
  with fmGoods do
    if Assigned(fmGoods) and Active and Assigned(fmForRunOrder) and
        (TypeCheque = chRunOrder) then
      begin
        fmForRunOrder.Left := Left;
        fmForRunOrder.top := top - fmForRunOrder.Height - 1;
      end;
end;


{ TODO 2 -cMOVE : поля cheque заменить (personel, partner и т.д.) }

procedure TfmGoods.dbgrdDetGoodsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  function ifFindGoods(ID: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    with strngrdFromDetGoods do
    for i := 1 to RowCount - 2 do
      if Cells[hDetGoodsID, i] = ID then
        begin
          Result := True;
          Exit
        end;
  end;
begin
  if ifFindGoods(intgrfldGoodsDetailGoodsID.AsString) then
    with dbgrdDetGoods.Canvas do
    begin
      Brush.Color := clGray;
      FillRect(Rect);
      Font.Color := clWhite;
      if Column.Field.DataType=ftString then
      //В строковых полях текст прижимается влево
        TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text)
      else
      //В остальных полях – вправо
        TextOut(Rect.Right - TextWidth(Column.Field.Text) -
          2, Rect.Top + 2, Column.Field.Text)
    end
end;

procedure TfmGoods.dbgrdDetGoodsKeyPress(Sender: TObject; var Key: Char);
begin
  ifClickCtrl := False;
  ifClickShift := False;
  case Key of
    #13, #32:  // Enter, Space
      ifClickShift := True;

    #46, #8:  // Del, Back Space
      ifClickCtrl := True;
  end;
  { TODO 1 -odbgrdDetGoodsCellClick(col) :
Не использовать TColumn потому как он не инициализирован
в ф-ции dbgrdDetGoodsKeyPress }
  dbgrdDetGoodsCellClick(nil);
  dbgrdDetGoods.Refresh
end;

procedure TfmGoods.edtFindNameClick(Sender: TObject);
begin
  edtFindName.SelectAll
end;

procedure TfmGoods.intgrfldGoodsSelectCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
  function ifFindGoods(ID: string; var SUM: Real): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    SUM := 0;
    with strngrdFromDetGoods do
    for i := 1 to RowCount - 2 do
      if Cells[hDetGoodsID, i] = ID then
        begin
          case cTypeGoods(intgrfldGoodsGType.Value) of
            tTrack: SUM := SUM +  StrToFloat(Cells[hLength, i]) / 1000;
          else
            SUM := SUM + StrToFloat(Cells[hCount, i]);
          end;
          Result := True;
        end;
  end;
var
  SUM: Real;
begin
  if ifFindGoods(intgrfldGoodsDetailGoodsID.AsString, SUM) then
    Text := FloatToStr(SUM)
end;

procedure TfmGoods.SumToPay_TO_Payed;
var
  b: Boolean;
begin
  b := False;
  aplctnvnts1Idle(Self, b);
  edtPayed.Text := txtSumToPay.Caption
end;

procedure TfmGoods.strngrdFromDetGoodsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SumToPay_TO_Payed
end;

procedure TfmGoods.actSelectAllExecute(Sender: TObject);
var
  I: Integer;
  ch: Char;
begin
  qryGoods.First;
  with qryGoods do
    while not Eof do
    begin
      ch := #32;
      for I := 0 to intgrfldGoodsDCount.Value do
        dbgrdDetGoodsKeyPress(Self, ch);
      Next;
    end;
end;

end.
