# 🚀 belajar_flutter

Proyek Flutter pertama sebagai titik awal mempelajari pengembangan aplikasi lintas platform menggunakan Flutter & Dart.

---

## 📱 Platform yang Didukung

| Platform | Status |
|----------|--------|
| Android  | ✅ Didukung |
| iOS      | ✅ Didukung |
| Web      | ✅ Didukung |
| Windows  | ✅ Didukung |
| macOS    | ✅ Didukung |
| Linux    | ✅ Didukung |

---

## 🛠️ Teknologi

- **Framework:** [Flutter](https://flutter.dev/)
- **Bahasa:** [Dart](https://dart.dev/)

---

## ⚙️ Prasyarat

Pastikan sudah menginstal:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi terbaru yang stabil)
- [Dart SDK](https://dart.dev/get-dart) (sudah termasuk dalam Flutter)
- [Android Studio](https://developer.android.com/studio) atau [VS Code](https://code.visualstudio.com/)
- Emulator Android / iOS Simulator atau perangkat fisik

Cek instalasi Flutter dengan menjalankan:

```bash
flutter doctor
```

---

## 🚀 Cara Menjalankan

**1. Clone repositori ini**

```bash
git clone https://github.com/Jujustxr/flutter.git
cd flutter
```

**2. Install dependensi**

```bash
flutter pub get
```

**3. Jalankan aplikasi**

```bash
flutter run
```

> Pilih target device saat diminta, atau tentukan langsung:
> ```bash
> flutter run -d android    # Untuk Android
> flutter run -d chrome     # Untuk Web
> flutter run -d windows    # Untuk Windows
> ```

---

## 📁 Struktur Proyek

```
belajar_flutter/
├── android/          # Konfigurasi native Android
├── ios/              # Konfigurasi native iOS
├── lib/              # Source code utama (Dart)
│   └── main.dart     # Entry point aplikasi
├── linux/            # Konfigurasi native Linux
├── macos/            # Konfigurasi native macOS
├── web/              # Konfigurasi Web
├── windows/          # Konfigurasi native Windows
├── test/             # Unit & widget test
├── pubspec.yaml      # Konfigurasi dependensi
└── README.md
```

---

## 🧪 Menjalankan Test

```bash
flutter test
```

---

## 📦 Build untuk Produksi

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

---

## 📚 Sumber Belajar Flutter

- 📖 [Dokumentasi Flutter](https://docs.flutter.dev/)
- 🎓 [Codelab: Aplikasi Flutter Pertama](https://docs.flutter.dev/get-started/codelab)
- 📦 [Cari Package Flutter di pub.dev](https://pub.dev/)
- 🎥 [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)

---

## 👤 Author

**Jujustxr**
- GitHub: [@Jujustxr](https://github.com/Jujustxr)

---

## 📄 Lisensi

Proyek ini bersifat open source dan tersedia di bawah lisensi [MIT](LICENSE).
