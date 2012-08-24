unit ExpensesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, dbcgrids, ComCtrls, Grids,
  DBGrids, AppEvnts;

const
  hInfo = 0;
  hSumm = 1;

type
  TStringGrid = class(Grids.TStringGrid);

  TfmExpenses = class(TForm)
    btnCansel: TBitBtn;
    btnOk: TBitBtn;
    cal1: TMonthCalendar;
    dbgrd1: TDBGrid;
    strngrdExpenses: TStringGrid;
    aplctnvnts1: TApplicationEvents;
    txtExpenses: TStaticText;
    stat1: TStatusBar;
    dblkcbbResponsible: TDBLookupComboBox;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cal1Click(Sender: TObject);
    function TestStrGrid(): Boolean;
    function ifNullAllGrid: Integer;
    procedure aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure strngrdExpensesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormHide(Sender: TObject);
    procedure strngrdExpensesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExpenses: TfmExpenses;

implementation

uses dmCheque, AutoBot1U;

{$R *.dfm}
type
  THackStringGrid = class(TStringGrid)
  end;


procedure TfmExpenses.FormShow(Sender: TObject);
var
  DateExpenses: TDate;
  tmpV: Variant;
begin
//
  strngrdExpenses.Cells[hInfo, 0] := 'Ќаименование покупки';
  strngrdExpenses.Cells[hSumm, 0] := '—умма грн.';

  DateExpenses := LastDate;

  with DM do
    begin
      if not tbMiniReport.Locate('MrDate; MrAddressPartnerID', VarArrayOf(
              [DateExpenses, Address]), []) then
        Abort;
      // ID чека с последним расходом
      tmpV := quQuery('SELECT ChequeID FROM CHEQUE WHERE CType = 11 AND CAddress = ' + IntToStr(Address) + ' AND CDate = "' + DateToStr(DateExpenses) + '"');

      // чек расходов уже существует ?
      if tmpV <> null then
        begin
          if not tbCheque.Locate('ChequeID', tmpV, []) then
            Abort;
          txtExpenses.Caption := crncyfldChequeCPayedSum.AsString;
          tbPersonel.Locate('PersonelID', intgrfldChequeCResponsible.Value, []);
          dblkcbbResponsible.KeyValue := intgrfldChequeCResponsible.Value;
          cal1.Date := dtfldChequeCDate.AsDateTime;
        end
      else
        begin  // чек расходов не существует
          tmpV := quQuery('SELECT MAX(ChequeID) FROM CHEQUE WHERE CAddress = ' + IntToStr(Address) + ' AND CDate = "' + DateToStr(DateExpenses) + '"');
          if tmpV <> null then
            begin
              if not tbCheque.Locate('ChequeID', tmpV, []) then
                Abort;
              dblkcbbResponsible.KeyValue := intgrfldChequeCResponsible.Value;
              cal1.Date := dtfldChequeCDate.AsDateTime;
            end
          else
            cal1.Date := Date;
        end;
      Application.OnIdle := aplctnvnts1Idle;
    end;
end;

procedure TfmExpenses.cal1Click(Sender: TObject);
begin
  if DM.intgrfldChequeCType.Value = Integer(chExpenses) then
    DM.tbCheque.Locate('CType', 1, []);

  with DM, strngrdExpenses do
  if Int(cal1.Date) <= LastDate then
    begin
      cal1.Date := LastDate;
      tbCheque.Locate('CDate; CType', VarArrayOf([cal1.Date, Integer(chExpenses)]), []);
    end else
  if Int(cal1.Date) > Date then
    cal1.Date := Date;    
  DM.tbCheque.Refresh;
  DM.tbMove.Refresh;
  DM.tbExpenses.Refresh;
end;

{ TStringGrid }


function TfmExpenses.TestStrGrid: Boolean;
var
  i: Integer;
begin
  Result := False;
  with strngrdExpenses do
    begin
      if ifNullAllGrid <= 0 then // ищем пустые €чейки
        begin // пустые €чейки не найдены
          for i := 1 to RowCount - 1 do
            if not ifHardStrToFloat(Cells[hSumm, i]) then
              Exit;
          Result := True;
        end;
    end;

