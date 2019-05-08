program Pdata_film;
uses crt;

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

procedure penciptaan(var awal,akhir:PData);
  begin
      awal:=nil;
      akhir:=nil;
  end;

begin
  writeln('hello wolrd');
  writeln('Coba 123');
end.ngentot
