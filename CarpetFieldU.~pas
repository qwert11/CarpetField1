unit CarpetFieldU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ActnList, Menus, ComCtrls,
  AutoBot1U, DBTables, RpCon, RpConDS, RpConBDE, RpDefine, RpRave;
{ TODO :
Заменить константы Типа товара и т.д. динамическими
из Табл. напр. TypeGoods }
type
  TfmCheque = class(TForm)
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    pnl1: TPanel;
    spl1: TSplitter;
    dbgrd3: TDBGrid;
    btnPartner: TButton;
    btnImport: TButton;
    dbgrd4: TDBGrid;
    pm1: TPopupMenu;
    mniIns: TMenuItem;
    mniN2: TMenuItem;
    mniNDelete: TMenuItem;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    mniN6: TMenuItem;
    N1: TMenuItem;
    actlst1: TActionList;
    pm2: TPopupMenu;
    mniN7: TMenuItem;
    mniN8: TMenuItem;
    mniN9: TMenuItem;
    mniN10: TMenuItem;
    mniN11: TMenuItem;
    mniN12: TMenuItem;
    mniN13: TMenuItem;
    stat1: TStatusBar;
    btnSale: TButton;
    actSale: TAction;
    pnl2: TPanel;
    btnExpenses: TButton;
    actExpenses: TAction;
    btnMiniReport: TButton;
    actMinReport: TAction;
    actImport: TAction;
    btnOrderFromBuyer: TButton;
    actOrderFromBuyer: TAction;
    btnInternalMov: TButton;
    actInternalMov: TAction;
    mniImport: TMenuItem;
    mniN3: TMenuItem;
    mm1: TMainMenu;
    mniFile1: TMenuItem;
    mniFilter1: TMenuItem;
    mniOrder1: TMenuItem;
    mniNotfilter1: TMenuItem;
    actCloseOrder: TAction;
    btnRunOrder: TButton;
    mniN14: TMenuItem;
    mniRelation1: TMenuItem;
    actRelation: TAction;
    mniN15: TMenuItem;
    actRelationALL: TAction;
    mniPrice1: TMenuItem;
    actReport: TAction;
    btnReport: TButton;
    actInsCheque: TAction;
    actEditCheque: TAction;
    actMoneyTransact: TAction;
    btnMoneyTransact: TButton;
    actShowDebts: TAction;
    mniShowOpenOrder: TMenuItem;
    actShowAllOrder: TAction;
    mniShowAllOrder: TMenuItem;
    lblInfoCheque: TLabel;
    btnSalePeresortint: TButton;
    actSalePeresorting: TAction;
    mniN16: TMenuItem;
    mniRetSale: TMenuItem;
    actRetSale: TAction;
    pnl3: TPanel;
    mniN18: TMenuItem;
    acPayOrder: TAction;
    mniPrint1: TMenuItem;
    procedure btnPartnerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MOVE(Sender: TObject; TypeCheque: TTypeCheque);
    procedure actExpensesExecute(Sender: TObject);
    procedure actMinReportExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure actOrderFromBuyerExecute(Sender: TObject);
    procedure actSaleExecute(Sender: TObject);
    procedure mniNDeleteClick(Sender: TObject);
    procedure actInternalMovExecute(Sender: TObject);
    procedure mniNotfilter1Click(Sender: TObject);
    function ifClosedOrder: Boolean;
    procedure actRelationExecute(Sender: TObject);
    procedure actCloseOrderExecute(Sender: TObject);
    procedure actRelationALLExecute(Sender: TObject);
    procedure actRelationUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniPrice1Click(Sender: TObject);
    procedure actReportExecute(Sender: TObject);
    procedure actInsChequeExecute(Sender: TObject);
    procedure actEditChequeExecute(Sender: TObject);
    procedure actMoneyTransactExecute(Sender: TObject);
    procedure actShowDebtsExecute(Sender: TObject);
    procedure actShowAllOrderExecute(Sender: TObject);
    procedure actSalePeresortingExecute(Sender: TObject);
    procedure actRetSaleUpdate(Sender: TObject);
    procedure actRetSaleExecute(Sender: TObject);
    procedure acPayOrderExecute(Sender: TObject);
    procedure mniPrint1Click(Sender: TObject);
  private
    { Private declarations }
    procedure NotFilterCheque;
    procedure GetException(Sender: TObject; E: Exception);
    procedure InfoCheque(Sender: TObject);
  public
    { Public declarations }
  end;

var
  fmCheque: TfmCheque;
  idOrder: Integer;

implementation

uses dmCheque, PartnerU, EditChqU, ExpensesU,
  MinReportU, XlsTableU, GoodsU, Pricing_PolicyU, ReportU, MoneyTransactU,
  RetSaleU, PrintU;

{$R *.dfm}

procedure TfmCheque.btnPartnerClick(Sender: TObject);
begin
  fmPartner.ShowModal
end;

procedure TfmCheque.InfoCheque(Sender: TObject);
begin
  dbgrd1.SetFocus;
  DM.ds1DataChange(nil, nil);
  { TODO -oInfoCheque : доделать focus }
  //(Sender as TWinControl).SetFocus;
