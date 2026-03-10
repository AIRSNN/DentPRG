# UI / UX Guidelines

Bu belge DentPRG projesinin gorsel ve deneyimsel tasarim anayasasidir. Amac, masaustu odakli, premium algi olusturan ve macOS esintili ama onu kopyalamayan rafine bir arayuz dili tanimlamaktir.

## Tasarim Vizyonu

- Arayuz ilk bakista sakin, temiz ve pahali hissettirmelidir.
- Bilesenler sert kontrastla degil, katman hissi ve yumusak golgelerle ayrismalidir.
- Ekranlar bilgi agirlikli olabilir; buna ragmen kalabalik veya kurumsal olarak soguk gorunmemelidir.
- Klinik yazilimi oldugu icin guven, duzen ve profesyonellik hissi her zaman korunmalidir.

## Genel Tasarim Prensipleri

- Keskin kenarlar yerine rounded-card mimarisi kullanilacak.
- Kartlar zeminden hafifce yukselen fiziksel objeler gibi hissettirilmelidir.
- Beyaz veya koyu zemin uzerine direkt sert sinirlar binmek yerine yumusak gecisler tercih edilmelidir.
- Her ekranda bosluk kullanimi premium alginin ana bileseni olarak ele alinmalidir.
- Renkler bagirmaz; vurgu gereken yerde kontrollu sekilde kullanilir.

## Tema Stratejisi

### Acik Tema

- Varsayilan ana deneyim acik tema uzerinden kurgulanacaktir.
- Ana zemin saf beyaz yerine hafif kirik, yumusak ve sicak olmayan bir ton kullanmalidir.
- Kart yuzeyleri arka plandan ton farki ve soft-shadow ile ayrismalidir.
- Border kullanimi minimumda tutulmalidir; gerekiyorsa cok dusuk opaklikla destekleyici rolde kullanilmalidir.

### Koyu Tema

- Koyu tema, acik temanin tersine cevrilmis hali gibi gorunmemelidir.
- Tam siyah yerine derin, yumusak ve premium koyu tonlar tercih edilmelidir.
- Koyu zeminde de kartlar sadece border ile degil, yuzey farki, ic isik dengesi ve yumusak dis golgelerle ayrismalidir.
- Kontrast okunabilirligi garanti etmeli ancak neon veya asiri parlak etki olusturmamalidir.

## macOS Benzeri Katman ve Golge Mimarisi

### Soft-Shadow Felsefesi

- Golgeler kisa ve sert degil, genis alanli ve yumusak dagilimli olmalidir.
- Tek katmanli koyu golge yerine, gerekirse birden fazla dusuk opaklikli golge ust uste kullanilabilir.
- Golge, dikkat ceken bir efekt degil; bilesenin premium kalitesini hissettiren arka plan aracidir.

### Kartlarin Zeminden Ayrisma Mantigi

- Kart ayrismasi uc arac ile saglanir: yuzey tonu farki, yumusak golge ve yeterli bosluk.
- Kartlarin birbirinden ayrismasi icin asiri border veya sert separator kullanilmamalidir.
- Yuksek onemli kartlar daha buyuk paddingle ve daha belirgin hacim hissiyle one cikabilir.
- Ikincil kartlarda daha sakin bir yukselme dili kullanilmalidir.

### Yuzey Hiyerarsisi

- Seviye 0: Ana uygulama zemini
- Seviye 1: Ana icerik panelleri ve sidebar alani
- Seviye 2: Bilgi kartlari, ozet kutulari, takvim panelleri
- Seviye 3: Modal, acilir panel, floating action alanlari

Her ust seviye, daha fazla kontrast veya daha sert border ile degil; daha dikkatli yuzey ayrimi ve daha net derinlik hissi ile tanimlanmalidir.

## Yuvarlaklik ve Form Dili

- Kose yaricaplari belirgin olacak, ancak oyuncak hissi vermeyecek.
- Uygulama genelinde tutarli radius sistemi kullanilmalidir.
- Buyuk konteynerler ile kucuk aksiyon bilesenleri ayni radius ailesinden gelmelidir.
- Pill form yalnizca secili filtre, durum etiketi veya ikincil aksiyonlarda kontrollu sekilde kullanilmalidir.

## Tipografi Felsefesi

- Tipografi modern, temiz ve masaustu urun ciddiyetine uygun olmalidir.
- Basliklar guclu hiyerarsi kurmali ancak gosterisli olmamalidir.
- Govde metinleri uzun sureli kullanimda goz yormamalidir.
- Sayisal veriler, finansal alanlar ve takvim bloklarinda okunabilirlik onceliklidir.

### Tipografik Hedefler

- Baslik: net, rafine, premium
- Govde: sade, yuksek okunabilirlik
- Yardimci metin: dusuk kontrastli ama rahat secilebilir
- Sayisal metin: duzenli hizalanabilir ve guven veren gorunum

## Renk Paleti Felsefesi

- Ana palet klinik guven hissi vermeli; asiri canli veya oyuncu tonlardan kacinilmalidir.
- Mavi, teal, soft mint, kirik gri ve kontrollu warm-neutral tonlar ana referans olabilir.
- Basari, uyari ve hata renkleri klasik sistem renkleri gibi kaba durmamalidir; daha yumusak ama ayirt edilebilir versiyonlari kullanilmalidir.
- Vurgu rengi bir urun kimligi tasiyaacak; bu nedenle fazla sayida ana vurgu rengi kullanilmamalidir.

## Yerlesim Kurallari

- Masaustu ana kirilim hedeflenecektir.
- Sol tarafta kalici bir navigasyon omurgasi bulunmasi beklenir.
- Icerik alani nefes alan grid mantigiyla ilerlemelidir.
- Ust alanda baslik, filtre, tarih veya hizli aksiyonlar icin dengeli bir toolbar mantigi kurulabilir.
- Kartlar arasi bosluk, premium algi icin minimum gereklilik olarak ele alinmalidir.

## Bilesen Davranis Prensipleri

- Hover durumlari masaustu deneyiminin ana parcasi olacaktir.
- Hover etkileri sert renk degisimiyle degil, hafif yuzey gecisi, yumusak shadow degisimi veya ince hareket hissi ile verilmelidir.
- Secili durumlar cok net ama bagirmayan sekilde ayristirilmalidir.
- Butonlarin hiyerarsisi ana, ikincil ve hayalet aksiyon mantiginda kurulmalidir.

## Ikonografi

- Ikonlar ince, temiz ve modern bir karakter tasimalidir.
- Ikon kalinliklari tutarli olmali, farkli ailelerden gelmis gibi gorunmemelidir.
- Ikonlar dekoratif degil, bilgi ve aksiyon netligi icin kullanilmalidir.

## Kacinilacak Yaklasimlar

- Jenerik SaaS panel estetigi
- Asiri sert divider ve cizgiler
- Yuksek doygunluklu renk patlamalari
- Asiri cam efekti veya gereksiz blur kullanimi
- Her alani kartlastirarak anlamsiz parcalanma olusturmak
- Mobil-first hissi veren sikisik masaustu yerlesimleri

## Kullanici Deneyimi Hedefi

Kullanici uygulamayi actiginda sunu hissetmelidir: bu urun duzenli, guvenilir, modern ve premium; ayni zamanda gun boyu kullanilabilir kadar sakin ve profesyonel.
