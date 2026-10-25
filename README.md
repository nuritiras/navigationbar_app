# Flutter NavigationBar ile Değerler Eğitimi Uygulaması

Bu proje, Flutter ve Material 3 kullanılarak hazırlanmış basit bir
**Değerler Eğitimi** mobil uygulamasıdır. Uygulama, `NavigationBar`
bileşeniyle üç bölüm arasında geçiş yapmayı öğretirken
**saygı, temizlik ve mahremiyet** konularını işler.

## Makale

Uygulamanın eğitim makalesine şu bağlantıdan ulaşabilirsiniz:

[Flutter'da NavigationBar Kullanımı -- Pardus
Flutter](https://pardusflutter.blogspot.com/2026/10/flutterda-navigationbar-kullanm.html)

## Uygulamanın Özellikleri

-   Material 3 tasarım sistemi kullanılır.
-   Alt gezinme çubuğunda üç bölüm bulunur:
    -   **Ana Sayfa:** Değerler eğitimi hakkında kısa mesajlar ve bilgi
        kartları.
    -   **Değerlerimiz:** Saygı, temizlik ve mahremiyet için açıklama,
        günlük yaşam örneği ve görev önerileri.
    -   **Etkinlikler:** Günlük görevleri işaretleme, tamamlanan görev
        sayısını görme ve ilerleme çubuğunu takip etme.
-   Seçili gezinme öğesi `selectedIndex` değişkeniyle tutulur.
-   `setState()` ile seçilen bölüm ve etkinlik işaretlemeleri ekrana
    yansıtılır.
-   `NavigationDestination` öğelerinde normal ve seçili durumlar için
    farklı ikonlar kullanılır.

## Kullanılan Teknolojiler

-   [Flutter](https://flutter.dev/)
-   [Dart](https://dart.dev/)
-   Material 3 (`ThemeData(useMaterial3: true)`)
-   `NavigationBar`, `NavigationDestination`, `Scaffold`, `Card`,
    `ListView`, `CheckboxListTile` ve `LinearProgressIndicator`
    widget'ları

## Ekranlar

### 1. Ana Sayfa

"Değerlerle Güzel Bir Gelecek" başlığıyla saygı, temizlik ve mahremiyet
değerlerini tanıtır. Bilgi kartları aracılığıyla günlük davranışlara
yönelik kısa öneriler sunar.

### 2. Değerlerimiz

Her değer için şu bilgiler gösterilir:

-   Değerin kısa açıklaması
-   Günlük hayattan bir örnek
-   Öğrencinin uygulayabileceği bir görev

### 3. Etkinlikler

Üç günlük görev, onay kutuları ile takip edilir. Tamamlanan görev sayısı
ve ilerleme çubuğu anlık olarak güncellenir. Bu görev durumu örnek
uygulamada uygulama belleğinde tutulur; uygulama kapatılıp yeniden
açıldığında kalıcı olarak saklanmaz.

## Kurulum ve Çalıştırma

Bilgisayarınızda Flutter SDK kurulu olmalıdır.

1.  Bu depoyu bilgisayarınıza indirin veya klonlayın.
2.  Terminalde Flutter projesinin bulunduğu dizine geçin.
3.  Paketleri kontrol edin ve uygulamayı başlatın:

``` bash
flutter pub get
flutter run
```

> Bu kodu çalıştırmak için standart bir Flutter proje yapısı gerekir.
> Kaynak kodu `lib/main.dart` dosyasına yerleştirebilirsiniz.

## Öne Çıkan Kod Kavramları

### NavigationBar ile sayfa seçimi

`selectedIndex`, hangi bölümün seçili olduğunu belirler. Kullanıcı bir
hedef seçtiğinde `onDestinationSelected` çağrılır ve `setState()` ile
indeks güncellenir.

``` dart
NavigationBar(
  selectedIndex: selectedIndex,
  onDestinationSelected: (int index) {
    setState(() {
      selectedIndex = index;
    });
  },
  destinations: const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Ana Sayfa',
    ),
    NavigationDestination(
      icon: Icon(Icons.favorite_outline),
      selectedIcon: Icon(Icons.favorite),
      label: 'Değerler',
    ),
    NavigationDestination(
      icon: Icon(Icons.checklist_outlined),
      selectedIcon: Icon(Icons.checklist),
      label: 'Etkinlikler',
    ),
  ],
)
```

### İçeriği seçilen bölüme göre gösterme

`sayfaIcerigi()` metodu, `selectedIndex` değerine göre uygun widget'ı
döndürür. Böylece `Scaffold` içindeki `body` alanı seçilen bölüme göre
değişir.

### Etkinlikleri takip etme

Etkinlikler sayfasında görevlerin tamamlanma durumları bir `List<bool>`
listesinde tutulur. `where((gorev) => gorev).length` ifadesi tamamlanan
görevleri sayar; bu sayı `LinearProgressIndicator` bileşeninin ilerleme
değerini belirler.

## Eğitimde Kullanım

Bu proje, Bilişim Teknolojileri alanı Yazılım Geliştirme dalı **11.
sınıf Mobil Uygulamalar** dersi kapsamında aşağıdaki konuları uygulamalı
anlatmak için kullanılabilir:

-   `NavigationBar` ve `NavigationDestination`
-   `StatefulWidget` ve `StatelessWidget`
-   `setState()` ile arayüzü güncelleme
-   Widget'ları sınıflara ayırma ve yeniden kullanılabilir bileşenler
-   Liste, kart, onay kutusu ve ilerleme çubuğu kullanımı
-   Mobil uygulamalarda dijital mahremiyet ve değerler eğitimi

## Geliştirme Fikirleri

-   Görevlerin tamamlanma durumunu `shared_preferences` veya yerel
    veritabanıyla kalıcı hâle getirmek.
-   Günlük görevler için tarih bazlı takip eklemek.
-   Yeni değerler ve etkinlikler eklemek.
-   Öğrencinin ilerlemesini görselleştiren bir istatistik ekranı
    oluşturmak.

## Lisans

<img width="553" height="1109" alt="Ekran Resmi 2026-10-25 20 33 14" src="https://github.com/user-attachments/assets/c36595ec-b5b8-4d63-9e48-a83c30db1f2a" />
<img width="553" height="1109" alt="Ekran Resmi 2026-10-25 20 33 18" src="https://github.com/user-attachments/assets/359b2024-4c62-49d8-a2e4-ca3695a7a9f3" />
<img width="553" height="1109" alt="Ekran Resmi 2026-10-25 20 33 29" src="https://github.com/user-attachments/assets/0cb0dafa-d734-4f0e-a4c4-d6ecfb12cbce" />