end;

procedure TfmCheque.FormShow(Sender: TObject);
var
  s1,
  s2: string;
begin
  TESTALL(s1, s2);
  stat1.Panels[0].Text := s1;
  stat1.Panels[1].Text := s2;
  InfoCheque(btnSale)
end;


{

Move
	MBefoCount, MAfterCount,MCount, MGoods, MPrice, MToPayment, MChequeID

DetailGoods
  // отнимаем в DetGoods
  DCount

Goods
  // отнимаем в Goods
  GCount

Personel
  // Меняем дельту партнера
  PFinDelta

AddressPartner
  // меняем ВЫРУЧКУ торговой точки
  ASumMoney

MoveMoney
  // двигаем деньги
  MMoney, MmChequeID, MmRespPartner, MmResp, MmDate, MmBefo, MMoney, MmAfter

MiniReport
  // добавляем данные в отчет MiniReport
  MrDate, MrAddressPartnerID, MrMoney, MrCarped, MrElse, MrMetal, MrTrack,MrPicture,

GraphWork
  // добавим и в График Выходов
  dtfldGraphWorkGWDate, intgrfldGraphWorkGWAddress, intgrfldGraphWorkGWResp
}
procedure TfmCheque.actExpensesExecute(Sender: TObject);
var
  vResult: Variant;
  I: Integer;
  s1, s2: string;

  nSquareTrack: Real;
  nCarpet,
  nElse,
  nTrack,
  nPicture,
  nMetal: Integer;
  nMoney,
  nValGoods: Currency;
begin
  s1 := stat1.Panels[0].Text;
  s2 := stat1.Panels[1].Text;
  NotFilterCheque;
  fmExpenses := TfmExpenses.Create(Sender as TComponent);
  with DM, tbExpenses, fmExpenses do
  try
    try
      if fmExpenses.ShowModal = mrOk then
        begin
          DB.StartTransaction;
          vResult := quQuery('SELECT ChequeID FROM CHEQUE WHERE CType = 11 AND CAddress = ' + IntToStr(Address) + ' AND CDate = "' + DateToStr(cal1.Date) + '"');
          if VarIsNull(vResult) then
            // нет такого ЧЕКА
            begin
              tbCheque.Append;

              intgrfldChequeCAddress.Value := Address;
              dtfldChequeCRetDate.Value := cal1.Date + RetPeriod;
              intgrfldChequeCType.Value := 11;
              crncyfldChequeCPrice.Value := 0;
              crncyfldChequeCToPayment.Value := 0;
              crncyfldChequeCPayedSum.Value := -1 * StrToCurr(txtExpenses.Caption);

              intgrfldChequeCWithCheque.Value := -1;
              intgrfldChequeCResponsible.Value := dblkcbbResponsible.KeyValue;
              intgrfldChequeCPartner.Value := 2;
              intgrfldChequeCRespPartner.Value := 5;
              intgrfldChequeCAddrPartner.Value := Address;
              dtmfldChequeCDateTimeTransact.Value := Now;
              intgrfldChequeCRespTransact.Value := RespTransact;

              dtfldChequeCDate.Value := cal1.Date;
              tbCheque.Post;
              // двигаем деньги
              tbMoveMoney.Append;
              crncyfldMoveMoneyMMoney.Value := -1 * StrToCurr(txtExpenses.Caption);
              intgrfldMoveMoneyMmChequeID.Value := atncfldChequeChequeID.Value;
              intgrfldMoveMoneyMmResp.Value := dblkcbbResponsible.KeyValue;
              intgrfldMoveMoneyMmRespPartner.Value := 5;
              dtfldMoveMoneyMmDate.Value := cal1.Date;
              tbMoveMoney.Post;
            end
            // чек уже ЕСТЬ
          else
            begin
              if not tbCheque.Locate('ChequeID', vResult, []) then
                Abort;
              tbCheque.Edit;
              crncyfldChequeCPayedSum.Value := crncyfldChequeCPayedSum.Value - StrToCurr(txtExpenses.Caption);

              tbCheque.Post;

              // двигаем деньги
              if not tbMoveMoney.Locate('MmChequeID', vResult, []) then
                Abort;
              tbMoveMoney.Edit;
              crncyfldMoveMoneyMMoney.Value := crncyfldMoveMoneyMMoney.Value - StrToCurr(txtExpenses.Caption);
              tbMoveMoney.Post;
            end;

          // заполняем табл. РАСХОДЫ
          with strngrdExpenses do
          for I := 1 to RowCount - 1 do
            begin
              tbExpenses.Append;
              crncyfldExpensesESumm.Value := StrToCurr(Cells[hSumm, I]);
              strngfldExpensesEInfo.Value := Cells[hInfo, I];
              intgrfldExpensesEResponsible.Value := dblkcbbResponsible.KeyValue;
              intgrfldExpensesEChequeID.Value := atncfldChequeChequeID.Value;
              tbExpenses.Post;
            end;

          // меняем дельту партнера
          quQuery('UPDATE PERSONEL SET PFinDelta = PFinDelta - ' + FloatToStrP(StrToCurr(txtExpenses.Caption)) + ' WHERE PersonelID = ' + intgrfldChequeCRespPartner.AsString);

          if tbMiniReport.Locate('MrDate; MrAddressPartnerID', VarArrayOf([cal1.Date, Address]), []) then
            // обновим сумму в отчете
            begin
              tbMiniReport.Edit;
              crncyfldMiniReportMrMoney.Value := crncyfldMiniReportMrMoney.Value - StrToCurr(txtExpenses.Caption);
              tbMiniReport.Post;
            end
          else
            // добавим новую дату
            begin
              quLastCount(nSquareTrack, nCarpet, nElse, nTrack, nPicture, nMetal, nMoney, nValGoods, Address);
              tbMiniReport.Append;
              dtfldMiniReportMrDate.Value := cal1.Date;
              intgrfldMiniReportMrAddressPartnerID.Value := Address;
              crncyfldMiniReportMrMoney.Value := nMoney - StrToCurr(txtExpenses.Caption);
              intgrfldMiniReportMrCarped.Value := nCarpet;
              intgrfldMiniReportMrElse.Value := nElse;
              intgrfldMiniReportMrMetal.Value := nMetal;
              intgrfldMiniReportMrTrack.Value := nTrack;
              intgrfldMiniReportMrPicture.Value := nPicture;
              fltfldMiniReportMrSqTrack.Value := nSquareTrack;
              crncyfldMiniReportMrValueGoods.Value := nValGoods;
              tbMiniReport.Post;
              // добавим нового ответственного в график выходов
              tbGraphWork.Append;
              dtfldGraphWorkGWDate.Value := cal1.Date;
              intgrfldGraphWorkGWAddress.Value := Address;
              intgrfldGraphWorkGWResp.Value := dblkcbbResponsible.KeyValue;
              tbGraphWork.Post;
            end;

          if not TESTALL(s1, s2) then
            Abort;
          DB.Commit;
        end
    except
      DB.Rollback;
    end;
  finally
    tbCheque.Refresh;
    fmExpenses.Free;
  end;
  stat1.Panels[0].Text := s1;
  stat1.Panels[1].Text := s2;
  InfoCheque(Sender);
