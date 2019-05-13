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
  data : Tinfo;

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
      tamp := awal;
      tamp := tamp^.next;
      banyakdata:=4;
      while tamp <> awal do
        gotoxy(1, banyakdata);write('|');
        gotoxy(2, banyakdata);write(tamp^.info.judul);
        gotoxy(25, banyakdata);write('|');
        gotoxy(26, banyakdata);write(tamp^.info.sutradara);
        gotoxy(39, banyakdata);write('|');
        gotoxy(40, banyakdata);write(tamp^.info.genre);
        gotoxy(47, banyakdata);write('|');
        gotoxy(48, banyakdata);write(tamp^.info.tahun);
        gotoxy(55, banyakdata);write('|');
        gotoxy(56, banyakdata);write(tamp^.info. rating:2:0); 
        gotoxy(69, banyakdata);write('|');
        banyakdata:=banyakdata + 1;
      end;       
      readln();
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

procedure tambahdata(var awal, akhir : PData; data : Tinfo);
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

procedure menutambahdatabelakang;
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

procedure menutambahfilm;
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
end;

procedure hapusfilm;
var
  pilih:char;
  x,y:integer;
begin
     x:=5;
     y:=1;
     gotoxy(x,y+1);writeln('  Menu Hapus  ');
     gotoxy(x,y+2);writeln('--------------');
     gotoxy(x,y+3);writeln('1. Hapus Depan');
     gotoxy(x,y+4);writeln('2. Hapus Belakang');
     gotoxy(x,y+5);writeln('3. Hapus Tengah');
     gotoxy(x,y+6);write('Pilhan anda :  ');readln(pilih);
     case pilih of
     '1':begin
              hapusdepan(awal,akhir);
         end;
     '2':begin
              hapusakhir(awal,akhir);
         end;
     '3':begin
              hapustengah(awal,akhir);
          end;
     end;
end;

procedure edit (awal : Pdata; data : Tinfo);
var
	bantu : Pdata;
	cari : string;
	a, b : integer;
begin
	clrscr;
	a := 5;
	b := 1;
	bantu := awal;
	gotoxy(a,b+1);write('Judul yang dicari   : ');readln(cari);
	while (bantu^.info.judul <> cari) and (bantu <> akhir) do
		bantu := bantu^.next;
	if bantu^.info.judul = cari then
	begin
	   	gotoxy(a,b+2);writeln('Judul      : ',data.judul);
     	gotoxy(a,b+3);writeln('Sutradara  : ',data.sutradara);
     	gotoxy(a,b+4);writeln('genre      : ',data.genre);
     	gotoxy(a,b+5);writeln('tahun      : ',data.tahun);
      gotoxy(a,b+6);writeln('rating     : ',data.rating);

     	gotoxy(a,b+7);writeln('Data dirubah menjadi :');
     	gotoxy(a,b+8);write('Judul       : ');
     	gotoxy(a,b+9);write('Sutradara   : ');
     	gotoxy(a,b+10);write('Genre      : ');
     	gotoxy(a,b+11);write('tahun      : ');
      gotoxy(a,b+12);write('rating     : ');

			gotoxy(a+16,b+8);readln(bantu^.info.judul);
			gotoxy(a+16,b+9);readln(bantu^.info.sutradara);
			gotoxy(a+16,b+10);readln(bantu^.info.genre);
			gotoxy(a+16,b+11);readln(bantu^.info.tahun);
      gotoxy(a+16,b+12);readln(bantu^.info.rating);

     	data.judul := bantu^.info.judul;
     	data.sutradara := bantu^.info.sutradara;
     	data.genre := bantu^.info.genre;
     	data.tahun := bantu^.info.tahun;
      data.rating := bantu^.info.rating;

     	gotoxy(a,b+14);writeln('Data berhasil dirubah');readln;
			clrscr;
	end
	else
		writeln('Data tidak ditemukan');
		clrscr;
end;
procedure pengurutanjudul (var awal, akhir : Pdata);
var
	p1,p2,pmin : Pdata;
	temp : Tinfo;
	x, y : integer;
