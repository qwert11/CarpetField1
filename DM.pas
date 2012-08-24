unit DM;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDM1 = class(TDataModule)
    dbCarpetField: TDatabase;
    tbl1: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

end.