end;

procedure TfmCheque.actMinReportExecute(Sender: TObject);
begin
  fmMinReport.ShowModal;
end;

procedure TfmCheque.actImportExecute(Sender: TObject);
var
  I,
  WithCheque,
  sCarpet, sElse, sTrack, sPicture, sMetal: Integer;
  sSquareTrackFromMiniReport: Real;
  sMoney,
  nValGoods: Currency;
  s1,
  s2,
  TermIns: string;
begin
  WithCheque := - 1;
  TermIns := '=';
  with DM do
  if intgrfldChequeCWithCheque.Value <> - 1 then
    begin
      if MessageDlg('Прикрепить к чеку ' +
          strngfldChequeType.Value + #13#10 +
          'от ' + dtfldChequeCDate.AsString + #13#10 +
          'на сумму ' + crncyfldChequeCToPayment.AsString + ' грн.'
          , mtInformation, mbOKCancel, 0) = mrOk then
        WithCheque := intgrfldChequeCWithCheque.Value;
    end;
  NotFilterCheque;
  DM.tbCheque.Append;
  if fmXlsTable.ShowModal = mrOk then
    with DM, fmXlsTable, strngrdGOODS_IMPORT do
    begin
      if RowCount < 2 then
        Exit;
      // проверим дату
      // условие всавки
      if LastDate > Int(dtpCDate.Date) then
        case MessageDlg('Дата продажи не должна быть ранее последней - это может привести к ошибке!!!' + #13#10 +
          '"Yes": вставить после ' + DateToStr(dtpCDate.Date) + #13#10 +
          '"No": обновить предшествующие дате: ' + DateToStr(dtpCDate.Date) + #13#10 +
          '"Cancel": отказаться', mtWarning, mbYesNoCancel, 0) of
          mrYes: TermIns := '>=';
          mrNo: TermIns := '<=';
        else
          tbCheque.Cancel;
          Abort;
        end;

      // чек
      dtfldChequeCDate.Value := dtpCDate.Date;
      intgrfldChequeCAddress.Value := Address;
      intgrfldChequeCType.Value := 5; // имп. из xsl
      crncyfldChequeCPrice.Value := 0;
      crncyfldChequeCToPayment.Value := 0;
      crncyfldChequeCPayedSum.Value := 0;
      intgrfldChequeCWithCheque.Value := WithCheque;
      dtmfldChequeCDateTimeTransact.Value := Now;
      intgrfldChequeCRespTransact.Value := RespTransact;
      dtfldChequeCRetDate.Value := dtfldChequeCDate.Value;
      tbCheque.Post;

      for I := 1 to RowCount - 1 do
        begin
{ hImpNumber = 0; hImpArticul = 1; hImpGoods = 2; hImpWidth = 3; hImpLength = 4;
hImpUnit = 5; hImpCount = 6; hImpPriceSquM = 7; hImpPrice = 8; hImpType = 9;}
          // GOODS
          tbGoods.Append;
          strngfldGoodsGArticul.Value := Cells[Integer(hImpArticul), I];
          strngfldGoodsGTitle.Value := Cells[Integer(hImpGoods), I];
          case cTypeGoods(StrToInt(Cells[Integer(hImpType), I])) of
            tCarpet, tElse:
              begin
                intgrfldGoodsGWidth.Value := Trunc(1000 * StrToFloat(Cells[Integer(hImpWidth), I]));
                intgrfldGoodsGLength.Value := Trunc(1000 * StrToFloat(Cells[Integer(hImpLength), I]));
                intgrfldGoodsGCount.Value := StrToInt(Cells[Integer(hImpCount), I]);
              end;
            tTrack:
              begin
                intgrfldGoodsGWidth.Value := Trunc(1000 * StrToFloat(Cells[Integer(hImpWidth), I]));
                intgrfldGoodsGCount.Value := Trunc(1000 * StrToFloat(Cells[Integer(hImpLength), I]));
              end;
          else
            intgrfldGoodsGCount.Value := StrToInt(Cells[Integer(hImpCount), I]);
          end;

