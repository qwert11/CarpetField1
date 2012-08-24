unit dmCheque;

interface

uses
  SysUtils, Classes, Controls, DB, DBTables, Dialogs, Variants;

type
  TDM = class(TDataModule)
    DB: TDatabase;
    tbCheque: TTable;
    ds1: TDataSource;
    tbMove: TTable;
    ds2: TDataSource;
    tbTypeCheque: TTable;
    tbPartner: TTable;
    tbPersonel: TTable;
    tbMoveMoney: TTable;
    tbGoods: TTable;
    ds3: TDataSource;
    tbAddressParner: TTable;
    ds4: TDataSource;
    ds5: TDataSource;
    ds6: TDataSource;
    tbTypeGoods: TTable;
    tbProducerGoods: TTable;
    atncfldGoodsGoodsID: TAutoIncField;
    strngfldGoodsGTitle: TStringField;
    intgrfldGoodsGLength: TIntegerField;
    intgrfldGoodsGWidth: TIntegerField;
    strngfldGoodsGColor: TStringField;
    strngfldGoodsGImageCode: TStringField;
    //crncyfldGoodsGPriceSquare: TCurrencyField;
    intgrfldGoodsGCount: TIntegerField;
    intgrfldGoodsGMadeIn: TIntegerField;
    strngfldGoodsGInfo: TStringField;
    intgrfldGoodsGType: TIntegerField;
    atncfldMoveMoveID: TAutoIncField;
    intgrfldMoveMGoods: TIntegerField;
    intgrfldMoveMCount: TIntegerField;
    crncyfldMoveMPrice: TCurrencyField;
    intgrfldMoveMChequeID: TIntegerField;
    strngfldMoveName: TStringField;
    intgrfldMoveWidth: TIntegerField;
    intgrfldMoveLength: TIntegerField;
    tbExpenses: TTable;
    ds7: TDataSource;
    crncyfldMoveMToPayment: TCurrencyField;
    atncfldMoveMoneyMoveMoneyID: TAutoIncField;
    crncyfldMoveMoneyMMoney: TCurrencyField;
    intgrfldMoveMoneyMmChequeID: TIntegerField;
    intgrfldMoveMoneyMmRespPartner: TIntegerField;
    intgrfldMoveMoneyMmResp: TIntegerField;
    dtfldMoveMoneyMmDate: TDateField;
    strngfldMoveMoneyResp: TStringField;
    strngfldMoveMoneyRespPartner: TStringField;
    ds8: TDataSource;
    tbDetailGoods: TTable;
    atncfldDetailGoodsDetailGoodsID: TAutoIncField;
    intgrfldDetailGoodsDGoods: TIntegerField;
    intgrfldDetailGoodsDAddrPartner: TIntegerField;
    intgrfldDetailGoodsDCount: TIntegerField;
    crncyfldDetailGoodsDPriceCoeff: TCurrencyField;
    intgrfldDetailGoodsDTemp: TIntegerField;
    strngfldDetailGoodsGoods: TStringField;
    intgrfldDetailGoodsWidth: TIntegerField;
    intgrfldDetailGoodsLength: TIntegerField;
    strngfldDetailGoodsArticul: TStringField;
    intgrfldDetailGoodsForMadeIn: TIntegerField;
    strngfldDetailGoodsMadeIn: TStringField;
    intgrfldDetailGoodsForType: TIntegerField;
    strngfldDetailGoodsType: TStringField;
    qryTestGoods: TQuery;
    qrySet: TQuery;
    atncfldPartnerPartnerID: TAutoIncField;
    strngfldPartnerPName: TStringField;
    smlntfldPartnerPCoeff: TSmallintField;
    intgrfldPartnerPRetDays: TIntegerField;
    strngfldPersonelPSurname: TStringField;
    strngfldPersonelPName: TStringField;
    strngfldPersonelPPatronymic: TStringField;
    strngfldPersonelPTelephone: TStringField;
    intgrfldPersonelPAddressPartner: TIntegerField;
    intgrfldPersonelPPartner: TIntegerField;
    strngfldAddressParnerACity: TStringField;
    strngfldAddressParnerAStreet: TStringField;
    strngfldAddressParnerAHouse: TStringField;
    atncfldAddressParnerAddressPartnerID: TAutoIncField;
    intgrfldAddressParnerAPartner: TIntegerField;
    strngfldAddressParnerAInfo: TStringField;
    atncfldPersonelPersonelID: TAutoIncField;
    dtfldPersonelPDOB: TDateField;
    atncfldExpensesExpensesID: TAutoIncField;
    crncyfldExpensesESumm: TCurrencyField;
    strngfldExpensesEInfo: TStringField;
    intgrfldExpensesEResponsible: TIntegerField;
    intgrfldExpensesEChequeID: TIntegerField;
    crncyfldPersonelPFinDelta: TCurrencyField;
    crncyfldAddressParnerASumMoney: TCurrencyField;
    tbMiniReport: TTable;
    dtfldMiniReportMrDate: TDateField;
    intgrfldMiniReportMrAddressPartnerID: TIntegerField;
    crncyfldMiniReportMrMoney: TCurrencyField;
    intgrfldMiniReportMrCarped: TIntegerField;
    intgrfldMiniReportMrElse: TIntegerField;
    intgrfldMiniReportMrMetal: TIntegerField;
    intgrfldMiniReportMrTrack: TIntegerField;
    intgrfldMiniReportMrPicture: TIntegerField;
    strngfldMoveArticul: TStringField;
    fltfldMiniReportMrSqTrack: TFloatField;
    ds9: TDataSource;
    tbGraphWork: TTable;
    ds10: TDataSource;
    atncfldGraphWorkGraphWorkID: TAutoIncField;
    dtfldGraphWorkGWDate: TDateField;
    intgrfldGraphWorkGWAddress: TIntegerField;
    intgrfldGraphWorkGWAlgoritm: TIntegerField;
    strngfldExpensesRespon: TStringField;
    strngfldGraphWorkResponsible: TStringField;
    strngfldMiniReportAddress: TStringField;
    intgrfldGraphWorkGWResp: TIntegerField;
    atncfldChequeChequeID: TAutoIncField;
    dtfldChequeCDate: TDateField;
    intgrfldChequeCAddress: TIntegerField;
    intgrfldChequeCType: TIntegerField;
    crncyfldChequeCPrice: TCurrencyField;
    crncyfldChequeCToPayment: TCurrencyField;
    crncyfldChequeCPayedSum: TCurrencyField;
    intgrfldChequeCWithCheque: TIntegerField;
    intgrfldChequeCResponsible: TIntegerField;
    intgrfldChequeCPartner: TIntegerField;
    intgrfldChequeCRespPartner: TIntegerField;
    intgrfldChequeCAddrPartner: TIntegerField;
    dtmfldChequeCDateTimeTransact: TDateTimeField;
    intgrfldChequeCRespTransact: TIntegerField;
    dtfldChequeCRetDate: TDateField;
    strngfldChequePartner: TStringField;
    strngfldChequeAddress: TStringField;
    strngfldChequeRespAddrPartner: TStringField;
    strngfldChequeRespTransact: TStringField;
    strngfldChequeType: TStringField;
    strngfldChequeRespPartner: TStringField;
    strngfldChequeResponsible: TStringField;
    intgrfldMoveType: TIntegerField;
    strngfldChequeRespName: TStringField;
    crncyfldMiniReportMrValueGoods: TCurrencyField;
    crncyfldMovePriceCount: TCurrencyField;
    ds11: TDataSource;
    strngfldGoodsGFirm: TStringField;
    strngfldGoodsGArticul: TStringField;
    procedure strngfldDetailGoodsGoodsGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure strngfldPersonelPSurnameGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure strngfldAddressParnerACityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tbChequeBeforeDelete(DataSet: TDataSet);
    procedure strngfldMoveNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure crncyfldChequeRemPayGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure strngfldChequeResponsibleGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure intgrfldMoveMCountGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure crncyfldMovePriceCountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure strngfldChequePartnerGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses AutoBot1U, CarpetFieldU;

