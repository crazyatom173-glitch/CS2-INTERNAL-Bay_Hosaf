# BayHosaf Pro - CS2 Özel Build & Canlı Web Radar Sistemi

[![Sürüm](https://img.shields.io/badge/S%C3%BCr%C3%BCm-v2.6_Pro-blue.svg)](#)
[![CS2](https://img.shields.io/badge/CS2-Source_2_Uyumlu-green.svg)](#)
[![Ofset](https://img.shields.io/badge/Ofset-Otomatik_A2X_Senkron-brightgreen.svg)](#)
[![Crash Fix](https://img.shields.io/badge/AT_Crash_Fix-Korumal%C4%B1-success.svg)](#)
[![Destek](https://img.shields.io/badge/Discord-faruk__q06__54351-5865F2.svg)](#)

Counter-Strike 2 için optimize edilmiş, dahili canlı Runtime Schema algılayıcılı, otomatik A2X ofset güncelleyicili, SEH donanım korumalı ve tarayıcı tabanlı Web Radar destekli özel kullanıcı paketidir.

---

## ⚡ Son Güncelleme Notları (v2.6)
* **Anti-Terörist (AT / CT) Çökme Çözümü:** Takım seçme ekranında AT'ye tıklandığı an ajan değiştirici ve model pointer geçişlerinden kaynaklanan çökme SEH donanım istisna koruması (`__try / __except`) ve `safe_read` bellek denetleyicileri ile tamamen giderildi.
* **Sadeleştirilmiş & Dikkat Çekici Dizin Yapısı:** Ana dizindeki kalabalık kaldırıldı. Yalnızca ana çalıştırıcılar kök dizinde tutuldu; radar haritaları, silah ikonları, ofset dosyaları ve hazır profiller `Gerekli_Sistem_Bilesenleri` klasörü altında toplandı.

---

## ⚠️ ÇOK ÖNEMLİ: YÖNETİCİ OLARAK ÇALIŞTIRMA GEREKSİNİMİ

> **DİKKAT:** Bu pakette yer alan başlatıcı ve araçların sorunsuz çalışabilmesi için **YÖNETİCİ HAKLARI ŞARTTIR**.

### Neden Yönetici Olarak Çalıştırmak Zorunludur?
1. **Windows UAC ve Bellek Koruma Duvarı:** Counter-Strike 2 (`cs2.exe`) 64-bit korumalı bir süreç olarak çalışır. Standart kullanıcı yetkisiyle açılan bir uygulama, Windows güvenlik politikaları gereği oyun belleğine bağlanamaz ve `Access Denied` (Erişim Engellendi - 0x5) hatası verir.
2. **DLL Enjeksiyonu & Hook Kararlılığı:** DLL'in oyuna aktarılması ve DirectX kancasının sorunsuz bağlanabilmesi için enjektörün tam yönetici ayrıcalığına (`SeDebugPrivilege`) sahip olması gerekir.
3. **Otomatik Ofset & Ağ İletişimi:** Otomatik güncelleyici (`BayHosaf_Updater.exe`) ve Web Radar sunucusu (`BayHosaf_Web_Radar.exe`) yerel port (8080) ve disk yazma işlemlerini gerçekleştirirken Windows güvenlik engellerine takılmamalıdır.

### Nasıl Çalıştırılmalı?
- **Otomatik Başlatıcı için:** `Oyunu_Baslat.bat` dosyasına **SAĞ TIKLAYIN** ve **"Yönetici olarak çalıştır"** seçeneğini seçin. *(Dosya içinde otomatik yetki yükseltme kodu mevcuttur ancak doğrudan sağ tık yönetici çalıştırmak en yüksek kararlılığı sağlar).*
- **Manuel Enjektör için:** `BayHosaf_Injector.exe` dosyasına **SAĞ TIKLAYIN** ve **"Yönetici olarak çalıştır"** deyin.

---

## 📦 Sade & Düzenli Paket İçeriği

Proje dizini hem temiz hem de tüm önemli bileşenlerin yerli yerinde olduğu iki ana katmandan oluşur:

### 🌟 1. Ana Dizin (Doğrudan Kullanıcı Dosyaları)
| Dosya / Klasör | Açıklama |
| :--- | :--- |
| `Oyunu_Baslat.bat` | **Tek Tıkla Ana Başlatıcı:** Ofset kontrolünü, Web Radar'ı ve Enjektörü otomatik sırayla çalıştırır. |
| `BayHosaf_Injector.exe` | Yönetici haklarıyla çalışan optimize 64-bit DLL enjektörü. |
| `BayHosaf.dll` / `BayHosaf_k5.dll` | Oyuna enjekte edilen, AT-crash korumalı en güncel ana sistem DLL'i. |
| `BENI_OKU.txt` | Hızlı metin tabanlı kurulum ve çalıştırma notları. |
| `README.md` | Proje detayları ve kullanım kılavuzu. |
| 📁 **`Gerekli_Sistem_Bilesenleri/`** | **Önemli Arka Plan ve Veri Dosyaları Klasörü** (Aşağıda detaylandırılmıştır). |

### 📂 2. `Gerekli_Sistem_Bilesenleri/` Klasörü İçeriği
Bu klasör, sistemin arka plan servislerini ve veri kütüphanelerini barındırır:
* **`BayHosaf_Updater.exe`** : Otomatik CS2 ofset denetleyicisi (A2X & Sezzyaep).
* **`BayHosaf_Web_Radar.exe`** : Port 8080 üzerinden mobil/tarayıcı canlı radar sunucusu.
* **`Web_Radar_Baslat.bat`** : Web Radar'ı bağımsız başlatma kısayolu.
* **`configs_hazir/`** : 35 adet hazır profesyonel ayar (Mermi izleri kapalı, AT-crash korumalı).
* **`radar_maps/`** : 10 adet resmi CS2 haritasının yüksek çözünürlüklü vektör planları.
* **`radar_weapons/`** : Radar üzerinde gösterilen 50 adet orijinal CS2 SVG silah simgesi.
* **`offsets.json` & `client_dll.json`** : CS2 güncel bellek ve şema ofset önbellekleri.

---

## 🚀 Adım Adım Hızlı Başlangıç

### Yöntem 1: Tek Tıkla Otomatik Başlatma (Önerilen)
1. CS2 oyununu açın (veya oyun açılmadan önce başlatın).
2. **`Oyunu_Baslat.bat`** dosyasına sağ tıklayıp **"Yönetici olarak çalıştır"** deyin.
3. Başlatıcı sırasıyla:
   - `Gerekli_Sistem_Bilesenleri` içerisinden ofsetleri otomatik kontrol eder.
   - Web Radar sunucusunu arka planda başlatır.
   - Enjektörü yönetici olarak ekrana getirir.
4. Enjektör üzerinden DLL'i seçerek enjeksiyonu tamamlayın.
5. Oyun içerisinde menüyü açmak için **[ INSERT ]** veya **[ SHIFT + 0 ]** tuşuna basın.

### Yöntem 2: Manuel Çalıştırma
1. `BayHosaf_Injector.exe` dosyasını sağ tıklayıp Yönetici Olarak çalıştırın.
2. CS2 sürecini (`cs2.exe`) seçip `BayHosaf.dll` dosyasını enjekte edin.

---

## 🌐 Web Radar & Canlı Harita Erişimi
* **Yerel Tarayıcı:** `http://localhost:8080`
* **Mobil / Tablet / 2. Ekran:** Aynı Wi-Fi ağı üzerindeki herhangi bir cihazdan `http://BILGISAYAR_IP:8080` adresine girerek radar haritasını sıfır gecikmeyle takip edebilirsiniz.

---

## 💬 İletişim ve Destek
Özel lisans, VIP sürümler veya yardım için Discord üzerinden ulaşabilirsiniz:
* **Discord:** `faruk_q06_54351`