//          if (StrToInt(Cells[Integer(hImpType), I]) = Integer(tCarpet)) or
//             (StrToInt(Cells[Integer(hImpType), I]) = Integer(tTrack)) then
//            crncyfldGoodsGPriceSquare.Value := StrToCurr(Cells[Integer(hImpPriceSquM), I]);

          strngfldGoodsGColor.Value := Cells[Integer(hColor), I];
          strngfldGoodsGImageCode.Value := Cells[Integer(hImageCode), I];
          strngfldGoodsGFirm.Value := Cells[Integer(hFirm), I];
          intgrfldGoodsGType.Value := StrToInt(Cells[Integer(hImpType), I]);
          intgrfldGoodsGMadeIn.Value := sgMadeInStrToInt(I);
          tbGoods.Post;

          // DetailGoods
          tbDetailGoods.Append;
          intgrfldDetailGoodsDGoods.Value := atncfldGoodsGoodsID.Value;
          intgrfldDetailGoodsDAddrPartner.Value := intgrfldChequeCAddress.Value;
          intgrfldDetailGoodsDCount.Value := intgrfldGoodsGCount.Value;
          case cTypeGoods(StrToInt(Cells[Integer(hImpType), I])) of
            tTrack:
              crncyfldDetailGoodsDPriceCoeff.Value := StrToCurr(Cells[Integer(hImpPrice), I]) / 1000;
          else
            crncyfldDetailGoodsDPriceCoeff.Value := StrToCurr(Cells[Integer(hImpPrice), I]);
          end;
          tbDetailGoods.Post;

          // MOVE
          tbMove.Append;
          intgrfldMoveMGoods.Value := atncfldDetailGoodsDetailGoodsID.Value;
          intgrfldMoveMCount.Value := intgrfldDetailGoodsDCount.Value;
          crncyfldMoveMPrice.Value := crncyfldDetailGoodsDPriceCoeff.Value;
          crncyfldMoveMToPayment.Value := 0;
          intgrfldMoveMChequeID.Value := atncfldChequeChequeID.Value;
          tbMove.Post;
        end;
      

      if not tbMiniReport.Locate('MrDate; MrAddressPartnerID',
          VarArrayOf([dtfldChequeCDate.Value, intgrfldChequeCAddress.Value]), []) then
        begin
          tbMiniReport.Append;
          quLastCount(sSquareTrackFromMiniReport, sCarpet, sElse, sTrack, sPicture, sMetal, sMoney, nValGoods, Address);
          dtfldMiniReportMrDate.Value := dtfldChequeCDate.Value;
          intgrfldMiniReportMrAddressPartnerID.Value := intgrfldChequeCAddress.Value;
          crncyfldMiniReportMrMoney.Value := sMoney;
          intgrfldMiniReportMrCarped.Value := sCarpet + StrToInt(txtCarpet.Caption);
          intgrfldMiniReportMrElse.Value := sElse + StrToInt(txtElse.Caption);
          intgrfldMiniReportMrMetal.Value := sMetal + StrToInt(txtMetal.Caption);
          intgrfldMiniReportMrTrack.Value := sTrack + StrToInt(txtTrack.Caption);
          intgrfldMiniReportMrPicture.Value := sPicture + StrToInt(txtPicture.Caption);
          fltfldMiniReportMrSqTrack.Value := sSquareTrackFromMiniReport + StrToFloat(txtSqTrack.Caption);
          crncyfldMiniReportMrValueGoods.Value := nValGoods + StrToCurr(txtSUM_PRICE.Caption);
          tbMiniReport.Post;

          tbGraphWork.Append;
          dtfldGraphWorkGWDate.Value := dtfldChequeCDate.Value;
          intgrfldGraphWorkGWAddress.Value := intgrfldChequeCAddress.Value;
          intgrfldGraphWorkGWResp.Value := intgrfldChequeCResponsible.Value;
          intgrfldGraphWorkGWAlgoritm.Value := - 1;
          tbGraphWork.Post;
        end
      else
        begin
          MrEnterGoods(dtpCDate.Date, TermIns, 0, StrToCurr(txtSUM_PRICE.Caption), StrToInt(txtCarpet.Caption),
            StrToInt(txtElse.Caption), StrToInt(txtMetal.Caption), StrToInt(txtPicture.Caption),
            StrToInt(txtTrack.Caption), StrToFloat(txtSqTrack.Caption));