{$R *.dfm}

{
  Text := strngfldMoveName.Value + '// ' +
    MmToMetre(intgrfldMoveWidth.AsString) + ' X ' +
      MmToMetre(intgrfldMoveLength.AsString);
}

procedure TDM.strngfldDetailGoodsGoodsGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldDetailGoodsGoods.Value + ' / ' +
      MmToMetre(intgrfldDetailGoodsWidth.AsString) + ' * ' +
      MmToMetre(intgrfldDetailGoodsLength.AsString) + ' [' +
      strngfldDetailGoodsMadeIn.Value + ']';
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Auto: TAutoBot1;
begin
  Auto := TAutoBot1.Create;
  tbDetailGoods.Filter := 'DAddrPartner = ' + IntToStr(Auto.Address);
  tbDetailGoods.Filtered := True;
  Auto.Free;
end;

procedure TDM.strngfldPersonelPSurnameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldPersonelPSurname.AsString + ' ' + strngfldPersonelPName.Value
end;

procedure TDM.strngfldAddressParnerACityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldAddressParnerACity.Value + '/' +
    strngfldAddressParnerAStreet.Value + '/' + strngfldAddressParnerAHouse.Value
end;


{ TODO 4 -cDelete : переделать для ValGoods }
procedure TDM.tbChequeBeforeDelete(DataSet: TDataSet);
type
  R = record
    ID,
    Count,
    GType: Integer;
  end;

  MR = array of R;

  procedure PackMR(var m: MR);
  var
    i,
    ii,
    iii: Integer;
  begin
    i := 0;
    repeat
      ii := i + 1;
      while ii < Length(m) do
        if m[i].ID = m[ii].ID then
          begin
            m[i].Count := m[i].Count + m[ii].Count;
            for iii := ii to Length(m) - 2 do
              m[iii] := m[iii + 1];
            SetLength(m, Length(m) - 1);
          end
        else
          Inc(ii);
      Inc(i);
    until i > Length(m) - 2;
  end;         
