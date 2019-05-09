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
  f : file of PData;
  i : integer;
begin
  assign (f,namafile);
  rewrite(f);
  for i:=1 to banyakdata do 
      write(f,PData);
end;

// Alif
function menu :integer;
  var pil:integer;
begin
    writeln('Aplikasi Data filem');
    writeln('Disusun Oleh : ');
    writeln('  - Alif Ramdhan Kusaeri (10118365)');
    writeln('  - Muhammad Yusup       (10118370)');
    writeln('  - Gifar Fadilah        (10018378)');
    writeln('  - Muhammad Salman.A.F  (10018389)');
    writeln('-----------------------------------');
    writeln();
    writeln('1. Tambah Filem');
    writeln('2. Edit Filem');
    writeln('3. Hapus Filem');
    writeln('4. Urutkan Filem');
    writeln('5. Cari Filem');
    writeln('6. Tampil Filem dari Load');
    writeln('') 
end;

begin
    banyakdata:=0;
    bacaFile();
    repeat
        clrscr;
        piihan_menu := menu();
        case piihan_menu of 
          1 : tambah_filem;
          2 : edit_filem;
          3 : hapus_filem;
          4 : urut_filem;
          5 : cari_filem;
          6 : tambah_filem;
          0 :;
          else writeln('pilihan tidak dikenal');
        end;
    until piihan_menu =0;
    simpanFile();
end.