//          tbMiniReport.Edit;
//          intgrfldMiniReportMrCarped.Value := intgrfldMiniReportMrCarped.Value + StrToInt(txtCarpet.Caption);
//          intgrfldMiniReportMrElse.Value := intgrfldMiniReportMrElse.Value + StrToInt(txtElse.Caption);
//          intgrfldMiniReportMrMetal.Value := intgrfldMiniReportMrMetal.Value + StrToInt(txtMetal.Caption);
//          intgrfldMiniReportMrTrack.Value := intgrfldMiniReportMrTrack.Value + StrToInt(txtTrack.Caption);
//          intgrfldMiniReportMrPicture.Value := intgrfldMiniReportMrPicture.Value + StrToInt(txtPicture.Caption);
//          fltfldMiniReportMrSqTrack.Value := fltfldMiniReportMrSqTrack.Value + StrToFloat(txtSqTrack.Caption);
//          crncyfldMiniReportMrValueGoods.Value := crncyfldMiniReportMrValueGoods.Value + StrToCurr(txtSUM_PRICE.Caption);
//          tbMiniReport.Post;
        end;
      TESTALL(s1, s2);
      stat1.Panels[0].Text := s1;
      stat1.Panels[1].Text := s2;
    end
  else
    DM.tbCheque.Cancel;
  InfoCheque(Sender);
end;

procedure TfmCheque.actOrderFromBuyerExecute(Sender: TObject);
begin
  MOVE(Sender, chOrder);
  InfoCheque(Sender);
end;

{ TODO 2 -cMOVE (товара) :
добавить вставку продажи до последнего дня продажи
с условием изменения в MiniReport
  a) все даты после
  б) все даты до }
  { TODO 3 -c: внутреннее пеемещение }
procedure TfmCheque.MOVE(Sender: TObject; TypeCheque: TTypeCheque);
  function SelectToMove(var sTrack: Integer): Boolean;
  var
    ID: Integer;
  begin
    Result := False;
    sTrack := 0;
    if fmGoods.strngrdFromDetGoods.RowCount < 3 then
      Exit;
    ID := 1;
    with DM, tbMove, fmGoods, strngrdFromDetGoods do
    repeat
      Append;
      case TypeCheque of
        chSale, chInternalMov, chRunOrder, chSalePeresorting:
          begin
            if not tbDetailGoods.Locate('DetailGoodsID',
                StrToInt(Cells[hDetGoodsID, ID]), []) then
              Abort;
            // отнимаем в DetGoods
            tbDetailGoods.Edit;
            case cTypeGoods(StrToInt(Cells[hTypeGoods, ID])) of
              tTrack:
                begin
                  intgrfldDetailGoodsDCount.Value := intgrfldDetailGoodsDCount.Value -
                    StrToInt(Cells[hLength, ID]);
                  if intgrfldDetailGoodsDCount.Value <= 0 then
                    Inc(sTrack);
                end;            
            else
              intgrfldDetailGoodsDCount.Value := intgrfldDetailGoodsDCount.Value -
                StrToInt(Cells[hCount, ID]);
            end;

            tbDetailGoods.Post;
            // отнимаем в Goods
            tbGoods.Locate('GoodsID', intgrfldDetailGoodsDGoods.Value, []);
            tbGoods.Edit;
            case cTypeGoods(StrToInt(Cells[hTypeGoods, ID])) of
              tTrack:
                intgrfldGoodsGCount.Value := intgrfldGoodsGCount.Value -
                    StrToInt(Cells[hLength, ID]);
            else
              intgrfldGoodsGCount.Value := intgrfldGoodsGCount.Value -
                  StrToInt(Cells[hCount, ID]);
            end;

            tbGoods.Post;
            //
          end;
        chOrder: ;
      else
        raise EAbort.Create('Отсутствует бизнес правило');
      end;
      // изменить Move
      case cTypeGoods(StrToInt(Cells[hTypeGoods, ID])) of
        tTrack:
          intgrfldMoveMCount.Value := StrToInt(Cells[hLength, ID]);
      else
        intgrfldMoveMCount.Value := StrToInt(Cells[hCount, ID]);
      end;
      intgrfldMoveMGoods.Value := StrToInt(Cells[hDetGoodsID, ID]);
      crncyfldMoveMPrice.Value := StrToCurr(Cells[hPriceUnit, ID]);
      crncyfldMoveMToPayment.Value := StrToCurr(Cells[hToPayment, ID]);
      intgrfldMoveMChequeID.Value := atncfldChequeChequeID.Value;
      Inc(ID);
      Post;
    until ID > fmGoods.strngrdFromDetGoods.RowCount - 2;
    Result := True;
  end;
  
