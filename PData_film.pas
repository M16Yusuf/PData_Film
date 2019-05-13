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


procedure tampilDataFilm(var awal:PData);  // muhammad Yusuf// belum selesai 
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

procedure sisipdepan (var awal, akhir : Pdata; data : Tinfo);
var
	baru : Pdata;
begin
	new(baru);
	baru^.info.judul := data.judul;
	baru^.info.sutradara := data.sutradara;
	baru^.info.genre := data.genre;
	baru^.info.tahun := data.tahun;
  baru^.info.Rating := data.rating;
	if awal = nil then
	begin
		awal := baru;
		akhir := baru;
	end
	else
		begin
			baru^.next := awal;
			baru^.prev := akhir;
			akhir^.next := baru;
			awal^.prev := baru;
			awal := baru;
		end;
end;	

procedure sisipbelakang (var awal, akhir : Pdata; data : Tinfo);
var
	baru : Pdata;
begin
	new(baru);
	baru^.info.judul := data.judul;
	baru^.info.sutradara := data.sutradara;
	baru^.info.genre := data.genre;
	baru^.info.tahun := data.tahun;
  baru^.info.rating := data.rating;
	if awal = nil then
	begin
		awal := baru;
		akhir := baru;
	end
	else
		begin
			akhir^.next := baru;
            baru^.prev := akhir;
            baru^.next := awal;
            awal^.prev := baru;
            akhir := baru;
		end;
end;

procedure tambahdata (var awal, akhir : PData; data : Tinfo);
var
   bantu:PData;
begin
     new(bantu);
     bantu^.info.judul := data.judul;
     bantu^.info.sutradara := data.sutradara;
     bantu^.info.genre := data.genre;
     bantu^.info.tahun := data.tahun;
     bantu^.info.rating := data.rating;
     bantu^.prev:=nil;
     bantu^.next:=nil;
     if awal=nil then
     begin
          awal:=bantu;
          akhir:=bantu;
          awal^.prev:=akhir;
          akhir^.next:=awal;
     end
     else
     begin
          bantu^.next:=awal;
          bantu^.prev:=akhir;
          akhir^.next:=bantu;
          awal^.prev:=bantu;
          akhir:=bantu;
     end;
end;

procedure menutambahdatabelakang(data:Tinfo);
begin
	clrscr;
	writeln('Masukan Data');
	writeln('------------------');
	write('Judul 		  : ');readln(data.judul);
	write('Sutradara 	: ');readln(data.Sutradara);
	write('Genre 		  : ');readln(data.genre);
	write('Tahun 		  : ');readln(data.tahun);
  write('rating     : ');readln(data.rating);
	sisipbelakang(awal, akhir, data);
end;

procedure menutambahfilm(data:Tinfo);
var
	x, y, u : integer;
begin
	x := 5;
	y := 1;
	u := 18;
	clrscr;
	gotoxy(x,y+1);writeln('   Masukan Data   ');
	gotoxy(x,y+2);writeln('------------------');
	gotoxy(x,y+3);write('Judul      : ');
	gotoxy(x,y+4);write('Sutradara  : ');
	gotoxy(x,y+5);write('Genre      : ');
	gotoxy(x,y+6);write('Tahun      : ');
  gotoxy(x,y+7);write('rating     : ');
	gotoxy(u,y+3);readln(data.judul);
	gotoxy(u,y+4);readln(data.Sutradara);
	gotoxy(u,y+5);readln(data.genre);
	gotoxy(u,y+6);readln(data.tahun);
  gotoxy(u,y+7);readln(data.rating);
	tambahdata(awal, akhir, data);
	gotoxy(x,y+8);writeln('Data Berhasil di Tambahkan, Tekan enter untuk kembali ke menu.');readln;
	clrscr;
end;

procedure hapusdepan(var awal,akhir:PData);//salman
var
   phapus:PData;
begin
     phapus:=awal;
     if awal=akhir then
        begin
             awal := nil;
             akhir := nil;
        end
     else
         begin
              awal:=awal^.next;
              awal^.prev:=akhir;
              akhir^.next:=awal;
         end;
     dispose(phapus);
     clrscr;
end;
procedure hapusakhir(var awal,akhir:PData);
var
   phapus:PData;
begin
     phapus:=akhir;
     awal^.prev:=akhir;
     akhir^.next:=awal;
     dispose(phapus);
     clrscr;
end;
procedure hapustengah(var awal,akhir:PData);//salman 
var
   phapus:PData;
   posisihapus:string;
   x,y,u:integer;
begin
     if awal=nil then
        writeln('Data Kosong')
     else
     begin
          write('Tulis Judul Film yang akan dihapus : ');readln(posisihapus);
          phapus:=awal;
          while (phapus^.info.Judul<>posisihapus) and (phapus<>akhir) do
          phapus:=phapus^.next;;
          if phapus^.info.Judul=posisihapus then
          begin
               if phapus = awal then
                  hapusdepan( awal, akhir)
               else
               if phapus = akhir then
                  hapusakhir(awal, akhir)
               else
               begin
                    phapus^.prev^.next:=phapus^.next;
                    phapus^.next^.prev:=phapus^.prev;
                    dispose(phapus);
               end;
          end
          else
          begin
               writeln('Data tidak ditemukan');
               readln;
          end;
          clrscr;
end;

procedure menuhapusfilm; //Salman
var
pilih:char;
x,y,u:integer;
begin
     x:=5;
     y:=1;
     gotoxy(x,y+2);writeln('  Menu Hapus  ');
     gotoxy(x,y+2);writeln('--------------');
     gotoxy(x,y+2);writeln('1. Hapus Depan');
     gotoxy(x,y+2);writeln('2. Hapus Belakang');
     gotoxy(x,y+2);writeln('3. Hapus Tengah');
     case pilih of
     '1':begin
              hapusdepan(awal,akhir);
         end;
     '2':begin
              hapusbelakang(awal;akhir);
         end;
     '3':begin
              hapustengah(awal,akhir);
          end;
     end;
end;



function menu :integer;// Alif.R.K
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
  //  bacaFile();
    repeat
        clrscr;
        pilihan_menu := menu();
        case pilihan_menu of 
          1 : menutambahfilm(Tinfo);
          2 : edit_filem;
          3 : menuhapusfilm;
          4 : urut_filem;
          5 : cari_filem;
          6 : tampilDataFilm(awal);
          0 :;
          else writeln('pilihan tidak dikenal');
        end;
    until piihan_menu =0;
   // simpanFile();
end.
