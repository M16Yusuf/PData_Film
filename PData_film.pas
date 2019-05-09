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
  filem : array[1..maks] of TData;
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

procedure tambah_filem_sisipdepan(var awal,akhir:PData); //Menambahkan Filem // Alif.R.K
var 
  baru:PData;
  begin  
    clrscr;
    if banyakdata<maks then
      begin
        banyakdata:=banyakdata+1;
        writeln('Data filem masuk ke-',banyakdata);
        writeln('Judul filem :');readln(filem[banyakdata].judul_filem);
        writeln('Sutradara   :');readln(filem[banyakdata].sutradara);
        writeln('genre  :');readln(filem[banyakdata].genre);
        writeln('Tahun  :');readln(filem[banyakdata].tahun);
        writeln('taring :');readln(filem[banyakdata].rating);
      end
    else
    begin
      writeln('batas data sudah mencapai batas masksimum');
    end;
    begin
      new(baru);
      baru^.Judul:=data;
      baru^.Sutradara:=data;
      baru^.genre:data;
      baru^.Tahun:=data;
      baru^.rating:=data:
      baru^.prev:=nil;
      baru^.next:=nil;
      if awal=nil then 
      begin
        awal:=baru;
        akhir:=baru;
      end;
      else
      begin
        baru^.next:=awal;
        awal^.prev:=baru;
        awal:=baru;
      end;
    end;
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
          1 : tambah_filem_sisipdepan;
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