var
  sCarpet, sElse, sMetal, sTrack, sPicture: Integer;
  sSqTrack: Real;
  sValueGoods: Currency;
  //mGoods: MR;
begin
  sCarpet := 0;
  sElse := 0;
  sMetal := 0;
  sTrack := 0;
  sPicture := 0;
  sSqTrack := 0;
  sValueGoods := 0;

  try
    // инструкция по бизнес правилам
    case TTypeCheque(intgrfldChequeCType.Value) of
      chSale: ;// Продажа
  //    chRetSale: // Возврат продажи
  //    chBuyAtSupp: // Покупка у поставщика
  //    chRetSupp: // Возврат поставки
      chImpOfXsl: // Импорт из Xsl
        begin
          //  Удал. из MOVE, MiniReport, GraphWork

          // Удал. из MoveMoney, MiniReport, GraphWork

          // Удал. из EXPENSES, MiniReport, GraphWork
        end;
  //    chFromVirtual: // Перемещение из базы virtual
  //    chOrder: // Заказ
  //    chRefOrder: // Отказ от заказа
  //    chExpenses: // Расходы
  //    chMonOperat: // Денежные операции
    else
      raise EAbort.Create('Отсутствуют бизнес правила для чека типа: ' +
        intgrfldChequeCType.AsString + ' Обратитесь к разработчику'
      );
    end;

    // связан ли чек
    if intgrfldChequeCWithCheque.Value <> - 1 then
      raise EAbort.Create('Чек связан с др. чеком(ами) бизнес правило удаления отсутствует. Обратитесь к разработчику.');

    // последняя дата
    if dtfldChequeCDate.Value < quQuery('SELECT MAX(MrDate) FROM MiniReport WHERE MrAddressPartnerID =  ' + intgrfldChequeCAddress.AsString) then
      if MessageDlg('Дата чека, который вы хотите удалить: не самая последняя. ' + #13#10 +
          'Вы можите подвергнуть базу риску нарушения ссылочной целосности' + #13#10 +
          'Вы подтвеждаете удаление ?', mtWarning, mbOKCancel, 0) <> mrOk then
        raise EAbort.Create('Отмена удаления');

    // проверяем ссылочную целосность
    tbMove.First;
    with tbMove do
      while not Eof do
      begin
        if not tbDetailGoods.Locate('DetailGoodsID', intgrfldMoveMGoods.Value, [])
            then
          raise EAbort.Create('Нарушена ссылочная целостность ' +
            'таблицы tbMove с записью MooveID: ' + atncfldMoveMoveID.AsString +
            ' отсутствует запись DetailGoodsID: ' + atncfldDetailGoodsDetailGoodsID.AsString +
            ' в табл. DetailGoods')
        else
          case TTypeCheque(intgrfldChequeCType.Value) of
            chImpOfXsl:
              if intgrfldMoveMCount.Value > intgrfldDetailGoodsDCount.Value then
                raise EAbort.Create('Перемещенное кол-во товара больше остатка на складе, - означает что товар уже был продан');
            chSale: ;
          else
            Abort;
          end;

        if not tbGoods.Locate('GoodsID', intgrfldDetailGoodsDGoods.Value, [])
            then
          raise EAbort.Create('Нарушена ссылочная целостность ' +
            'таблицы tbGoodsDetail с записью DetailGoodsID: ' + atncfldDetailGoodsDetailGoodsID.AsString +
            ' отсутствует запись GoodsID: ' + atncfldGoodsGoodsID.AsString +
            ' в табл. Goods')
        else
          if intgrfldDetailGoodsDCount.Value > intgrfldGoodsGCount.Value then
            raise EAbort.Create('Кол-во товара GCount меньше, чем на складе, - ошибка ссылочной целосности обратитесь к разработчику');

        Next;
      end;

    if not tbPersonel.Locate('PersonelID', intgrfldChequeCRespPartner.Value, []) then
      raise EAbort.Create('Данного покупателя не существует');

    // УДАЛЕНИЕ
    // MOVE
    tbMove.First;
    while not tbMove.Eof do
      begin
        //
        tbDetailGoods.Locate('DetailGoodsID', intgrfldMoveMGoods.Value, []);
        tbGoods.Locate('GoodsID', intgrfldDetailGoodsDGoods.Value, []);

        // ЭТОТ раздел для MiniReport
          case cTypeGoods(intgrfldMoveType.Value) of
            tCarpet: sCarpet := sCarpet + intgrfldMoveMCount.Value;
            tElse: sElse := sElse + intgrfldMoveMCount.Value;
            tTrack:
              begin
                if intgrfldDetailGoodsDCount.Value <= 0 then
                  Inc(sTrack);
                sSqTrack := sSqTrack + (intgrfldMoveWidth.Value *
                  intgrfldMoveLength.Value) / 1000000;
                // кол-во
