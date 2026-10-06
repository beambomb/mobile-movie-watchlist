---
trigger: always_on
glob: '**/*'
description: Product Requirements Document (PRD) untuk aplikasi movie_watchlist
---

# Product Requirements Document (PRD): Movie Watchlist

## 1. Ringkasan Produk
movie_watchlist adalah aplikasi mobile pencarian katalog film/serial TV dan pelacak tontonan pribadi yang menggabungkan integrasi **Public REST API** dengan sistem penyimpanan **CRUD Offline-First**.

---

## 2. Masalah yang Diselesaikan
* Pengguna sering lupa film/serial yang ingin ditonton atau catatan kesan setelah menonton.
* Aplikasi katalog film yang ada sering kali membutuhkan registrasi akun yang rumit dan tampilan visual yang terlalu bising.
* Pengguna membutuhkan pencatatan tontonan yang cepat, simpel, privat, dan tetap dapat diakses saat offline.

---

## 3. Target Pengguna
Penggemar film dan serial yang menyukai antarmuka bersih dan minimalis untuk mengelola daftar tontonan pribadi tanpa distraksi.

---

## 4. Fitur Utama

### A. Fitur Discovery & Pencarian (External API)
* Menampilkan daftar film/acara TV populer dari TVMaze Public API secara realtime.
* Search bar untuk mencari judul film spesifik dengan penanganan status loading dan error yang mulus.
* Melihat detail film: poster, ringkasan/sinopsis, rating resmi, status tayang, dan genre.

### B. Fitur Watchlist (CRUD Lengkap)
* **[C] Create:** Menambahkan film ke Watchlist pribadi dengan opsi:
  * Status tontonan: Plan to Watch, Watching, Completed.
  * Skor rating pribadi (1 - 5 bintang).
  * Catatan/review personal singkat.
* **[R] Read:** Melihat seluruh film tersimpan di tab Watchlist dengan filter status cepat (*All*, *Plan to Watch*, *Watching*, *Completed*).
* **[U] Update:** Mengedit status tontonan, skor rating, atau review catatan yang sudah ada melalui modal form.
* **[D] Delete:** Menghapus film dari Watchlist dengan dialog konfirmasi pencegahan ketidaksengajaan.

---

## 5. Kebutuhan Non-Fungsional (NFR)
* **Offline First:** Data Watchlist tetap tersimpan dan dapat dimanipulasi tanpa koneksi internet.
* **Performa:** Render transisi halus 60fps, waktu respon pencarian cepat.
* **Platform:** Kompatibel dengan Android dan Web (Chrome).
