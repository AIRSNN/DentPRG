# DentPRG - Premium Diş Kliniği Yönetim Sistemi (UI/UX Demo)

DentPRG, küçük ve orta ölçekli diş klinikleri için tasarlanmış, Flutter Desktop tabanlı premium bir UI/UX demo projesidir. Bu proje, sektörde sık görülen karmaşık ve jenerik SaaS panel görünümlerinden uzak; macOS hissiyatı taşıyan, karakterli, rafine ve kullanımı keyifli bir masaüstü deneyimi sunmayı amaçlar.

Şu anki sürüm, güçlü bir ürün vitrini niteliğindedir. Satın alma isteği uyandıran, modern ve davetkâr bir arayüz (UI) iskeleti başarıyla inşa edilmiştir.

## 🎯 Ürün Karakteri ve Tasarım Dili
- **Premium ve Sakin Görünüm:** Sert çizgiler ve göz yoran siyah kenarlıklar yerine, yumuşak katman hissi (SoftCard), yuvarlatılmış yüzeyler ve düşük kontrastlı ayırıcılar.
- **Odaklı Yerleşim:** Bilgi yoğunluğunu yormadan sunan, geniş boşlukların (padding/margin) cesurca kullanıldığı kart tabanlı düzen.
- **Karanlık / Aydınlık Mod (Dark/Light Mode):** Tüm sistem renk paleti her iki temaya da %100 uyumlu ve tek tıkla geçiş yapılabilir şekilde tasarlandı.

## 🚀 Hızlı Deneyim (Kurulumsuz Çalıştırma)
Projeyi denemek için bilgisayarınıza Flutter veya herhangi bir kod editörü kurmanıza gerek yoktur!
Özel diş temalı logosuyla derlenmiş hazır Windows sürümünü tek tıkla çalıştırabilirsiniz:
1. Repoyu bilgisayarınıza indirin (ZIP olarak veya Clone ile).
2. `exe` klasörünün içine girin.
3. **`dentprg.exe`** dosyasına çift tıklayarak bu premium deneyimi anında yaşayın.

## 🧩 Tamamlanan Modüller (Faz 1 - 9)
Çok ekranlı gelişmiş bir shell (ana iskelet) navigasyonu üzerine aşağıdaki modüller inşa edilmiştir:

* **Dashboard:** Kliniğin günlük özetini sunan karşılama ekranı.
* **Hastalar:** Şık tablo düzeni, arama/filtreleme alanı ve çoklu veri için sayfalama (pagination) özellikleri.
* **Randevular (Takvim & Liste):** Mini tarih paneli, saat bazlı detaylı grid yapısı, süreye göre esnek boyutlanan pastel renkli randevu blokları.
* **Tedaviler:** Klinik işlem kataloğu, işlemlere özel kategori rozetleri (Cerrahi, Endodonti vb.) ve fiyatlandırma tablosu.
* **Finans / Muhasebe:** Gelir/gider dengesini gösteren şık KPI özet kartları ve "Ödendi/Bekliyor" durum rozetleriyle desteklenmiş son işlemler tablosu.
* **Ayarlar:** Klinik iletişim bilgileri için premium form alanları ve sistem tercihleri için (örn: E-Fatura, SMS) modern switch (aç/kapat) blokları.

## ⚠️ Kapsam ve Sınırlamalar
Bu aşamada proje **yalnızca statik ve mock (sahte) verilerle** çalışmaktadır. Ekranda görülen hastalar, tutarlar ve randevular UI/UX kapasitesini sergilemek içindir.
*Gerçek backend, API entegrasyonu, State Management (Durum Yönetimi), kimlik doğrulama ve veritabanı altyapısı şu an için kapsam dışıdır ve sonraki büyük güncellemelerin konusudur.*

## 📊 Mevcut Durum
- **UI/UX İskeleti:** %100 Tamamlandı (Faz 0 - 9).
- **Kritik Hata Çözümleri:** Responsive overflow (taşma) sorunları ve tipografi hataları giderildi.
- **Sıradaki Adım:** State Management entegrasyonu ve veritabanı / backend mimarisinin kurgulanması.
