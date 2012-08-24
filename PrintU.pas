unit PrintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, DBTables, Grids, DBGrids, StdCtrls,
  RpCon, RpConDS, RpDefine, RpRave, RvCsStd, ActnList, Menus, uCrystalApi;

type
  TfmPrint = class(TForm)
    tbcFilter: TTabControl;
    pnl1: TPanel;
    dbgrdGoods: TDBGrid;
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
    intgrfldGoodsDetailGoodsID: TIntegerField;
    intgrfldGoodsAddressPartnerID: TIntegerField;
    intgrfldGoodsGType: TIntegerField;
    strngfldGoodsGInfo: TStringField;
    crncyfldGoodsPrSquare: TCurrencyField;
    lbl1: TLabel;
    chkNotNull: TCheckBox;
    btnPrint: TButton;
    rvprjctPrint: TRvProject;
    conGoods: TRvDataSetConnection;
    stat1: TStatusBar;
    intgrfldGoodsGoodsID: TIntegerField;
    btnPrintC: TButton;
    actlst1: TActionList;
    actPrintCennik: TAction;
    actClearList: TAction;
    pm1: TPopupMenu;
    mniClearList: TMenuItem;
    mniN1: TMenuItem;
    edtFind: TEdit;
    actAdd: TAction;
    actAddAllSelect: TAction;
    mniAdd: TMenuItem;
    mniAddAllSelect: TMenuItem;
    edtDiscount: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    strngfldGoodsGColor: TStringField;
    strngfldGoodsGImageCode: TStringField;
    strngfldGoodsGFirm: TStringField;
    procedure qryGoodsCalcFields(DataSet: TDataSet);
    procedure tbcFilterChange(Sender: TObject);
    procedure chkNotNullClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure strngfldGoodsGTitleGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure intgrfldGoodsDCountGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure crncyfldGoodsDPriceCoeffGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgrdGoodsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdGoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actPrintCennikUpdate(Sender: TObject);
    procedure actClearListExecute(Sender: TObject);
    procedure actPrintCennikExecute(Sender: TObject);
    procedure edtFindChange(Sender: TObject);
    procedure edtFindClick(Sender: TObject);
    procedure edtFindDblClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddAllSelectExecute(Sender: TObject);
    procedure edtDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiscountChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetFilter;
    procedure TO_SG_XSL(f: string);
  public
    { Public declarations }
  end;

var
  fmPrint: TfmPrint;

implementation

uses dmCheque, AutoBot1U, ListPriceGoodsU;

var
  LPrice: TListPriceGoods;

{$R *.dfm}

procedure TfmPrint.qryGoodsCalcFields(DataSet: TDataSet);
begin
  if strngfldGoodsTGoods.AsString = 'Ковры' then
        crncyfldGoodsPrSquare.Value := crncyfldGoodsDPriceCoeff.Value * 1000000 /
      intgrfldGoodsGWidth.Value / intgrfldGoodsGLength.Value else
  if strngfldGoodsTGoods.AsString = 'Дорожки' then
        crncyfldGoodsPrSquare.Value := crncyfldGoodsDPriceCoeff.Value * 1000000 /
      intgrfldGoodsGWidth.Value
end;

procedure TfmPrint.SetFilter;
  procedure AddFilter(const F: string);
  begin
    with qryGoods do
      begin
        if Length(Filter) > 0 then
          Filter := Filter + ' AND ' + F
        else
          Filter := F;
      end;
  end;
