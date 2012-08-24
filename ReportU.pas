unit ReportU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, RpRave, RpDefine, RpCon,
  RpConDS, RpConBDE, StdCtrls, ComCtrls, Buttons, RpRender, RpRenderPDF,
  DBCtrls;

type
  TfmReport = class(TForm)
    qryReport: TQuery;
    ds1: TDataSource;
    dbgrdReport: TDBGrid;
    rvprjctReport: TRvProject;
    conReport: TRvDataSetConnection;
    tbMoveMoney: TTable;
    tbExpenses: TTable;
    dbgrdMove: TDBGrid;
    dbgrdMoveMoney: TDBGrid;
    dbgrdExpenses: TDBGrid;
    ds2: TDataSource;
    ds3: TDataSource;
    ds4: TDataSource;
    conMove: TRvTableConnection;
    conExpenses: TRvTableConnection;
    conMoveMoney: TRvTableConnection;
    dtfldReportCDate: TDateField;
    strngfldReportTypeCheque: TStringField;
    strngfldReportPSurname: TStringField;
    strngfldReportPName: TStringField;
    intgrfldReportChequeID: TIntegerField;
    crncyfldReportCPrice: TCurrencyField;
    crncyfldReportCPayedSum: TCurrencyField;
    crncyfldReportCToPayment: TCurrencyField;
    intgrfldReportCWithCheque: TIntegerField;
    atncfldExpensesExpensesID: TAutoIncField;
    crncyfldExpensesESumm: TCurrencyField;
    strngfldExpensesEInfo: TStringField;
    intgrfldExpensesEResponsible: TIntegerField;
    intgrfldExpensesEChequeID: TIntegerField;
    strngfldExpensesResponsible: TStringField;
    atncfldMoveMoneyMoveMoneyID: TAutoIncField;
    dtfldMoveMoneyMmDate: TDateField;
    crncyfldMoveMoneyMMoney: TCurrencyField;
    intgrfldMoveMoneyMmResp: TIntegerField;
    intgrfldMoveMoneyMmRespPartner: TIntegerField;
    intgrfldMoveMoneyMmChequeID: TIntegerField;
    strngfldMoveMoneyResp: TStringField;
    strngfldMoveMoneyRespPartner: TStringField;
    btnReport: TButton;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    qryMove: TQuery;
    conQMove: TRvDataSetConnection;
    crncyfldMoveMToPayment1: TCurrencyField;
    intgrfldMoveMCount1: TIntegerField;
    crncyfldMoveMPriceMCount: TCurrencyField;
    strngfldMoveGTitle: TStringField;
    strngfldMoveGArticul: TStringField;
    strngfldMoveTGoods: TStringField;
    strngfldMoveProducerGoods: TStringField;
    intgrfldMoveMChequeID1: TIntegerField;
    fltfldMoveGLength1000: TFloatField;
    fltfldMoveGWidth1000: TFloatField;
    strngfldMoveGInfo: TStringField;
    rvrndrpdf1: TRvRenderPDF;
    dblkcbbCType: TDBLookupComboBox;
    chkFilteredTypeCheque: TCheckBox;
    intgrfldReportCType: TIntegerField;
    strngfldMoveGColor: TStringField;
    strngfldMoveGImageCode: TStringField;
    strngfldMoveGFirm: TStringField;
    pnl1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure strngfldReportPSurnameGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnReportClick(Sender: TObject);
    procedure btnDateQueryClick(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure intgrfldMoveMCount1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure strngfldMoveGTitleGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure chkFilteredTypeChequeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetFilter;
  public
    { Public declarations }
  end;

var
  fmReport: TfmReport;

implementation

uses dmCheque, AutoBot1U;

{$R *.dfm}

procedure TfmReport.FormShow(Sender: TObject);
var
  s: string;
begin
  dtpFrom.Date := LastDate;
  dtpTo.Date := LastDate;
  btnDateQueryClick(Sender);
  s := Application.ExeName;
  while S[Length(S)]<>'\' do
    Delete(S, Length(S), 1);
  rvprjctReport.ProjectFile := S + rvprjctReport.ProjectFile;
end;

procedure TfmReport.FormHide(Sender: TObject);
begin
  dblkcbbCType.CloseUp(True);
  qryReport.Close;

  tbMoveMoney.Close;
  tbExpenses.Close;
  qryMove.Close
end;

procedure TfmReport.strngfldReportPSurnameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldReportPSurname.AsString + ' ' + strngfldReportPName.AsString
end;

procedure TfmReport.btnReportClick(Sender: TObject);
var
  nSquareTrack: Real;
  nCarpet, nElse, nTrack, nPicture, nMetal: Integer;
  nMoney, nValGoods: Currency;
  F: string;
begin
  DM.tbAddressParner.Locate('AddressPartnerID', Address, []);
  quLastCount(nSquareTrack, nCarpet, nElse, nTrack, nPicture, nMetal, nMoney, nValGoods, Address);
  with DM do
    rvprjctReport.SetParam('address', strngfldAddressParnerACity.Value + '/' +
      strngfldAddressParnerAStreet.Value + '/' + strngfldAddressParnerAHouse.Value
    );
  rvprjctReport.SetParam('LastCount', 'Касса: ' + FormatCurr('# ##0.00гр', nMoney) + '  ' +
    'Ковров: ' + IntToStr(nCarpet) + '; Разное: ' + IntToStr(nElse) +
    '; Дорожек: ' + IntToStr(nTrack) + 'шт.,(' + FloatToStr(nSquareTrack) + 'м.кв.)' +
    '; Картин: ' + IntToStr(nPicture) + '; Металл: ' + IntToStr(nMetal)
  );

  F := '';
  if qryReport.Filtered then
    F := ' тип чека: ' + dblkcbbCType.Text;
  rvprjctReport.SetParam('FromDateTo', 'C ' + DateToStr(dtpFrom.Date) + ' по ' + DateToStr(dtpTo.Date) + F);
  qryMove.Filtered := False;
  rvprjctReport.Execute;
  qryMove.Filtered := True
end;

procedure TfmReport.btnDateQueryClick(Sender: TObject);
var
  FromD,
  ToDate: TDate;
begin
  FromD := Int(dtpFrom.Date);
  ToDate := Int(dtpTo.Date);
  if ToDate > Date then
    ToDate := Date;

  if FromD > ToDate then
    dtpFrom.Date := dtpTo.Date;

  with qryReport do
  begin

    tbExpenses.Close;
    tbMoveMoney.Close;
    qryMove.Close;
    Close;
    Params[0].AsDate := FromD;
    Params[1].AsDate := ToDate;
    Open;

    tbExpenses.Open;
    tbMoveMoney.Open;
    qryMove.Open;
  end;
end;

procedure TfmReport.ds1DataChange(Sender: TObject; Field: TField);
begin
  if qryMove.Filter <> 'MChequeID = ' + IntToStr(intgrfldReportChequeID.Value) then
    with qryMove do
    begin
      Filter := '';
      Filter := 'MChequeID = ' + IntToStr(intgrfldReportChequeID.Value);
      Filtered := True;
    end;  
end;

procedure TfmReport.intgrfldMoveMCount1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if AnsiLowerCase(strngfldMoveTGoods.AsString) = 'дорожки' then
    Text := MmToMetre(intgrfldMoveMCount1.AsString) + 'м.'
  else
    Text := intgrfldMoveMCount1.AsString
end;

procedure TfmReport.strngfldMoveGTitleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := strngfldMoveGTitle.AsString + '// ' + fltfldMoveGWidth1000.AsString +
    '*' + fltfldMoveGLength1000.AsString + ' (' +
    strngfldMoveGImageCode.Value + ' # ' + strngfldMoveGColor.Value +') [' +
    strngfldMoveGFirm.Value + '](' +
    strngfldMoveTGoods.AsString + ')' + strngfldMoveGInfo.AsString
end;

procedure TfmReport.SetFilter;
var
  F: string;
begin
  F := '';

  // ПО типу чека
  if chkFilteredTypeCheque.Checked and dblkcbbCType.KeyValue > 0 then
    F := F + 'CType = ' + IntToStr(dblkcbbCType.KeyValue);

  with qryReport do
  begin
    if F = '' then
      Filtered := False
    else
      begin
        Filter := F;
        Filtered := True
      end;
  end;
end;

procedure TfmReport.chkFilteredTypeChequeClick(Sender: TObject);
begin
  SetFilter
end;

end.