//                  SetLength(mTrack, Length(mTrack) + 1);
//                  mTrack[Length(mTrack) - 1].ID := intgrfldMoveMGoods.Value;
//                  mTrack[Length(mTrack) - 1].Count := intgrfldMoveMCount.Value;
              end;
            tPicture: sPicture := sPicture + intgrfldMoveMCount.Value;
            tMetal: sMetal := sMetal + intgrfldMoveMCount.Value;
          end;
          sValueGoods := sValueGoods + intgrfldMoveMCount.Value *
            crncyfldMoveMPrice.Value;
        //

        // DetailGoods // GOODS

        
        case TTypeCheque(intgrfldChequeCType.Value) of
          chSale:
            begin
              tbDetailGoods.Edit;
              intgrfldDetailGoodsDCount.Value := intgrfldDetailGoodsDCount.Value +
                intgrfldMoveMCount.Value;
              tbDetailGoods.Post;

              tbGoods.Edit;
              intgrfldGoodsGCount.Value := intgrfldGoodsGCount.Value +
                intgrfldMoveMCount.Value;
              tbGoods.Post;
            end;
          chImpOfXsl:
            begin
              tbDetailGoods.Edit;
              intgrfldDetailGoodsDCount.Value := intgrfldDetailGoodsDCount.Value -
                intgrfldMoveMCount.Value;
              tbDetailGoods.Post;

              tbGoods.Edit;
              intgrfldGoodsGCount.Value := intgrfldGoodsGCount.Value -
                intgrfldMoveMCount.Value;
              tbGoods.Post;
            end;
        else
          Abort;
        end;

        

        tbMove.Delete;
      end;

    // корректируем все последущие MiniReport
    case TTypeCheque(intgrfldChequeCType.Value) of
      chSale:
        quQuery(
          'UPDATE MiniReport ' +
            'SET MrCarped = MrCarped + ' + IntToStr(sCarpet) +
              ' , MrElse = MrElse + ' + IntToStr(sElse) +
              ' , MrMetal = MrMetal + ' + IntToStr(sMetal) +
              ' , MrTrack = MrTrack + ' + IntToStr(sTrack) +
              ' , MrPicture = MrPicture + ' + IntToStr(sPicture) +
              ' , MrSqTrack = MrSqTrack + ' + FloatToStrP(sSqTrack) +
              ' , MrValueGoods = MrValueGoods + ' + FloatToStrP(sValueGoods) +
            ' WHERE MrDate >= "' + dtfldChequeCDate.AsString + '" AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString
        );
      chImpOfXsl:
        quQuery(
          'UPDATE MiniReport ' +
            'SET MrCarped = MrCarped - ' + IntToStr(sCarpet) +
              ' , MrElse = MrElse - ' + IntToStr(sElse) +
              ' , MrMetal = MrMetal - ' + IntToStr(sMetal) +
              ' , MrTrack = MrTrack - ' + IntToStr(sTrack) +
              ' , MrPicture = MrPicture - ' + IntToStr(sPicture) +
              ' , MrSqTrack = MrSqTrack - ' + FloatToStr(sSqTrack) +
              ' , MrValueGoods = MrValueGoods - ' + FloatToStrP(sValueGoods) +
            ' WHERE MrDate >= "' + dtfldChequeCDate.AsString + '" AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString
        );
    else
      Abort;
    end;


    // MoveMoney
    tbMoveMoney.First;
    while not tbMoveMoney.Eof do
      begin
        // обновляем денежную сумму в MiniReport
        case TTypeCheque(intgrfldChequeCType.Value) of
          chSale:
            quQuery('UPDATE MiniReport ' +
                'SET MrMoney = MrMoney - ' + crncyfldMoveMoneyMMoney.AsString +
                ' WHERE MrDate >= "' + dtfldMoveMoneyMmDate.AsString + '" AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString);
          chImpOfXsl:
            quQuery('UPDATE MiniReport ' +
                'SET MrMoney = MrMoney + ' + crncyfldMoveMoneyMMoney.AsString +
                ' WHERE MrDate >= "' + dtfldMoveMoneyMmDate.AsString + '" AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString);
        else
          Abort;        
        end;

        // проверяем MiniReport и GraphWork
        // УДАЛЯЕМ запись в MiniReport и GraphWork если для них уникальна
        // запись в CHEQUE и MoveMoney
        if  (0 = quQuery('SELECT COUNT(CDate) FROM Cheque WHERE CAddress = ' +
                intgrfldChequeCAddress.AsString + ' AND CDate = "' + dtfldMoveMoneyMmDate.AsString + '" AND ChequeID <> ' + atncfldChequeChequeID.AsString))
                and
            (0 = quQuery('SELECT COUNT(MoveMoneyID) FROM CHEQUE INNER JOIN MoveMoney ON  (ChequeID = MmChequeID) WHERE CAddress = ' +
                intgrfldChequeCAddress.AsString + ' AND MmDate = "' + dtfldMoveMoneyMmDate.AsString + '" AND ChequeID <> ' + atncfldChequeChequeID.AsString))
                then
          begin
            //
            quQuery('DELETE FROM MiniReport WHERE MrDate = "' + dtfldMoveMoneyMmDate.AsString + '"AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString);
            quQuery('DELETE FROM GraphWork WHERE GWDate = "' + dtfldMoveMoneyMmDate.AsString + '"AND GWAddress = ' + intgrfldChequeCAddress.AsString);
          end;

        tbMoveMoney.Delete;
      end;

    // EXPENSES
    tbExpenses.First;
    while not tbExpenses.Eof do
      tbExpenses.Delete;

    // проверяем MiniReport и GraphWork
    // УДАЛЯЕМ запись в MiniReport и GraphWork если для них уникальна
    // чек для данной даты единственный
    if  (0 = quQuery('SELECT COUNT(CDate) FROM Cheque WHERE CAddress = ' +
            intgrfldChequeCAddress.AsString + ' AND CDate = "' + dtfldChequeCDate.AsString + '" AND ChequeID <> ' + atncfldChequeChequeID.AsString))
            and
        (0 = quQuery('SELECT COUNT(MoveMoneyID) FROM CHEQUE INNER JOIN MoveMoney ON  (ChequeID = MmChequeID) WHERE CAddress = ' +
            intgrfldChequeCAddress.AsString + ' AND MmDate = "' + dtfldChequeCDate.AsString + '" AND ChequeID <> ' + atncfldChequeChequeID.AsString))
        then
      begin
        quQuery('DELETE FROM MiniReport WHERE MrDate = "' + dtfldChequeCDate.AsString + '"AND MrAddressPartnerID = ' + intgrfldChequeCAddress.AsString);
        quQuery('DELETE FROM GraphWork WHERE GWDate = "' + dtfldChequeCDate.AsString + '"AND GWAddress = ' + intgrfldChequeCAddress.AsString);
      end;

    { DONE 4 -oЯ -cУдаление Cheque : Проверять Тип чека для всех CASE }
    // меняем дельту покупателя
    case TTypeCheque(intgrfldChequeCType.Value) of
      chSale:
        begin
          tbPersonel.Locate('PersonelID', intgrfldChequeCRespPartner.Value, []);
          tbPersonel.Edit;
          crncyfldPersonelPFinDelta.Value := crncyfldPersonelPFinDelta.Value -
            crncyfldChequeCPayedSum.Value;
          tbPersonel.Post;
        end;
      chImpOfXsl: ;
    else
      Abort;
    end;      
  except
    on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;
  end;
end;

procedure TDM.strngfldMoveNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := strngfldMoveName.Value + '// ' +
    MmToMetre(intgrfldMoveWidth.AsString) + ' X ' +
      MmToMetre(intgrfldMoveLength.AsString);
end;

procedure TDM.crncyfldChequeRemPayGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := CurrToStr(crncyfldChequeCToPayment.Value - crncyfldChequeCPayedSum.Value)
end;

procedure TDM.strngfldChequeResponsibleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldChequeResponsible.Value + ' ' +
    strngfldChequeRespName.Value
end;

procedure TDM.intgrfldMoveMCountGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cTypeGoods(intgrfldMoveType.Value) = tTrack then
    Text := MmToMetre(intgrfldMoveMCount.AsString) + 'м.'
  else
    Text := intgrfldMoveMCount.AsString
end;

procedure TDM.crncyfldMovePriceCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatCurr('# ##0.00гр', intgrfldMoveMCount.Value * crncyfldMoveMPrice.Value);
end;


// не использовать Field потому что TfmCheque.FormShow(Sender: TObject);
procedure TDM.ds1DataChange(Sender: TObject; Field: TField);
  function AddInfo(var Info: string; r: Real; const v1: string; v2: string = ''): Boolean;
  begin
    Result := False;
    if Abs(r) > 0.0000001 then
      if v2 = '' then
        Info := Info + v1 + ': ' + FloatToStr(r) + v2 + '; '
      else
        Info := Info + v1 + ': ' + Format('%n', [r]) + v2 + '; '
    else
      Exit;
    Result := True;
  end;
var
  vResult: Variant;
  inMony,
  outMony: Currency;

  nSquareTrack: Real;
  nMoney, nValGoods: Currency;
  nCarpet, nElse, nTrack, nPicture, nMetal: Integer;
  nSquareTrackBefo: Real;
  nCarpetBefo, nElseBefo, nTrackBefo, nPictureBefo, nMetalBefo: Integer;
  nMoneyBefo, nValGoodsBefo: Currency;

  Info: string;
begin
  Info := '';
  with fmCheque, qrySet do
    if dbgrd1.Focused then
    begin
      quLastCount(nSquareTrackBefo, nCarpetBefo, nElseBefo, nTrackBefo, nPictureBefo, nMetalBefo, nMoneyBefo, nValGoodsBefo, address, dtfldChequeCDate.AsString);
      quLastCount(nSquareTrack, nCarpet, nElse, nTrack, nPicture, nMetal, nMoney, nValGoods, address, DateToStr(dtfldChequeCDate.Value + 1));

      AddInfo(Info, nCarpet - nCarpetBefo, 'Ковры');
      AddInfo(Info, nElse - nElseBefo, 'Разное');
      AddInfo(Info, nPicture - nPictureBefo, 'Картины');
      AddInfo(Info, nMetal - nMetalBefo, 'Метал');
      AddInfo(Info, nSquareTrack - nSquareTrackBefo, 'Дорожек', 'м.кв.');

      // кассса
      vResult := quQuery('SELECT SUM(MMoney) ' +
        ' FROM "MoveMoney.DB" Movemoney' +
        ' WHERE MmDate = "' + dtfldChequeCDate.AsString + '" AND MMoney > 0'
      );
      if VarIsNull(vResult) then
        inMony := 0
      else
        inMony := vResult;
      vResult := quQuery('SELECT SUM(MMoney) ' +
        ' FROM "MoveMoney.DB" Movemoney' +
        ' WHERE MmDate = "' + dtfldChequeCDate.AsString + '" AND MMoney < 0'
      );
      if VarIsNull(vResult) then
        outMony := 0
      else
        outMony := vResult;
      lblInfoCheque.Caption := '';
      lblInfoCheque.WordWrap := False;
      if (inMony > 0) or (outMony < 0) then
        lblInfoCheque.Caption := lblInfoCheque.Caption + 'Касса: ' +
          FormatCurr('# ##0.00гр ', inMony + outMony);
//          CurrToStr(inMony + outMony) + 'гр. ';
      if (inMony > 0) and (outMony < 0) then
        lblInfoCheque.Caption := lblInfoCheque.Caption +
          'Пришло: ' + FormatCurr('# ##0.00гр', inMony) +
            ' Ушло: ' + FormatCurr('# ##0.00гр', outMony);

      lblInfoCheque.WordWrap := True;
      lblInfoCheque.Caption := lblInfoCheque.Caption + #13#10;
      lblInfoCheque.Width := 500;
      lblInfoCheque.Caption := lblInfoCheque.Caption + Info;
    end;
end;

procedure TDM.strngfldChequePartnerGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldChequeRespPartner.Value + '(' + strngfldChequePartner.Value + ')'
end;

end.