begin
  with qryGoods do
    begin
      Filter := '';
      if tbcFilter.Tabs[tbcFilter.TabIndex] <> 'все' then
        AddFilter('TGoods = ''' + tbcFilter.Tabs[tbcFilter.TabIndex] + '''');

      if chkNotNull.Checked then
        AddFilter('DCount <> 0');
    end;
  qryGoods.Filtered := True
end;

procedure TfmPrint.tbcFilterChange(Sender: TObject);
begin
  SetFilter
end;

procedure TfmPrint.chkNotNullClick(Sender: TObject);
begin
  SetFilter
end;

procedure TfmPrint.FormShow(Sender: TObject);
var
  s: string;
begin
  LPrice := TListPriceGoods.Create;
  s := Application.ExeName;
  while S[Length(S)]<>'\' do
    Delete(S, Length(S), 1);
  rvprjctPrint.ProjectFile := S + rvprjctPrint.ProjectFile;
  qryGoods.Open;
  PEOpenEngine;
  SetFilter
end;

procedure TfmPrint.FormHide(Sender: TObject);
begin
  PECloseEngine;
  LPrice.Free;
  qryGoods.Close
end;

procedure TfmPrint.strngfldGoodsGTitleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
  function GetText(): string;
  begin
    Result := strngfldGoodsGTitle.Value + ' / ' +
      MmToMetre(intgrfldGoodsGWidth.AsString) + ' * ' +
      MmToMetre(intgrfldGoodsGLength.AsString) + '(' + strngfldGoodsGColor.AsString + ' # ' +
      strngfldGoodsGImageCode.AsString + ')' + strngfldGoodsGFirm.AsString + ' ' +
      //' [' + strngfldGoodsProducerGoods.Value + '](' + strngfldGoodsTGoods.AsString + ') ' +
      strngfldGoodsGInfo.Value
  end;
var
  discount: Real;
  s: string;
begin
  if ifHardStrToFloat(edtDiscount.Text, discount) and (discount > 0)
      and (discount < 100) then
    begin
      if strngfldGoodsTGoods.AsString = 'Дорожки' then
        s := FormatCurr('# ##0.00гр мп', crncyfldGoodsDPriceCoeff.Value * 1000)
      else
        s := FormatCurr('# ##0.00гр', crncyfldGoodsDPriceCoeff.Value);
      Text := GetText + ' {' + s + '}'
    end
  else
    case cTypeGoods(intgrfldGoodsGType.Value) of
      tCarpet, tTrack:   Text := GetText + FormatCurr('# ##0.00гр /мкв', crncyfldGoodsPrSquare.Value);
    else
      Text := GetText
    end;
end;

procedure TfmPrint.intgrfldGoodsDCountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if strngfldGoodsTGoods.AsString = 'Дорожки' then
    Text := MmToMetre(intgrfldGoodsDCount.AsString) + 'м'
  else
    Text := intgrfldGoodsDCount.AsString
end;

procedure TfmPrint.crncyfldGoodsDPriceCoeffGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  discount: Real;
begin
  if ifHardStrToFloat(edtDiscount.Text, discount) and (discount > 0)
      and (discount < 100) then
    discount := (100 - discount) / 100
  else
    discount := 1;

  if strngfldGoodsTGoods.AsString = 'Дорожки' then
    Text := FormatCurr('# ##0.00гр мп', crncyfldGoodsDPriceCoeff.Value * 1000 * discount)
  else
    Text := FormatCurr('# ##0.00гр', crncyfldGoodsDPriceCoeff.Value * discount)
end;

procedure TfmPrint.btnPrintClick(Sender: TObject);
var
  nSquareTrack: Real;
  nCarpet, nElse, nTrack, nPicture, nMetal: Integer;
  nMoney, nValGoods: Currency;
  discount: Real;
  s: string;
begin
  discount := 0;
  if ifHardStrToFloat(edtDiscount.Text, discount) and (discount <> 0) then
    begin
      rvprjctPrint.SetParam('discount', 'Коэфициент цены ' + FloatToStr(- discount) + '%');
      s := ' {Старая цена(гр.)}'
    end
  else
    s := ' Цена(гр/м.кв)';
  rvprjctPrint.SetParam('hPrice', s);
  quLastCount(nSquareTrack, nCarpet, nElse, nTrack, nPicture, nMetal, nMoney, nValGoods, Address);
  rvprjctPrint.SetParam('LastCount',
    'Ковров: ' + IntToStr(nCarpet) + '; Разное: ' + IntToStr(nElse) +
    '; Дорожек: ' + IntToStr(nTrack) + 'шт.,(' + FloatToStr(nSquareTrack) + 'м.кв.)' +
    '; Картин: ' + IntToStr(nPicture) + '; Металл: ' + IntToStr(nMetal)
  );
  rvprjctPrint.SetParam('LastDate', DateToStr(LastDate));
  rvprjctPrint.Execute
end;

type
  THakBookmark = class(TBookmarkList);

procedure TfmPrint.dbgrdGoodsKeyPress                      wDB     wDB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        finally
        EnableControls;
      end;

    #32:  // space
      with dbgrdGoods, dbgrdGoods.DataSource.DataSet, qryGoods do
      try

        DisableControls;

        if SelectedRows.Count > 0  then
          for i := 0 to SelectedRows.Count - 1 do
            begin
              GotoBookmark(TBookmark(SelectedRows[i]));

              if LPrice.ifFind(intgrfldGoodsGoodsID.Value, tmpC, tmpC, CountCennik) then
                LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, CountCennik + 1)
              else
                LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, 1);
            end
        else
          if LPrice.ifFind(intgrfldGoodsGoodsID.Value, tmpC, tmpC, CountCennik) then
            LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, CountCennik + 1)
          else
            LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, 1);

      finally
        EnableControls;
      end;
  end;

  dbgrdGoods.Refresh   
end;

procedure TfmPrint.dbgrdGoodsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCount: Integer;
  tmpC: Currency;
begin
  if not (gdSelected in State) and LPrice.ifFind(intgrfldGoodsGoodsID.Value, tmpC, tmpC, iCount) then
    with dbgrdGoods.Canvas do
    begin
      Brush.Color := clGray;
      FillRect(Rect);
      Font.Color := clWhite;

      if DataCol = 5 then // CountCennik
        TextOut(Rect.Right - TextWidth(IntToStr(iCount)) - 2,
              Rect.Top + 2, IntToStr(iCount)) else
      if Column.Field.DataType = ftString then
        //В строковых полях текст прижимается влево
        TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text)
      else
      //В остальных полях – вправо
        TextOut(Rect.Right - TextWidth(Column.Field.Text) -
          2, Rect.Top + 2, Column.Field.Text)
    end
end;

procedure TfmPrint.actPrintCennikUpdate(Sender: TObject);
var
  tmpI,
  iCount: Integer;
  tmpC: Currency;
begin
  if not LPrice.ifEmpty then
    begin
      LPrice.INFO(iCount, tmpI, tmpI, tmpI, tmpC, tmpC, tmpC);
      (Sender as TAction).Enabled := True;
      if iCount mod 9 <> 0 then
        stat1.SimpleText := 'Выбрано ' + IntToStr(iCount) + ' ценников. Пустых на последней станице ' +
          IntToStr(9 - (iCount mod 9))
      else
        stat1.SimpleText := 'Выбрано ' + IntToStr(iCount) + ' ценников';
    end
  else
    begin
      (Sender as TAction).Enabled := False;
      stat1.SimpleText := ''
    end;
    
end;

procedure TfmPrint.actClearListExecute(Sender: TObject);
begin
  LPrice.Clear;
  dbgrdGoods.Refresh
end;

procedure TfmPrint.TO_SG_XSL(f: string);
const
  ColCount = 7; // 1 - название 2 - тип 3 - дл 4 - ш 5 - цена м.кв. 6 - цена
  // 7 - новая цена
var
  SG: TStringGrid;
  i,
  ii,
  iii,
  iCount: Integer;
  tmpC: Currency;
  discount: Real;
begin
  if ifHardStrToFloat(edtDiscount.Text, discount) and (discount > 0)
      and (discount < 100) then
    discount := (100 - discount) / 100
  else
    discount := 0;
  LPrice.INFO(i, ii, ii, ii, tmpC, tmpC, tmpC);
  SG := TStringGrid.Create(Self as TComponent);
  SG.Visible := False;
  SG.RowCount := i + 1;
  SG.ColCount := ColCount;
  try
    dbgrdGoods.DataSource.DataSet.DisableControls;
    qryGoods.Filtered := False;
    with SG do
      begin
        Cells[0, 0] := 'название';
        Cells[1, 0] := 'тип';
        Cells[2, 0] := 'дл';
        Cells[3, 0] := 'ш';
        Cells[4, 0] := 'цена м.кв';
        Cells[5, 0] := 'цена';
        Cells[6, 0] := 'новая цена';
      end;

    // yfальная Цель StrinGrid
    iii := 1;

    with SG do
    for i := 1 to LPrice.Count do
      begin
        if not qryGoods.Locate('GoodsID', StrToInt(LPrice.ID[i - 1]), []) then
          Continue;
        LPrice.PricePolicy(i - 1, tmpC, tmpC, iCount, ii);
        for ii := 0 to iCount - 1 do
          begin
            Cells[0, iii] := strngfldGoodsGTitle.Value;
            Cells[1, iii] := strngfldGoodsTGoods.Value;
            case cTypeGoods(intgrfldGoodsGType.Value) of
              tCarpet, tTrack:
                begin
                  Cells[2, iii] := MmToMetre(intgrfldGoodsGLength.AsString);
                  Cells[3, iii] := MmToMetre(intgrfldGoodsGWidth.AsString);
                  Cells[4, iii] := FloatToStrP(crncyfldGoodsPrSquare.Value);
                end;
              tElse:
                begin
                  Cells[2, iii] := MmToMetre(intgrfldGoodsGLength.AsString);
                  Cells[3, iii] := MmToMetre(intgrfldGoodsGWidth.AsString);
                end;
            else

            end;
            case cTypeGoods(intgrfldGoodsGType.Value) of
              tTrack:
                begin
                  Cells[5, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value *
                    1000);
                  Cells[6, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value *
                    1000 * discount);
                end;

            else
              Cells[5, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value);
              Cells[6, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value * discount);
            end;
            Inc(iii);
          end;

      end;
    qryGoods.Filtered := True;
    dbgrdGoods.DataSource.DataSet.EnableControls;

    To_Xsl(SG, ExtractFilePath(Application.ExeName) + f);
  finally
    SG.Free;
  end;
end;

procedure TfmPrint.actPrintCennikExecute(Sender: TObject);
const
  Name = 'label.xls';
var
  FWindow: THandle;
  lt: PELogOnInfo;
  FHandleJob: LongInt;
begin
  TO_SG_XSL('label.xls');

  if MessageDlg('Сохраните файл EXCEL с именем label.xls и нажмите ОК', mtInformation,
      mbOKCancel, 0) <> mrOk then
    Exit;

  FWindow:= 0;
  FHandleJob := PEOpenPrintJob(PChar(ExtractFilePath(Application.ExeName) + 'label1.rpt'));

  FillChar(lt, SizeOf(PELogOnInfo), 0);
  lt.StructSize := SizeOf(PELogOnInfo);
  PEGetNthTableLogOnInfo(FHandleJob, 0, lt);
  StrPCopy(@lt.ServerName, ExtractFilePath(Application.ExeName) + Name);
  PESetNthTableLogOnInfo(FHandleJob, 0, lt, False);

  PEOutputToWindow(FHandleJob, PChar(TForm(Self).Caption), 0, 0, 0, 0, 0, FWindow);
  PEStartPrintJob(FHandleJob, True);

  PEClosePrintJob(FHandleJob);
end;

procedure TfmPrint.edtFindChange(Sender: TObject);
begin
  qryGoods.Locate('GTitle', edtFind.Text, [loCaseInsensitive, loPartialKey])
end;

procedure TfmPrint.edtFindClick(Sender: TObject);
begin
  edtFind.SelectAll
end;

procedure TfmPrint.edtFindDblClick(Sender: TObject);
begin
  edtFind.Clear
end;

procedure TfmPrint.actAddExecute(Sender: TObject);
var
  ch: Char;
begin
  ch := #32;
  dbgrdGoodsKeyPress(Sender, ch);
end;

procedure TfmPrint.actAddAllSelectExecute(Sender: TObject);
var
  i: Integer;
begin
      with dbgrdGoods, dbgrdGoods.DataSource.DataSet, qryGoods do
      try

        DisableControls;

        if SelectedRows.Count > 0  then
          for i := 0 to SelectedRows.Count - 1 do
            begin
              GotoBookmark(TBookmark(SelectedRows[i]));
              case cTypeGoods(intgrfldGoodsGType.Value) of
                tTrack: LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, 1);
              else
                LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, intgrfldGoodsDCount.Value);
              end;
            end
        else
          case cTypeGoods(intgrfldGoodsGType.Value) of
            tTrack: LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, 1);
          else
            LPrice.Add(intgrfldGoodsGoodsID.Value, 0, 0, intgrfldGoodsDCount.Value);
          end;

      finally
        EnableControls;
      end;

end;

procedure TfmPrint.edtDiscountKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then
    Key := DecimalSeparator; // запятую заменяем на разделитель для числа

  if Key = '.' then
    Key := DecimalSeparator; // точку заменяем на сепаратор (на всякий случай)

  if not (Key in ['0'..'9','-',DecimalSeparator,#8,#13]) // символы которые пропускаются
    or ((Key = DecimalSeparator) // все цифры знак минус разделитель
    and (POS (DecimalSeparator, edtDiscount.Text) > 0)) // запрет на второй сепаратор
    or ((Key = '-') and (POS ('-', edtDiscount.Text) > 0)) // запрет на второй минус
    or ((Key = '-') and (edtDiscount.SelStart <> 0)) // запрет на минус не вначале цифры
    then // (можно и предыдущей строчки но так лучше для понимания)
  begin
    Key := #0; // запрещенный символ заменяем нулем
    MessageBeep (MB_OK); // биб в спикир
  end;
end;

procedure TfmPrint.edtDiscountChange(Sender: TObject);
begin
  if (edtDiscount.Text = '') or ifHardStrToFloat(edtDiscount.Text) then
    dbgrdGoods.Refresh
end;

procedure TfmPrint.btn1Click(Sender: TObject);
const
  ColCount = 9; // 1 - название 2 - тип 3 - дл 4 - ш 5 - цена м.кв. 6 - цена
  // 7 - новая цена
  f = 'end.xls';
var
  SG: TStringGrid;
  iii: Integer;
  discount: Real;
begin
  if ifHardStrToFloat(edtDiscount.Text, discount) and (discount > 0)
      and (discount < 100) then
    discount := (100 - discount) / 100
  else
    discount := 0;
  //LPrice.INFO(i, ii, ii, ii, tmpC, tmpC, tmpC);
  SG := TStringGrid.Create(Self as TComponent);
  SG.Visible := False;
  SG.RowCount := qryGoods.RecordCount + 1;
  SG.ColCount := ColCount;
  try
    dbgrdGoods.DataSource.DataSet.DisableControls;
    //qryGoods.Filtered := False;
    with SG do
      begin
        Cells[0, 0] := 'Артикул.';
        Cells[1, 0] := 'Товар';
        Cells[2, 0] := 'тип';
        Cells[3, 0] := 'Длина';
        Cells[4, 0] := 'Ширина';
        Cells[5, 0] := 'цена м.кв';
        Cells[6, 0] := 'цена';
        Cells[7, 0] := 'новая цена';
        Cells[8, 0] := 'В налич.';
      end;

    // yfальная Цель StrinGrid
    iii := 1;

    qryGoods.First;
    with SG do
    while not qryGoods.Eof do
      begin
        Cells[0, iii] := strngfldGoodsGArticul.Value;
        Cells[1, iii] := strngfldGoodsGTitle.Value;
        Cells[2, iii] := strngfldGoodsTGoods.Value;
        case cTypeGoods(intgrfldGoodsGType.Value) of
          tCarpet, tTrack:
            begin
              Cells[3, iii] := MmToMetre(intgrfldGoodsGLength.AsString);
              Cells[4, iii] := MmToMetre(intgrfldGoodsGWidth.AsString);
              Cells[5, iii] := FloatToStrP(crncyfldGoodsPrSquare.Value);
            end;
          tElse:
            begin
              Cells[3, iii] := MmToMetre(intgrfldGoodsGLength.AsString);
              Cells[4, iii] := MmToMetre(intgrfldGoodsGWidth.AsString);
            end;
        else

        end;

        case cTypeGoods(intgrfldGoodsGType.Value) of
          tTrack:
            begin
              Cells[6, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value *
                1000);
              Cells[7, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value *
                1000 * discount);
            end;

        else
          Cells[6, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value);
          Cells[7, iii] := FloatToStrP(crncyfldGoodsDPriceCoeff.Value * discount);
        end;
        Cells[8, iii] := intgrfldGoodsDCount.AsString;
        
        qryGoods.Next;
        Inc(iii)
      end;
    //qryGoods.Filtered := True;
    dbgrdGoods.DataSource.DataSet.EnableControls;

    To_Xsl(SG, ExtractFilePath(Application.ExeName) + f);
  finally
    SG.Free;
  end;
end;

end.


