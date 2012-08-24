program CarpetField;

uses
  Forms,
  CarpetFieldU in 'CarpetFieldU.pas' {fmCheque},
  dmCheque in 'dmCheque.pas' {DM: TDataModule},
  PartnerU in 'PartnerU.pas' {fmPartner},
  AutoBot1U in 'AutoBot1U.pas',
  XlsTableU in 'XlsTableU.pas' {fmXlsTable},
  EditChqU in 'EditChqU.pas' {fmEditCheque},
  GoodsU in 'GoodsU.pas' {fmGoods},
  MinReportU in 'MinReportU.pas' {fmMinReport},
  ExpensesU in 'ExpensesU.pas' {fmExpenses},
  ForRunOrderU in 'ForRunOrderU.pas' {fmForRunOrder},
  Pricing_PolicyU in 'Pricing_PolicyU.pas' {fmPricing_Policy},
  ReportU in 'ReportU.pas' {fmReport},
  MoneyTransactU in 'MoneyTransactU.pas' {fmMoneyTransact},
  RetSaleU in 'RetSaleU.pas' {fmRetSale},
  ListPriceGoodsU in 'ListPriceGoodsU.pas',
  PayOrderU in 'PayOrderU.pas' {fmPayOrder},
  PrintU in 'PrintU.pas' {fmPrint},
  uCrystalAPI in 'uCrystalApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmCheque, fmCheque);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmPartner, fmPartner);
  Application.CreateForm(TfmXlsTable, fmXlsTable);
  Application.CreateForm(TfmEditCheque, fmEditCheque);
  Application.CreateForm(TfmMinReport, fmMinReport);
  //Application.CreateForm(TfmPrint, fmPrint);
  //Application.CreateForm(TfmMoneyTransact, fmMoneyTransact);
  Application.CreateForm(TfmPayOrder, fmPayOrder);
  //Application.CreateForm(TfmRetSale, fmRetSale);
  //Application.CreateForm(TfmPricing_Policy, fmPricing_Policy);
  //Application.CreateForm(TfmReport, fmReport);
  { TODO : Удалить Создание форм }
  //Application.CreateForm(TfmForRunOrder, fmForRunOrder);
  //Application.CreateForm(TfmExpenses, fmExpenses);
  //Application.CreateForm(TfmGoods, fmGoods);

  try
    //DM.SetConnection;//установка соединения - здесь генерируется исключение при неудачном соединении
    //Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  except

      Application.MessageBox('Ура ЭТО отловилась глобальная ошибка', '', 0)
  end;
  
end.
