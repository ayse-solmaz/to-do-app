# Yapılacaklar (To-Do App)

Flutter ile geliştirilmiş basit bir yapılacaklar listesi uygulaması. Görevler cihaz üzerinde Hive CE ile kalıcı olarak saklanır.

## Özellikler

- Görev ekleme
- Görevleri tamamlandı olarak işaretleme
- Kaydırarak (swipe) görev silme
- Hive CE ile yerel veri saklama (uygulama kapanınca görevler kaybolmaz)
- Firebase Auth ile e-posta giriş / kayıt

## Kullanılan teknolojiler

- Flutter / Dart
- Hive CE & Hive CE Flutter (yerel veritabanı)
- Firebase Auth
- flutter_slidable (kaydırarak silme)

## Proje yapısı

```
lib/
  main.dart              # Uygulama girişi, Firebase + Hive CE başlatma
  firebase_options.dart  # Firebase yapılandırması
  data/
    database.dart        # Hive CE okuma / yazma işlemleri
  pages/
    auth_page.dart       # Oturum durumuna göre yönlendirme
    login_page.dart      # Giriş ekranı
    register_page.dart   # Kayıt ekranı
    home_page.dart       # Ana ekran (liste, ekle, sil, checkbox)
  util/
    app_style.dart       # Renk ve kart stili
    todo_tile.dart       # Tek bir görev satırı
    dialog_box.dart      # Yeni görev ekleme diyaloğu
    my_button.dart       # Ortak buton bileşeni
```

## Çalıştırma

1. Bağımlılıkları yükle:

```bash
flutter pub get
```

2. Uygulamayı başlat:

```bash
flutter run
```

## Nasıl kullanılır?

1. E-posta ile giriş yap veya kayıt ol.
2. Sağ alttaki **+** butonuna bas.
3. Görevi yazıp **kaydet**e tıkla.
4. Checkbox ile görevi tamamla.
5. Görevi sola kaydırarak sil.