var
  Auto: TAutoBot1;
  s1, s2,
  TermIns: string;
  sSquareTrackFromMiniReport: Real;
  sCarpet, sElse, sTrack, sPicture, sMetal: Integer;
  sMoney,
  nValGoods: Currency;
  v: Variant;
begin
  // убираем фильтры
  NotFilterCheque;
  TermIns := '=';
  s1 := stat1.Panels[0].Text;
  s2 := stat1.Panels[1].Text;
  fmGoods := TfmGoods.Create(TypeCheque, Sender);
  Auto := TAutoBot1.Create;
  DM.tbCheque.Append;
  try
    with DM, tbCheque, fmGoods, strngrdFromDetGoods do
    if ShowModal = mrOk then
      begin
        DB.StartTransaction;
        try
          intgrfldChequeCType.Value := Integer(TypeCheque);

          //проблема с деньгами и кол- вом товара
          case TypeCheque of
            chRunOrder:
              begin
                crncyfldChequeCToPayment.Value := 0;
                crncyfldChequeCPrice.Value := 0;
                crncyfldChequeCPayedSum.Value := 0;
                quQuery('UPDATE CHEQUE SET CPayedSum = CPayedSum + ' + FloatToStrP(StrToCurr(edtPayed.Text)) + ' WHERE ChequeID = ' + IntToStr(idOrder));
              end;
            chInternalMov:
              begin
                crncyfldChequeCToPayment.Value := 0;
                crncyfldChequeCPrice.Value := 0;
                crncyfldChequeCPayedSum.Value := 0;
              end;
            chSale, chOrder, chSalePeresorting:
              begin
                crncyfldChequeCPayedSum.Value := StrToCurr(edtPayed.Text);
                crncyfldChequeCToPayment.Value := StrToCurr(txtSumToPay.Caption);      
                crncyfldChequeCPrice.Value := StrToCurr(txtPrice.Caption);
              end;
          else
            ShowMessage('Отсутствует бизнес правило');
            Abort;
          end;

          dtfldChequeCDate.Value := dtpDate.DateTime;
          dtmfldChequeCDateTimeTransact.Value := Now;
          Post;

          { TODO 5 -oMOVE -cOrderGoods :
заказ товара более глубокий чем казался вначале
в MOVE записывается DetailGoodsID который в будущем может 
отсутствовать }
          Edit;
          case TypeCheque of
            chOrder, chSalePeresorting: intgrfldChequeCWithCheque.Value := atncfldChequeChequeID.Value;
            chRunOrder: intgrfldChequeCWithCheque.Value := idOrder;
          else
            intgrfldChequeCWithCheque.Value := - 1;
          end;
          Post;


          // условие вставки записи если продажа произошла
          // ПЕРЕД ПОСЛЕДНИМ ДНЕМ ПРОДАЖИ
          v := quQuery('SELECT MAX(MrDate) FROM MiniReport WHERE MrAddressPartnerID = ' + IntToStr(Address));
          if (v > dtfldChequeCDate.Value) or (dtfldChequeCDate.Value > quQuery('SELECT MAX(CDate) FROM CHEQUE WHERE CAddress = ' + IntToStr(Auto.Address))) then
            begin
              case MessageDlg('Дата продажи не должна быть ранее последней - это может привести к ошибке!!!' + #13#10 +
                '"Yes": вставить после ' + DateToStr(dtpDate.Date) + #13#10 +
                '"No": обновить предшествующие дате: ' + DateToStr(dtpDate.Date) + #13#10 +
                '"Cancel": отказаться', mtWarning, mbYesNoCancel, 0) of
                mrYes: TermIns := '>=';
                mrNo: TermIns := '<=';
              else
                Abort;
              end;
            end;
            
          // Меняем дельту покупателя
          tbPersonel.Locate('PersonelID', intgrfldChequeCRespPartner.Value, []);
          tbPersonel.Edit;
          crncyfldPersonelPFinDelta.Value := crncyfldPersonelPFinDelta.Value +
            StrToCurr(edtPayed.Text);
          tbPersonel.Post;

          // двигаем деньги
          tbMoveMoney.Append;
          case TypeCheque of
            chRunOrder: intgrfldMoveMoneyMmChequeID.Value := idOrder;
          else
             intgrfldMoveMoneyMmChequeID.Value := atncfldChequeChequeID.Value;
          end;
          intgrfldMoveMoneyMmRespPartner.Value := intgrfldChequeCRespPartner.Value;
          intgrfldMoveMoneyMmResp.Value := intgrfldChequeCResponsible.Value;
          dtfldMoveMoneyMmDate.Value := dtfldChequeCDate.Value;
          crncyfldMoveMoneyMMoney.Value := StrToCurr(edtPayed.Text);
          tbMoveMoney.Post;

          quLastCount(sSquareTrackFromMiniReport, sCarpet, sElse, sTrack, sPicture, sMetal, sMoney, nValGoods, Address, DateToStr(dtpDate.Date + 1));
          // добавляем новую дату в отчет MiniReport
          if not tbMiniReport.Locate('MrDate; MrAddressPartnerID',
              VarArrayOf([dtfldChequeCDate.Value, intgrfldChequeCAddress.Value]), []) then
            begin
              { TODO -cMOVE (товара) : обновление миниотчета не совершенно }
              tbMiniReport.Append;
              dtfldMiniReportMrDate.Value := dtfldChequeCDate.Value;
              intgrfldMiniReportMrAddressPartnerID.Value := intgrfldChequeCAddress.Value;

              crncyfldMiniReportMrMoney.Value := sMoney;
              intgrfldMiniReportMrCarped.Value := sCarpet;
              intgrfldMiniReportMrElse.Value := sElse;
              intgrfldMiniReportMrMetal.Value := sMetal;
              intgrfldMiniReportMrTrack.Value := sTrack;
              intgrfldMiniReportMrPicture.Value := sPicture;
              fltfldMiniReportMrSqTrack.Value := sSquareTrackFromMiniReport;
              crncyfldMiniReportMrValueGoods.Value := nValGoods;
              tbMiniReport.Post;

              // добавим и в График Выходов
              tbGraphWork.Append;
              dtfldGraphWorkGWDate.Value := dtfldChequeCDate.Value;
              intgrfldGraphWorkGWAddress.Value := intgrfldChequeCAddress.Value;
              intgrfldGraphWorkGWResp.Value := intgrfldChequeCResponsible.Value;
              tbGraphWork.Post;
            end;

          // двигаем продукцию в MOVE // Меняем остаток в GOODS и DetGoods
          SelectToMove(sTrack);

          // обновляем данные в MiniReport
          case TypeCheque of
            chSale, chInternalMov, chRunOrder, chSalePeresorting:
              MrOutputGoods(dtpDate.Date, TermIns, StrToCurr(edtPayed.Text), StrToCurr(txtPrice.Caption),
                StrToInt(txtCarped.Caption), StrToInt(txtElse.Caption), StrToInt(txtMetal.Caption),
                StrToInt(txtPic.Caption), sTrack, StrToFloat(txtSqTrack.Caption));
            chOrder:
              MrOutputGoods(dtpDate.Date, TermIns, StrToCurr(edtPayed.Text), 0, 0, 0, 0, 0, 0, 0);
          else
            MessageDlg('Отсутствует бизнес правило!', mtError, [mbOK], 0);
            Abort;
          end;

          if not TESTALL(s1, s2) then
            Abort;
          DB.Commit;
        except
          DB.Rollback;
        end;
      end
    else
      Cancel;
  finally
    fmGoods.Free;
    Auto.Free;
    DM.tbCheque.Refresh;
  end;
  stat1.Panels[0].Text := s1;
  stat1.Panels[1].Text := s2;
