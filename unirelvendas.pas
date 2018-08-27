unit unirelvendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, Grids, DBGrids, ppPrnabl, ppCtrls, ppBands, ppCache,
  ppParameter;

type
  Tfrmrelvendas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    editdata2: TDateTimePicker;
    editdata1: TDateTimePicker;
    BitBtn1: TBitBtn;
    rbPV: TRadioButton;
    rbPVC: TRadioButton;
    rbVPC: TRadioButton;
    ppPV: TppReport;
    ppDBprodutosvendidos: TppDBPipeline;
    sqlPV: TZQuery;
    src: TDataSource;
    sqlPVdata: TDateField;
    sqlPVcodprod: TIntegerField;
    sqlPVdescricao: TStringField;
    sqlPVunivenda: TStringField;
    sqlPVqtd: TFloatField;
    sqlPVpreco: TFloatField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDtInicial: TppLabel;
    ppLabel2: TppLabel;
    ppDtFinal: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    sqlPVC: TZQuery;
    DateField1: TDateField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    srcPVC: TDataSource;
    sqlPVCcodvenda: TIntegerField;
    sqlPVCcodcli: TIntegerField;
    sqlPVCcliente: TStringField;
    ppPVC: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel9: TppLabel;
    ppDTInicial_2: TppLabel;
    ppLabel11: TppLabel;
    ppDTFinal_2: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppParameterList2: TppParameterList;
    ppDBPVC: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText13: TppDBText;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;
    ppVPC: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel19: TppLabel;
    ppDTInicial_3: TppLabel;
    ppLabel21: TppLabel;
    ppDTFinal_3: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText22: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppParameterList3: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    srcVPC: TDataSource;
    sqlVPC: TZQuery;
    sqlVPCcodvenda: TIntegerField;
    sqlVPCdata: TDateField;
    sqlVPChoras: TTimeField;
    sqlVPCcodcli: TIntegerField;
    sqlVPCcliente: TStringField;
    sqlVPCtotal: TFloatField;
    sqlVPCtotalitens: TIntegerField;
    sqlVPCformapgto: TStringField;
    sqlVPClocalentrega: TStringField;
    sqlVPCvendedor: TStringField;
    sqlVPCsituacao: TStringField;
    sqlVPCdesconto: TFloatField;
    sqlVPCsubtotal: TFloatField;
    sqlVPCcodcli2: TIntegerField;
    sqlVPCcliente_1: TStringField;
    sqlVPCregistro: TIntegerField;
    sqlVPCcodvenda_1: TIntegerField;
    sqlVPCcodprod: TIntegerField;
    sqlVPCdescricao: TStringField;
    sqlVPCunivenda: TStringField;
    sqlVPCqtd: TFloatField;
    sqlVPCpreco: TFloatField;
    sqlVPCdesconto_1: TFloatField;
    sqlVPCprecolocacao: TFloatField;
    sqlVPCqtd_1: TLargeintField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText23: TppDBText;
    ppLabel20: TppLabel;
    ppDBText24: TppDBText;
    ppLabel22: TppLabel;
    ppDBText25: TppDBText;
    ppLabel31: TppLabel;
    ppDBText26: TppDBText;
    ppLabel32: TppLabel;
    ppDBText27: TppDBText;
    ppLabel33: TppLabel;
    ppDBText28: TppDBText;
    ppLabel23: TppLabel;
    ppDBText29: TppDBText;
    sqlVPCtotal_item: TCurrencyField;
    ppLabel34: TppLabel;
    ppDBText30: TppDBText;
    ppLine1: TppLine;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sqlVPCCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure consultaProdutosVendidos;
    procedure consultaProdutosVendidosCliente;
    procedure consultaVendasPorClientes;
  end;

var
  frmrelvendas: Tfrmrelvendas;

implementation

uses unidm;

{$R *.dfm}

procedure Tfrmrelvendas.consultaVendasPorClientes;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;
begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d-%.2d-%d', [A, M ,D ]);
dataF:= Format('%.2d-%.2d-%d', [A2, M2 ,D2 ]);

