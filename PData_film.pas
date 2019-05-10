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
  pilihan_menu : integer;
  awal,akhir : PData; 

procedure penciptaan(var awal,akhir:PData);
  begin
      awal:=nil;
      akhir:=nil;
  end;


// procedure simpanfile(); masih on going di cirian meh teu poho dibenrken 
// var 
  // f : file of PData;
  // i : integer;
// begin
  // assign (f,namafile);
  // rewrite(f);
  // for i:=1 to banyakdata do 
      // write(f,PData);
// end;


procedure tampilDataFilm(var awal,akhir:Pdata);  // muhammad Yusuf
var
  i: integer;
begin 
  if (banyakdata>0)then
    begin
      clrscr;
          //   000000000111111111122222222223333333333444444444455555555556666666666
          //   123456789012345678901234567890123456789012345678901234567890123456789
      writeln('--------------------------------------------------------------------');
      writeln('| NO |     Judul Film     | Sutradara | Genre | Tahun | Rating Film |');
      writeln('--------------------------------------------------------------------');
      for i:= 1 to banyakdata do
      begin
          gotoxy(2, i+3);write(i);
          gotoxy(7, i+3);write(PData[i].judul);
          gotoxy(28, i+3);write(PData[i].sutradara);
          gotoxy(40, i+3);write(PData[i].genre);
          gotoxy(48, i+3);write(PData[i].tahun);
          gotoxy(58, i+3);write(Pdata[i].rating);
      end;
      writeln();
      write('Tekan enter untuk melanjutkan.');
    end
    else
      writeln('data tidak ditemukan, atau data kosong ...');
      readln();
end;

procedure sisip_depan;//Menu tambah filem sisip depan // Alif.R.K
var
  piltambah:integer;
begin
  repeat
    clrscr
      
end;


procedure tambah_filem; //Menu tambah filem // Alif.R.K
var 
  piltambah:integer;
  begin
    repeat
      clrscr
        writeln('1.Sisip Depan');
        writeln('2.Sisip Tengah');
        writeln('3.Sisip Belakang');
        writeln('0.Kembali');
        writeln('--------------------------');
        write('Mau tambah dimana : ');readln(piltambah);
        case piltambah of 
            1 : sisip_depan;
            2 : sisip_tengah;
            3 : sisip_belakang;
            0 : ;
            else writeln('pilihan tidak dikenal');
        end;
        until piltambah=0;
  end;

// Alif.R.K
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
    writeln('6. Tampil Data Filem dari Load');
    writeln('-----------------------------------');
    write('Pilhan anda :  '); readln(pil); 
    menu := pil;
end;

begin
    banyakdata:=0;
    bacaFile();
    repeat
        clrscr;
        pilihan_menu := menu();
        case pilihan_menu of 
          1 : tambah_filem;
          2 : edit_filem;
          3 : hapus_filem;
          4 : urut_filem;
          5 : cari_filem;
          6 : tampilDataFilm;
          0 :;
          else writeln('pilihan tidak dikenal');
        end;
    until piihan_menu =0;
    simpanFile();
end.
