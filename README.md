# Yapılacaklar (To-Do App)

Flutter ile geliştirilmiş basit bir yapılacaklar listesi uygulaması. Görevler cihaz üzerinde Hive ile kalıcı olarak saklanır.

## Özellikler

- Görev ekleme
- Görevleri tamamlandı olarak işaretleme
- Kaydırarak (swipe) görev silme
- Hive ile yerel veri saklama (uygulama kapanınca görevler kaybolmaz)

## Kullanılan teknolojiler

- Flutter / Dart
- Hive & Hive Flutter (yerel veritabanı)
- flutter_slidable (kaydırarak silme)

## Proje yapısı

```
lib/
  main.dart              # Uygulama girişi, Hive başlatma
  data/
    database.dart        # Hive okuma / yazma işlemleri
  pages/
    home_page.dart       # Ana ekran (liste, ekle, sil, checkbox)
  util/
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

1. Sağ alttaki **+** butonuna bas.
2. Görevi yazıp **kaydet**e tıkla.
3. Checkbox ile görevi tamamla.
4. Görevi sola kaydırarak sil.

