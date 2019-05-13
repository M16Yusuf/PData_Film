program Pdata_film;
uses crt, sysutils;

const 
  namafile = 'DataFilm.dat';
type 
  Tinfo = record
    Judul : String[24];
    Sutradara : String[10];
    genre : string[7];
    tahun : integer;
    rating : real;
  end;

  PData = ^TData; 
  TData = record
    info : Tinfo; 
    prev,next:PData;
  end;

var
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


procedure tampilDataFilm(var awal,akhir:PData);  // muhammad Yusuf// belum selesai 
var
  tamp : PData;
  banyakdata: integer;
begin 
  if awal = nil then
    begin
      clrscr;
      writeln('---------------------------------------------------------------------');
      writeln('|      Judul Film       |  Sutradara  | Genre | Tahun | Rating Film |');
      writeln('---------------------------------------------------------------------');
      writeln('-------------- Data kosong atau data belum di inputkan --------------');
      writeln('---------------------------------------------------------------------');   
      write('tekan enter untuk melanjutkan . . .'); readln();
    end    
  else
  if awal<> nil then
    begin    
      clrscr;
          //   000000000111111111122222222223333333333444444444455555555556666666666
          //   123456789012345678901234567890123456789012345678901234567890123456789
      writeln('---------------------------------------------------------------------');
      writeln('|      Judul Film       |  Sutradara  | Genre | Tahun | Rating Film |');
      writeln('---------------------------------------------------------------------');
      tamp := akhir;
      tamp := tamp^.next;
      banyakdata:=4;
      while tamp <> nil do
        gotoxy(1, banyakdata);write('|');
        gotoxy(2, banyakdata);write(tamp^.info.judul);
        gotoxy(25, banyakdata);write('|');
        gotoxy(26, banyakdata);write(tamp^.info.sutradara);
        gotoxy(39, banyakdata);write('|');
        gotoxy(40, banyakdata);write(tamp^.info.genre);
        gotoxy(47, banyakdata);write('|');
        gotoxy(48, banyakdata);write(tamp^.info.tahun);
        gotoxy(55, banyakdata);write('|');
        gotoxy(56, banyakdata);write(tamp^.info. rating); 
        gotoxy(69, banyakdata);write('|');
        banyakdata:=banyakdata + 1;
      end;       
      write('tekan enter untuk melanjutkan . . .'); readln();
  end;

  

procedure sisip_depan();
begin 
end;

procedure sisip_tengah();
begin
end;

procedure sisip_belakang();
begin
end;

procedure tambah_filem; //Menu tambah filem // Alif.R.K
var 
  piltambah:integer;
  begin
    repeat
      clrscr;
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
