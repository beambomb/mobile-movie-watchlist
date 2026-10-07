---
trigger: always_on
glob: '**/*'
description: Roadmap pengerjaan proyek movie_watchlist, milestone, dan Definition of Done
---

# Project Tasks & Roadmap

Dokumen ini adalah peta jalan eksekusi proyek movie_watchlist. Setiap milestone wajib memenuhi seluruh **Definition of Done (DoD)** sebelum melangkah ke milestone berikutnya.

---

## Milestone 1: Inisialisasi Proyek, Dependensi & Design System
Menyiapkan kerangka kerja Flutter, menginstal pustaka yang dibutuhkan, dan mengonfigurasi tema gelap minimalis.
* **Definition of Done (DoD):**
  - [x] Proyek Flutter movie_watchlist berhasil dibuat.
  - [x] Dependensi provider, http, dan shared_preferences terpasang di pubspec.yaml.
  - [x] app_colors.dart dan app_theme.dart terkonfigurasi sesuai aturan design.md (Flat dark mode, border radius 4-8px, no neon/gradient).
  - [x] Commit git dibuat setelah inisialisasi dasar selesai.

---

## Milestone 2: Data Models & Storage Service (CRUD Layer)
Membangun fondasi data untuk film API dan persistensi Watchlist lokal.
* **Definition of Done (DoD):**
  - [ ] Model Show dengan romJson selesai dan teruji parser-nya.
  - [ ] Model WatchlistItem dengan romJson dan 	oJson selesai.
  - [ ] StorageService mampu membaca, menyimpan, memperbarui, dan menghapus data JSON dari shared_preferences.
  - [ ] Penanganan kasus data kosong (*empty list*) dan error parsing ditangani secara aman.
  - [ ] Commit git dibuat.

---

## Milestone 3: API Integration & Explore/Discovery Screen
Mengambil data dari TVMaze API dan menampilkannya dalam katalog yang dapat dicari.
* **Definition of Done (DoD):**
  - [ ] ApiService berhasil memanggil endpoint search dan katalog default TVMaze.
  - [ ] MovieProvider mengelola state: list film, search query, status isLoading, dan errorMessage.
  - [ ] ExploreScreen menampilkan grid/list kartu film dengan poster, judul, genre, dan rating.
  - [ ] Search bar berfungsi realtime dengan umpan balik visual saat data dicari.
  - [ ] Commit git dibuat.

---

## Milestone 4: Watchlist Screen & Complete CRUD Operations
Mengimplementasikan antarmuka Watchlist lengkap dengan Create, Read, Update, dan Delete.
* **Definition of Done (DoD):**
  - [ ] WatchlistProvider menangani Create, Read, Update, Delete dan otomatis menyimpan ke StorageService.
  - [ ] Pengguna dapat menambahkan film ke Watchlist langsung dari kartu atau layar detail.
  - [ ] WatchlistScreen menampilkan seluruh film tersimpan dengan tab filter status (*All, Plan to Watch, Watching, Completed*).
  - [ ] Fitur Edit: Form bottom-sheet untuk mengubah status tontonan, rating skor (1-5), dan catatan personal.
  - [ ] Fitur Delete: Menghapus film dengan dialog konfirmasi (*Are you sure?*).
  - [ ] Commit git dibuat.

---

## Milestone 5: Detail Screen & Finishing Antarmuka
Menghubungkan navigasi layar detail dan memastikan konsistensi visual.
* **Definition of Done (DoD):**
  - [ ] DetailScreen menampilkan poster besar, sinopsis lengkap yang bersih dari tag HTML, genre badge, dan tombol aksi Watchlist.
  - [ ] Indikator status Watchlist di halaman detail berubah jika film sudah ada di dalam Watchlist.
  - [ ] Bottom Navigation Bar menghubungkan ExploreScreen dan WatchlistScreen dengan transisi mulus.
  - [ ] Commit git dibuat.

---

## Milestone 6: Quality Assurance, Verification & Polish
Memastikan seluruh aturan teknis dan visual terpenuhi tanpa pelanggaran.
* **Definition of Done (DoD):**
  - [ ] Menjalankan lutter analyze dan memastikan 0 lint error.
  - [ ] Aplikasi berhasil diuji jalan di browser Chrome (lutter run -d chrome) tanpa kendala crash.
  - [ ] Seluruh aturan design.md terverifikasi (bebas neon, bebas gradasi, radius 4-8px).
  - [ ] Seluruh aturan gents.md terverifikasi (minim komentar, commit teratur).
  - [ ] Commit git final dibuat.
