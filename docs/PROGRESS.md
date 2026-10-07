# Project Progress Log

Dokumen ini melacak riwayat progres pengerjaan, milestone aktif, dan catatan commit perubahan proyek movie_watchlist.

---

## 1. Status Terkini
* **Milestone Aktif:** Milestone 2 (Data Models & Storage Service - CRUD Layer)
* **Status Keseluruhan:** Milestone 1 Selesai (Design system, app colors, app theme minimalis dark mode telah terkonfigurasi dan teruji).
* **Target Selanjutnya:** Milestone 2 (Pembuatan Show, WatchlistItem model, dan StorageService CRUD).

---

## 2. Riwayat Catatan Progres (Changelog)

### [2026-10-07] - Penyelesaian Milestone 1: Setup Design System & Dark Mode Minimalis
* **Pencapaian:**
  - Membuat `frontend/lib/constants/app_colors.dart` sesuai palet warna minimalis dark mode `design.md`.
  - Mengonfigurasi `frontend/lib/constants/app_theme.dart` (Tema gelap flat, radius 4-8px, tanpa warna neon/gradasi).
  - Mengintegrasikan `AppTheme.darkTheme` ke `frontend/lib/main.dart`.
  - Memperbarui smoke test `frontend/test/widget_test.dart`.
* **Verifikasi:**
  - `flutter analyze`: 0 errors / clean.
  - `flutter test`: all tests passed.


### [2026-10-06] - Refaktor Arsitektur Backend (Separation of Concerns / MVC)
* **Pencapaian:**
  - Memecah struktur ackend/server.js menjadi arsitektur modular berlapis:
    - config/db.js: Penanganan inisialisasi dan baca/tulis file storage.
    - models/watchlistModel.js: Abstraksi operasi manipulasi data (CRUD).
    - controllers/watchlistController.js: Penanganan alur request-response HTTP.
    - 
outes/watchlistRoutes.js: Definisi rute REST API.
    - middlewares/errorHandler.js: Middleware penanganan 404 (Route not found) & 500 (Internal Error).
    - server.js: Entry point bersih tanpa penumpukan logika.
  - Menambahkan endpoint root GET / untuk dokumentasi indeks endpoint API.
* **Verifikasi:** Seluruh endpoint diuji dengan curl, auto-reload 
ode --watch sukses memuat struktur MVC.

### [2026-10-06] - Pembuatan REST API Backend (Express.js)
* **Pencapaian:**
  - Menginisialisasi server Express.js di folder ackend/.
  - Mengonfigurasi middleware CORS dan express.json parser.
  - Membangun full CRUD endpoints untuk Watchlist:
    - GET /api/watchlist: Ambil seluruh film (dukung filter ?status=).
    - POST /api/watchlist: Tambah film baru ke watchlist.
    - PUT /api/watchlist/:id: Update status, rating (1-5), dan review catatan.
    - DELETE /api/watchlist/:id: Hapus item watchlist berdasarkan ID.
  - Mengimplementasikan penyimpanan data berbasis file data/watchlist.json (auto-create & auto-save).
  - Menyiapkan script 
pm run dev (dengan node --watch bawaan Node.js v24).
* **Verifikasi:** Server diuji pada port 5000, endpoint /api/health dan /api/watchlist sukses mengembalikan status 200 OK via curl.

### [2026-10-06] - Reorganisasi ke Fullstack Monorepo
* **Pencapaian:**
  - Memisahkan arsitektur repositori menjadi pola Monorepo:
    - rontend/: Berisi seluruh aplikasi mobile Flutter (Dart).
    - ackend/: Disiapkan untuk server REST API (Express.js/Node.js).
    - docs/: Dokumentasi progres dan kamus data.
    - .agents/: Aturan kerja AI dan spesifikasi desain.
  - Memperbarui file .gitignore di root repositori untuk memfilter build artifact Flutter dan node_modules Express.
  - Menyelaraskan berkas rchitecture.md dengan struktur monorepo baru.
* **Verifikasi:** Proyek Flutter di rontend/ terisolasi dengan rapi dan dependensi (http, provider, shared_preferences) tetap utuh.

### [2026-10-06] - Inisialisasi Fondasi & Dokumentasi
* **Pencapaian:**
  - Selesai merancang blueprint aplikasi hasil interview (Movie Watchlist & Discovery).
  - Menyusun seluruh aturan agen dan batasan teknis di .agents/rules/ (gents.md, design.md, PRD.md, rchitecture.md, specs.md, 	asks.md).
  - Menyiapkan direktori dokumentasi kerja docs/ (PROGRESS.md, DATA_DICTIONARY.md).