//dataI := datetostr(editdata1.date);
//dataF := datetostr(editdata2.date);
 // showmessage(dataI);
  With sqlVPC do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select dv.*,c.cliente, iv.*, count(iv.codprod) qtd from dadosvendas dv, itensvendas iv, clientes c ');
  Sql.Add('where dv.codvenda=iv.codvenda and dv.codcli = c.codcli   ');
  Sql.Add('and dv.data >= :pInicial and dv.data <=:pFinal   ');
  Sql.Add('group by iv.codprod, dv.data order by c.cliente, dv.codvenda, iv.descricao ');

  ParamByName('pInicial').AsString :=  (dataI);
  ParamByName('pFinal').AsString :=  (dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  end;
  end;

procedure Tfrmrelvendas.consultaProdutosVendidosCliente;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;
begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d-%.2d-%d', [A, M ,D ]);
dataF:= Format('%.2d-%.2d-%d', [A2, M2 ,D2 ]);

//dataI := datetostr(editdata1.date);
//dataF := datetostr(editdata2.date);
 // showmessage(dataI);
  With sqlPVC do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select dv.codvenda,  dv.data,dv.codcli,c.cliente, iv.*, count(iv.codprod) qtd from dadosvendas dv, itensvendas iv, clientes c ');
  Sql.Add('where dv.codvenda=iv.codvenda and dv.codcli = c.codcli   ');
  Sql.Add('and dv.data >= :pInicial and dv.data <=:pFinal   ');
  Sql.Add('group by iv.codprod, dv.data order by c.cliente, iv.descricao ');

  ParamByName('pInicial').AsString :=  (dataI);
  ParamByName('pFinal').AsString :=  (dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  end;
  end;

procedure Tfrmrelvendas.consultaProdutosVendidos;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;
begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d-%.2d-%d', [A, M ,D ]);
dataF:= Format('%.2d-%.2d-%d', [A2, M2 ,D2 ]);

//dataI := datetostr(editdata1.date);
//dataF := datetostr(editdata2.date);
 // showmessage(dataI);
  With sqlPV do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select  dv.data, iv.*, count(iv.codprod) qtd from dadosvendas dv, itensvendas iv ');
  Sql.Add('where dv.codvenda=iv.codvenda   ');
  Sql.Add('and dv.data >= :pInicial and dv.data <=:pFinal   ');
  Sql.Add('group by iv.codprod, dv.data order by iv.descricao ');

  ParamByName('pInicial').AsString :=  (dataI);
  ParamByName('pFinal').AsString :=  (dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  end;
  end;



procedure Tfrmrelvendas.BitBtn1Click(Sender: TObject);
begin
if rbPV.Checked then
begin
consultaProdutosVendidos;
ppDtInicial.Caption:= datetostr(editdata1.date);
ppDtFinal.Caption  := datetostr(editdata2.date);
ppPV.Print;
end else begin
if rbPVC.Checked then
begin
consultaProdutosVendidosCliente;
ppDTInicial_2.Caption:= datetostr(editdata1.date);
ppDTFinal_2.Caption  := datetostr(editdata2.date);
ppPVC.Print;
end else begin
if rbVPC.Checked then
begin
consultaVendasPorClientes;
ppDTInicial_3.Caption:= datetostr(editdata1.date);
ppDTFinal_3.Caption  := datetostr(editdata2.date);
ppVPC.Print;

end;
end;

end;
end;

procedure Tfrmrelvendas.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do m�s %.2d de %d.', [D, M, A]));
editdata1.date:= strtodate( Format('%.2d/%.2d/%d', [D, M, A]));
editdata2.date:= strtodate( Format('%.2d/%.2d/%d', [D, M, A]));

end;

procedure Tfrmrelvendas.sqlVPCCalcFields(DataSet: TDataSet);
begin
  sqlVPCtotal_item.Value :=   sqlVPCpreco.value *  sqlVPCqtd.Value;
end;

end.
