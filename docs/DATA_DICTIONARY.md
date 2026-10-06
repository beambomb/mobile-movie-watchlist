# Data Dictionary & Variable Registry

Dokumen ini berfungsi sebagai kamus data sentral yang mencatat model data, struktur field, state global, serta kunci penyimpanan lokal (Local Storage Keys) yang digunakan dalam proyek.

---

## 1. Local Storage Keys
| Key Identifier | Tipe Data | Deskripsi |
| :--- | :--- | :--- |
| movie_watchlist_v1 | String (JSON Array) | Menyimpan seluruh daftar objek WatchlistItem ke memori lokal HP via SharedPreferences. |

---

## 2. Model Data: Show (Data API TVMaze)
Model yang merepresentasikan film/acara TV yang didapat dari endpoint TVMaze.

| Nama Variabel / Field | Tipe Data | Nullable? | Deskripsi |
| :--- | :--- | :--- | :--- |
| id | int | Tidak | ID unik film dari TVMaze API. |
| 
ame | String | Tidak | Judul utama film/serial. |
| summary | String | Ya | Sinopsis ringkas (dibersihkan dari tag HTML). |
| genres | List<String> | Tidak | Daftar genre (misal: Drama, Sci-Fi). |
| 
ating | double | Ya | Nilai rating rata-rata (skala 0 - 10). |
| imageUrl | String | Ya | URL poster gambar film resolusi sedang/tinggi. |
| premiered | String | Ya | Tanggal rilis perdana (format YYYY-MM-DD). |
| status | String | Ya | Status penayangan (misal: 'Running', 'Ended'). |

---

## 3. Model Data: WatchlistItem (CRUD Local)
Model yang merepresentasikan catatan tontonan pribadi yang disimpan oleh pengguna.

| Nama Variabel / Field | Tipe Data | Nullable? | Deskripsi |
| :--- | :--- | :--- | :--- |
| id | String | Tidak | UUID / timestamp unik untuk identifikasi entitas di storage. |
| showId | int | Tidak | Relasi foreign-key ke Show.id asal. |
| 	itle | String | Tidak | Judul film yang disimpan. |
| imageUrl | String | Ya | Salinan URL poster film untuk render offline. |
| genres | List<String> | Tidak | Salinan genre film. |
| status | String | Tidak | Status tontonan (Plan to Watch \| Watching \| Completed). |
| userRating | double | Tidak | Skor rating pribadi yang diberikan pengguna (1.0 - 5.0). |
| userNotes | String | Tidak | Catatan review atau kesan pribadi pengguna. |
| ddedAt | DateTime | Tidak | Waktu pertama kali ditambahkan ke Watchlist. |
| updatedAt | DateTime | Tidak | Waktu terakhir kali catatan/status diperbarui. |

---

## 4. State Management Variables (Providers)

### A. MovieProvider
* List<Show> shows: Daftar film yang sedang ditampilkan di Explore.
* ool isLoading: Indikator proses pemanggilan API sedang berlangsung.
* String? errorMessage: Menyimpan pesan error jika fetch API gagal.
* String searchQuery: Kata kunci pencarian yang sedang aktif.

### B. WatchlistProvider
* List<WatchlistItem> items: Seluruh data film tersimpan dari storage lokal.
* String selectedFilter: Filter status aktif (All, Plan to Watch, Watching, Completed).
* ool isSaving: Indikator saat proses penulisan ke disk sedang berjalan.