end;

function TfmExpenses.ifNullAllGrid: Integer;
var
  i: Integer;
begin
  Result := -1;
  with strngrdExpenses do
    for i := 1 to RowCount - 1 do
      if (Cells[hInfo, i] = '') or (Cells[hSumm, i] = '') then
        begin
          Result := i;
          Break;
        end;
end;

procedure TfmExpenses.aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
var
  i: Integer;
  sum,
  Expens: Currency;
begin
  sum := 0;
  Done := False;

  if dblkcbbResponsible.KeyValue < 1 then
    Exit;

  with strngrdExpenses do
  if TestStrGrid then
    begin
      for i := 1 to RowCount - 1 do
        if ifStrToCurr(Cells[hSumm, i], Expens) then
          sum := sum + Expens
        else
          begin
            Beep;
            stat1.Panels[1].Text := 'Error';
            Sleep(1000);
            stat1.Panels[1].Text := '';
            Break
          end;
      if stat1.Panels[1].Text <> '' then
        stat1.Panels[1].Text := '';
      Done := True; // все ќк
    end
  else
    stat1.Panels[1].Text := '¬ведите сумму и описание расходов';

  stat1.Panels[0].Text := CurrToStr(sum) + ' грн.';
  txtExpenses.Caption := CurrToStr(sum);
end;

procedure TfmExpenses.btnOkClick(Sender: TObject);
var
  Done: Boolean;
  i,
  ii,
  rtmp: Integer;
begin
  ModalResult := 0;

  if (Int(cal1.Date) > Date) or (Int(cal1.Date) < LastDate) then
    Exit;

  aplctnvnts1Idle(Sender, Done);

  if Int(cal1.Date) <> Date then
    if MessageDlg('¬ы подтверждаете выбранную дату ' +
        DateToStr(cal1.Date) + ' ?' + #13#10 +
        'если "да" нажмите Ok', mtInformation, mbOKCancel, 0
        ) <> mrOk then
      Exit;
  
  if not Done then
    Exit;

  with strngrdExpenses do
  for i := 1 to RowCount - 1 do
    begin
      Done := False; // пуста€ €чейка
      for ii := 0 to ColCount - 1 do
        if Cells[ii, i] <> '' then
          begin
            Done := True;
            Break;
          end;
      if not Done then
        with strngrdExpenses do
        begin
          rtmp := i;
          for ii := 0 to ColCount - 1 do
            Cells[ii, i] := '';
          strngrdExpenses.DeleteRow(i);
          if rtmp >= RowCount - 1 then
            Row := rtmp - 1
          else
            Row := rtmp;
        end;
    end;

  ModalResult := 1
end;

procedure TfmExpenses.strngrdExpensesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i,
  rtmp: Integer;
begin
    case Key of
      VK_DOWN:
        with strngrdExpenses do
        if Row = RowCount - 1 then
          if TestStrGrid then
            begin
              RowCount := RowCount + 1;
              FocusCell(hInfo, RowCount - 1, True)
            end;

      VK_DELETE:
        with (Sender as TStringGrid) do
        begin
          if Row = 0 then
            Exit;
          rtmp := Row;
          for i := 0 to ColCount - 1 do
            Cells[i, Row] := '';
          if Row < 2 then
            Exit;
          strngrdExpenses.DeleteRow(Row);
          if rtmp >= RowCount - 1 then
            Row := rtmp - 1
          else
            Row := rtmp;
        end;

      VK_RIGHT:
        with strngrdExpenses do
          if Col < ColCount - 1 then
            FocusCell(Col + 1, Row, True);
    end;
end;

procedure TfmExpenses.strngrdExpensesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    with strngrdExpenses do
      if Col < ColCount - 1 then
        FocusCell(Col + 1, Row, True);
end;

procedure TfmExpenses.FormHide(Sender: TObject);
begin
  dblkcbbResponsible.CloseUp(True);
  Application.OnIdle := nil
end;



end.
