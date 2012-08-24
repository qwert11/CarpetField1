unit PartnerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TfmPartner = class(TForm)
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dbgrd2: TDBGrid;
    dbgrd3: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPartner: TfmPartner;

implementation

uses dmCheque;

{$R *.dfm}

end.
