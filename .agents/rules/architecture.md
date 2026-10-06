---
trigger: always_on
glob: '**/*'
description: Panduan arsitektur sistem dan struktur kode untuk movie_watchlist
---

# Architecture & Code Structure

Aplikasi ini menerapkan pola **Layered Architecture (Separation of Concerns)** menggunakan **Provider Pattern** untuk state management.

---

## 1. Diagram Aliran Data (Data Flow)
`
[ UI Layer: Screens & Widgets ]
             ▲
             │ (Listen & Consumer)
             ▼
[ State Management: Providers (ChangeNotifier) ]
             ▲
             │ (Async Calls & Business Logic)
             ▼
[ Services Layer: ApiService & StorageService ]
             ▲
             │ (Data Fetching / Serialization)
             ▼
[ Data Sources: TVMaze REST API & SharedPreferences Local Storage ]
`

---

## 2. Struktur Direktori Proyek
`	ext
lib/
├── constants/
│   ├── app_colors.dart        # Token warna sesuai design.md
│   └── app_theme.dart         # Konfigurasi ThemeData dark mode
├── models/
│   ├── show.dart              # Model data film dari TVMaze API
│   └── watchlist_item.dart    # Model data item CRUD watchlist
├── services/
│   ├── api_service.dart       # Komunikasi HTTP ke TVMaze API
│   └── storage_service.dart   # Serialisasi & persistensi SharedPreferences
├── providers/
│   ├── movie_provider.dart    # State katalog film & hasil search
│   └── watchlist_provider.dart# State CRUD watchlist (C, R, U, D)
├── views/
│   ├── screens/
│   │   ├── main_screen.dart   # Bottom navigation shell
│   │   ├── explore_screen.dart# Tab 1: Discovery & search
│   │   ├── detail_screen.dart # Layar detail film
│   │   └── watchlist_screen.dart # Tab 2: List CRUD watchlist
│   └── widgets/
│       ├── movie_card.dart
│       ├── watchlist_card.dart
│       └── edit_watchlist_sheet.dart
└── main.dart                  # Inisialisasi app & MultiProvider
`

---

## 3. Tanggung Jawab Lapisan (Layer Responsibilities)
* **Models:** Hanya berisi struktur data, factory romJson, dan method 	oJson. Tanpa logika bisnis.
* **Services:** Kelas murni (*pure classes*) yang menangani I/O: HTTP request dan operasi baca/tulis disk.
* **Providers:** Mengelola state, memanggil service, mengelola loading/error state, dan memicu 
otifyListeners().
* **Views/Screens:** Hanya bertugas menampilkan UI dan menangkap interaksi pengguna untuk diteruskan ke Provider.