begin
	clrscr;
	x := 5;
	y := 1;
	if awal = nil then
		writeln('Data Kosong')
	else
	begin
		p1 := awal;
		while p1 <> akhir do
		begin
			p2 := p1^.next;
			pmin := p1;
			while p2 <> awal do
			begin
				if p2^.info.judul < pmin^.info.judul then
					pmin := p2;
				p2 := p2^.next;
			end;
			temp := pmin^.info;
			pmin^.info := p1^.info;

			p1^.info := temp;
			p1 := p1^.next;
		end;
	end;
	gotoxy(x,y+8);writeln('Pengurutan judul berhasil. Tekan enter untuk melanjutkan !');readln;
	clrscr;
end;
procedure pengurutanjuduldesc (var awal, akhir : Pdata);
var
	p1,p2,pmin : Pdata;
	temp : Tinfo;
	x, y : integer;
begin
	x := 5;
	y := 1;
	clrscr;
	if awal = nil then
		writeln('Data Kosong')
	else
	begin
		p1 := awal;
		while p1 <> akhir do
		begin
			p2 := p1^.next;
			pmin := p1;
			while p2 <> awal do
			begin
				if p2^.info.judul > pmin^.info.judul then
					pmin := p2;
				p2 := p2^.next;
			end;
			temp := pmin^.info;
			pmin^.info := p1^.info;
			p1^.info := temp;
			p1 := p1^.next;
		end;
	end;
	gotoxy(x,y+8);writeln('Pengurutan judul berhasil. Tekan enter untuk melanjutkan !');readln;
	clrscr;
end;

procedure menu_pengurutan;
var
	x, y : integer;
  pilih:integer;
begin
		 x := 5;
		 y := 1;
     clrscr;
     gotoxy(x,y+1);writeln('Pengurutan Judul film');
     gotoxy(x,y+2);writeln('---------------------');
     gotoxy(x,y+3);writeln('1. Judul (Ascending) ');
     gotoxy(x,y+4);writeln('2. Judul (Descending)'); 
     gotoxy(x,y+6);write('Pilihan  : ');readln(pilih);
     case pilih of
     1 : begin
           pengurutanjudul(awal,akhir);
           end;
     2 : begin
           pengurutanjuduldesc(awal,akhir);
           end;
      end;
end;

procedure pencarianjudul (awal : Pdata);
var
	bantu : Pdata;
	cari : string;
	x, y :integer;
begin
	x := 5;
	y := 1;
	clrscr;
	gotoxy(x,y+1);write('Judul yang dicari   : ');readln(cari);
	bantu := awal;
	while (bantu^.info.judul <> cari) and (bantu <> akhir) do
		bantu := bantu^.next;
	if bantu^.info.judul = cari then
	begin
		gotoxy(x,y+3);writeln('Judul 		  : ',bantu^.info.judul);
		gotoxy(x,y+4);writeln('Sutradara 	: ',bantu^.info.sutradara);
		gotoxy(x,y+5);writeln('Genre 		  : ',bantu^.info.genre);
		gotoxy(x,y+6);writeln('Tahun  	  : ',bantu^.info.tahun);
    gotoxy(x,y+7);writeln('Rating     : ',bantu^.info.rating);
	end
	else
		begin
			writeln('Judul tidak ditemukan');
			readln;
		end;
		readln;
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
    writeln('1. Tambah Film');
    writeln('2. Edit Film');
    writeln('3. Hapus Film');
    writeln('4. Urutkan Film');
    writeln('5. Cari Film');
    writeln('6. Tampil Data Film');
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
          1 : menutambahfilm;
          2 : edit(awal,data);
          3 : hapusfilm;
          4 : menu_pengurutan;
          5 : pencarianjudul(awal);
          6 : tampilDataFilm(awal);
          0 :;
          else writeln('pilihan tidak dikenal');
        end;
    until pilihan_menu = 0;
   // simpanFile();
end.