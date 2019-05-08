program Pdata_film;
uses crt, sysutils;

const 
  namafile = 'DataFilm.dat';

type 
  PData = ^TData; 
  TData = record
    Judul : String[15];
    Sutradara : String[10];
    genre : string[7];
    Tahun : integer[4];
    rating : real;
    info : integer;
    prev,next:PData;
  end;

  var 
    banyakdata : integer;
    piihan_menu : integer;
    awal,akhir : PData;

procedure penciptaan(var awal,akhir:PData);
  begin
      awal:=nil;
      akhir:=nil;
  end;


procedure simpanfile();
var 
  f : file of TData;
  i : integer;
begin
  assign (f,namafile);
  rewrite(f);
  for i:=1 to banyakdata do 
      write(f,PData);
end;

begin
  writeln('hello wolrd');
  writeln('Coba 123');
end.