end;

procedure TfmCheque.actSaleExecute(Sender: TObject);
begin
  MOVE(Sender, chSale);
  InfoCheque(Sender);
end;

procedure TfmCheque.mniNDeleteClick(Sender: TObject);
var
  s1,
  s2: string;
begin
  DM.tbCheque.Delete;
  TESTALL(s1, s2);
  stat1.Panels[0].Text := s1;
  stat1.Panels[1].Text := s2;  
end;

procedure TfmCheque.actInternalMovExecute(Sender: TObject);
begin
  MOVE(Sender, chInternalMov);
  InfoCheque(Sender);
end;

procedure TfmCheque.mniNotfilter1Click(Sender: TObject);
begin
  NotFilterCheque
end;

function TfmCheque.ifClosedOrder: Boolean;
var
  vResult: Variant;
begin
  Result := False;
  with DM do
    vResult := quQuery('SELECT SUM(CToPayment - CPayedSum) FROM CHEQUE WHERE CWithCheque = ' + intgrfldChequeCWithCheque.AsString);
    if not VarIsNull(vResult) then
      if vResult = 0 then
        Result := True;
end;

{ TODO 2 -cOrderGoods : Выборка записей Фаронов 89 стр. }

procedure TfmCheque.actRelationExecute(Sender: TObject);
begin
  with DM, tbCheque do
    begin
      Filter := 'CWithCheque = ' + intgrfldChequeCWithCheque.AsString;
      Filtered := True
    end;
end;

procedure TfmCheque.actCloseOrderExecute(Sender: TObject);
begin
  with DM do
    idOrder := intgrfldChequeCWithCheque.Value;
  MOVE(Sender, chRunOrder);
  InfoCheque(Sender);
end;

procedure TfmCheque.actRelationALLExecute(Sender: TObject);
begin
  with DM, tbCheque do
    begin
      Filter := 'CWithCheque <> -1 AND CAddress = ' + IntToStr(Address);
      Filtered := True
    end;
end;

procedure TfmCheque.actRelationUpdate(Sender: TObject);
begin
  with DM do
    if ((intgrfldChequeCWithCheque.Value <> - 1) and
        (TTypeCheque(intgrfldChequeCType.Value) = chOrder)) or
          ((TTypeCheque(intgrfldChequeCType.Value) = chSale) and
            (crncyfldChequeCToPayment.Value <> crncyfldChequeCPayedSum.Value))then
      (Sender as TAction).Enabled := True
    else
      (Sender as TAction).Enabled := False;
end;

