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
end.


function menu :integer;
  var pil:integer;
begin
    writeln('Aplikasi Data filem');
    writeln('Disusun Oleh : ');
    writeln('  - Alif Ramdhan Kusaeri (10118365)');
    writeln('  - Muhammad Yusup       (10118370)');
    writeln('  - Gifar Fadilah        (10018   )');
    writeln('-----------------------------------');
    writeln();
    writeln('1. Tambah Filem');
    writeln('2. Edit Filem');
    writeln('3. Hapus Filem');
    writeln('4. Urutkan Filem');
    writeln('') 
end;