program Pdata_film;
uses crt, sysutils;

const 
  namafile = 'DataFilm.dat';
type 
  PData = ^TData; 
  TData = record
    judul : String[15];
    sutradara : String[10];
    genre : string[7];
    tahun : integer;
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


procedure tampilDataFilm(var awal,akhir:PData);  // muhammad Yusuf// belum selesai 
var
  p: PData;
  i: integer;
begin 
  if awal=nil then
    begin
      clrscr;
      writeln('---------------------------------------------------------------------');
      writeln('| NO |     Judul Film     | Sutradara | Genre | Tahun | Rating Film |');
      writeln('---------------------------------------------------------------------');
      writeln('-------------- Data kosong atau data belum di inputkan --------------');
      writeln('---------------------------------------------------------------------'); 
      write('tekan enter untuk melanjutkan ....'); readln();   
    end
  else
    begin
      clrscr;
          //   000000000111111111122222222223333333333444444444455555555556666666666
          //   123456789012345678901234567890123456789012345678901234567890123456789
      writeln('---------------------------------------------------------------------');
      writeln('| NO |     Judul Film     | Sutradara | Genre | Tahun | Rating Film |');
      writeln('---------------------------------------------------------------------');
      P := awal;
      while p<>nil do
        for i:=1 to #awal do
          gotoxy(2, i+3);write(i);
          gotoxy(7, i+3);write(P^.judul);
          gotoxy(28, i+3);write(P^.sutradara);
          gotoxy(40, i+3);write(P^.genre);
          gotoxy(48, i+3);write(P^.tahun);
          gotoxy(58, i+3);write(P^.rating);
          P:=P^.next;
        end;
      end;
      writeln();
      write('Tekan enter untuk melanjutkan.');
    end;
end;

procedure sisip_depan(var awal,akhir:PData;data:integer);//Menu --> tambah filem sisip depan // Alif.R.K
var
  
  baru:=PData;
begin
    new(baru);
    baru^.judul:=data;
    baru^.sutradara:=data;
    baru^.genre:=data;
    baru^.tahun:=data;
    baru^.rating:=data;
    baru^.next:=nil;
    baru^.prev:=nil;
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

procedure sisip_belakang(var awal,akhir:PData;data:integer)v;//Menu --> tambah filem sisip belakang // Alif.R.K
var
  baru:=PData;
begin
    new(baru);
    baru^.judul:=data;
    baru^.sutradara:=data;
    baru^.genre:=data;
    baru^.tahun:=data;
    baru^.rating:=data;
    baru^.next:=nil;
    baru^.prev:=nil;
    if awal=nil then
    begin
      awal:=baru;
      akhir:=baru;
    end;
    else
    begin
      baru^.next:=akhir;
      akhir^.prev:=baru;
      akhir:=baru;
    end;
end;

procedure sisip_tengah(var awal,akhir:PData;data:integer);
var 
  posisisisip:integer;
  bantu,baru:PData;
begin
    if awal=nil then 
      sisipdepan(awal,akhir,data)
      else
      begin
          write('Posisi Sisip : ');readln(posisisisip);
          bantu:=awal;
          while(bantu^.info<>posisisisip)and
               (bantu<>akhir) do
               bantu:=bantu^.next;
          if bantu^.info=posisisisip then //jika ditemukan
          begin
                if bantu=awal then
                sisip_depan(awal,akhir,data)
                else
                begin
                
                end;
          end;
      end;
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