procedure TfmCheque.NotFilterCheque;
begin
  with DM.tbCheque do
    if Filtered then
      begin
        Filtered := False;
        Refresh;
        dbgrd1.Refresh;
      end;
      
end;
{ TODO 2 -cMOVE : для дорожки считать дл и щирину }
procedure TfmCheque.FormCreate(Sender: TObject);
begin
  Application.OnException := GetException;
end;

procedure TfmCheque.GetException(Sender: TObject; E: Exception);
{ TODO 1 -cошибки  : необходим BDE }
//var
//  err: DBIResult;
begin
  if E is EDBEngineError then
  begin
//     err := (E as EDBEngineError).errors[(E as EDBEngineError).errorcount -
//       1].errorcode;
//     if (err = DBIERR_KEYVIOL) then
//       showMessage('Ошибка Key violation!')
//     else if (err = DBIERR_LOCKED) then
//       showmessage('Запись блокирована другим пользователем')
//     else if (err = DBIERR_FILELOCKED) then
//       showmessage('Таблица блокирована кем-то еще')
//     else
//       showmessage('Другая ошибка DB')
    ShowMessage('Ошибка БД');
  end
  else
     showmessage('Упс!: ' + E.Message);
end;

procedure TfmCheque.mniPrice1Click(Sender: TObject);
var
  s1, s2: string;
begin
  NotFilterCheque;
  with TfmPricing_Policy.Create(Self) do
    begin
      ShowModal;
      Free;
    end;       
  TESTALL(s1, s2);
  stat1.Panels[0].Text := s1;
  stat1.Panels[1].Text := s2;
  DM.tbCheque.Refresh;
  InfoCheque(Sender);
end;

procedure TfmCheque.actReportExecute(Sender: TObject);
begin
  with TfmReport.Create(Self) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TfmCheque.actInsChequeExecute(Sender: TObject);
begin
  with DM.tbCheque do
    begin
      Append;
      if fmEditCheque.ShowModal = mrOk then
        Post
      else
        Cancel;
    end;
end;

procedure TfmCheque.actEditChequeExecute(Sender: TObject);
begin
  with DM.tbCheque do
    begin
      Edit;
      if fmEditCheque.ShowModal = mrOk then
        Post
      else
        Cancel;
    end;
end;

procedure TfmCheque.actMoneyTransactExecute(Sender: TObject);
begin
  NotFilterCheque;
  fmMoneyTransact := TfmMoneyTransact.Create(Sender);
  try
    if fmMoneyTransact.ShowModal <> mrOk then
      Exit;
    DM.tbCheque.Refresh;
    InfoCheque(Sender);
  finally
    fmMoneyTransact.Free;
  end;
end;

procedure TfmCheque.actShowDebtsExecute(Sender: TObject);
var
  sFilter: string;
begin
  sFilter := '';
  quQuerySet('SELECT ChequeID FROM "CHEQUE.DB" Cheque WHERE CToPayment <> CPayedSum ' +
    ' AND CType IN (1, 7) AND CAddress = ' + IntToStr(Address));
  with DM, qrySet do
  begin
    First;
    while not Eof do
      begin
        sFilter := sFilter + ' ChequeID = ' + Fields[0].AsString;
        Next;
        if not Eof then
          sFilter := sFilter + ' OR '
      end;
    if sFilter = '' then
      Exit;
    tbCheque.Filter := '';
    tbCheque.Filter := sFilter;
    tbCheque.Filtered := True;
  end;
end;

procedure TfmCheque.actShowAllOrderExecute(Sender: TObject);
begin
  with DM, tbCheque do
    begin
      Filter := 'CWithCheque <> -1 AND CType = 7 AND CAddress = ' + IntToStr(Address);
      Filtered := True
    end;
end;

procedure TfmCheque.actSalePeresortingExecute(Sender: TObject);
begin
  MOVE(Sender, chSalePeresorting);
  InfoCheque(Sender);
end;

procedure TfmCheque.actRetSaleUpdate(Sender: TObject);
begin
  with DM do
    (Sender as TAction).Enabled := TTypeCheque(intgrfldChequeCType.Value) =
      chSale; 
end;

procedure TfmCheque.actRetSaleExecute(Sender: TObject);
begin
  // фильтры нельзя убрать
  fmRetSale := TfmRetSale.Create(Sender as TComponent);
  fmRetSale.ShowModal;
  fmRetSale.Free;
  DM.tbCheque.Refresh;
  InfoCheque(Sender);
end;

procedure TfmCheque.acPayOrderExecute(Sender: TObject);
begin
  fmMoneyTransact := TfmMoneyTransact.Create(Sender, chRunOrder);
  try
    if fmMoneyTransact.ShowModal <> mrOk then
      Exit;
    DM.tbCheque.Refresh;
    InfoCheque(Sender);
  finally
    fmMoneyTransact.Free;
  end;
end;

procedure TfmCheque.mniPrint1Click(Sender: TObject);
begin
  fmPrint := TfmPrint.Create(Sender as TComponent);
  try
    fmPrint.ShowModal
  finally
    fmPrint.Free;
  end;
end;

end.
