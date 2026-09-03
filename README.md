# BayHosaf Pro - CS2 Özel Build & Canlı Web Radar Sistemi

[![Sürüm](https://img.shields.io/badge/S%C3%BCr%C3%BCm-v2.5_Pro-blue.svg)](#)
[![CS2](https://img.shields.io/badge/CS2-Source_2_Uyumlu-green.svg)](#)
[![Ofset](https://img.shields.io/badge/Ofset-Otomatik_A2X_Senkron-brightgreen.svg)](#)
[![Destek](https://img.shields.io/badge/Discord-faruk__q06__54351-5865F2.svg)](#)

Counter-Strike 2 için optimize edilmiş, dahili canlı Runtime Schema algılayıcılı, otomatik A2X ofset güncelleyicili ve tarayıcı tabanlı Web Radar destekli özel kullanıcı paketidir.

---

## ⚠️ ÇOK ÖNEMLİ: YÖNETİCİ OLARAK ÇALIŞTIRMA GEREKSİNİMİ

> **DİKKAT:** Bu pakette yer alan başlatıcı ve araçların sorunsuz çalışabilmesi için **YÖNETİCİ HAKLARI ŞARTTIR**.

### Neden Yönetici Olarak Çalıştırmak Zorunludur?
1. **Windows UAC ve Bellek Koruma Duvarı:** Counter-Strike 2 (`cs2.exe`) 64-bit korumalı bir süreç olarak çalışır. Standart kullanıcı yetkisiyle açılan bir uygulama, Windows güvenlik politikaları gereği oyun belleğine bağlanamaz ve `Access Denied` (Erişim Engellendi - 0x5) hatası verir.
2. **DLL Enjeksiyonu & Hook Kararlılığı:** DLL'in oyuna aktarılması ve DirectX kancasının sorunsuz bağlanabilmesi için enjektörün tam yönetici ayrıcalığına (SeDebugPrivilege) sahip olması gerekir.
3. **Otomatik Ofset & Ağ İletişimi:** Otomatik güncelleyici (`BayHosaf_Updater.exe`) ve Web Radar sunucusu (`BayHosaf_Web_Radar.exe`) yerel port (8080) ve disk yazma işlemlerini gerçekleştirirken Windows güvenlik engellerine takılmamalıdır.

### Nasıl Çalıştırılmalı?
- **Otomatik Başlatıcı için:** `Oyunu_Baslat.bat` dosyasına **SAĞ TIKLAYIN** ve **"Yönetici olarak çalıştır"** seçeneğini seçin. *(Dosya içinde otomatik yetki yükseltme kodu mevcuttur ancak doğrudan sağ tık yönetici çalıştırmak en yüksek kararlılığı sağlar).*
- **Manuel Enjektör için:** `BayHosaf_Injector.exe` dosyasına **SAĞ TIKLAYIN** ve **"Yönetici olarak çalıştır"** deyin.

---

## 📦 Paket İçeriği (Kullanıcı Dosyaları)

Bu dağıtım paketi, yalnızca son kullanıcıların ihtiyaç duyduğu derlenmiş ikili dosyaları ve konfigürasyonları içerir; kaynak kodu içermez:

| Dosya / Klasör | Açıklama |
| :--- | :--- |
| `Oyunu_Baslat.bat` | **Ana Başlatıcı:** Tek tıkla otomatik ofset kontrolü yapar, Web Radar'ı ve Enjektörü sıralı açar. |
| `BayHosaf.dll` / `BayHosaf_k5.dll` | Oyuna entegre olan optimize edilmiş, crash korumalı ana sistem DLL'i. |
| `BayHosaf_Injector.exe` | Yönetici haklarıyla çalışan hafif ve güvenli 64-bit DLL enjektörü. |
| `BayHosaf_Updater.exe` | Arka planda A2X ve Sezzyaep repo'larını sessizce denetleyen otomatik ofset senkronlayıcı. |
| `BayHosaf_Web_Radar.exe` | Port 8080 üzerinden takıma canlı harita yayını yapan WebSocket sunucusu. |
| `Web_Radar_Baslat.bat` | Web Radar'ı oyundan bağımsız sadece harita izleyicisi olarak çalıştırma kısayolu. |
| `configs_hazir/` | 35 adet hazır profesyonel config profili (Mermi izleri kapalı, FPS optimizasyonlu). |
| `radar_maps/` | 10 resmi CS2 haritasının yüksek çözünürlüklü vektör radar planları. |
| `radar_weapons/` | Canlı radar üzerinde silahları gösteren 50 adet orijinal CS2 SVG ikonu. |
| `offsets.json` | Anlık yerel ofset önbellek verisi. |
| `BENI_OKU.txt` | Hızlı metin tabanlı başlangıç kılavuzu. |

---

## 🚀 Adım Adım Hızlı Başlangıç

### Yöntem 1: Tek Tıkla Otomatik Başlatma (Önerilen)
1. CS2 oyununu açın (veya oyun açılmadan önce başlatın).
2. **`Oyunu_Baslat.bat`** dosyasına sağ tıklayıp **"Yönetici olarak çalıştır"** deyin.
3. Başlatıcı sırasıyla:
   - Ofsetleri A2X üzerinden arka planda kontrol eder.
   - Web Radar sunucusunu arka planda ayağa kaldırır.
   - Enjektörü yönetici olarak ekrana getirir.
4. Enjektör üzerinden DLL'i seçerek enjeksiyonu tamamlayın.
5. Oyun içerisinde menüyü açmak için **[ INSERT ]** veya **[ SHIFT + 0 ]** tuşuna basın.

### Yöntem 2: Manuel Çalıştırma
1. `BayHosaf_Injector.exe` dosyasını sağ tıklayıp Yönetici Olarak çalıştırın.
2. `BayHosaf_k5.dll` veya `BayHosaf.dll` dosyasını seçin.
3. CS2 penceresine enjekte edin.

---

## 🌐 Canlı Web Radar Kullanımı

Web Radar, maç esnasında takım arkadaşlarınıza 2D taktik harita üzerinden anlık düşman ve bomba takibi sunar:
1. `BayHosaf_Web_Radar.exe` çalışırken internet tarayıcınızı açın (Chrome, Edge, Brave vb.).
2. Adres çubuğuna **`http://localhost:8080`** yazın.
3. Takım arkadaşlarınız aynı yerel ağdaysa (veya port yönlendirme / ZeroTier / Radmin VPN ile bağlıysa), yerel IP adresinizi (Örn: `http://192.168.1.X:8080`) onlarla paylaşarak onların da hiçbir program indirmeden haritayı tarayıcılarından canlı izlemelerini sağlayabilirsiniz.

---

## ⚙️ Oyun İçi Kontroller & Kısayollar

- **Menü Aç / Kapat:** `[ INSERT ]` tuşu
- **Alternatif Menü Tuşu (%60 / Numpadsiz Klavyeler):** `[ SHIFT + 0 ]`
- **Hazır Ayarlar (Configs):** Menü açıldığında otomatik olarak dengeli `BayHosaf` profili yüklenir. İsterseniz menüdeki "Kayitlar" sekmesinden 35 farklı hazır profilden dilediğinizi tek tıkla seçebilirsiniz.

---

## 📞 Destek ve İletişim

Her türlü kurulum desteği, soru veya lisans işlemleri için:
- **Discord:** `faruk_q06_54351`
