---
trigger: always_on
glob: '**/*'
description: Spesifikasi teknis, dependensi, dan model data movie_watchlist
---

# Technical Specifications

## 1. Lingkungan Pengembangan & Platform
* **Framework:** Flutter 3.47.6 (Channel stable)
* **Language:** Dart 3.x
* **Target:** Android (API 36 minimum kompatibel) & Web (Chrome)

---

## 2. Dependensi (pubspec.yaml)
* provider: ^6.1.2 (State Management)
* http: ^1.2.2 (REST API Client)
* shared_preferences: ^2.3.2 (Local Key-Value Storage)

---

## 3. Spesifikasi Kontrak API Eksternal
* **Provider:** TVMaze REST API (Free, Public, No Auth Key)
* **Endpoints:**
  * **Search Shows:** GET https://api.tvmaze.com/search/shows?q={query}
  * **Default / Catalog Shows:** GET https://api.tvmaze.com/shows?page=0
* **Response Mapping:**
  * id -> int
  * 
ame -> String
  * summary -> String (dibersihkan dari tag HTML)
  * genres -> List<String>
  * 
ating.average -> double?
  * image.medium / image.original -> String?
  * premiered -> String?
  * status -> String?

---

## 4. Spesifikasi Skema Model Data Lokal (CRUD)
* **Storage Key:** movie_watchlist_v1
* **Format:** JSON String (List of Serialized Maps)
* **Model WatchlistItem:**
  * id: String (UUID / Timestamp id unik)
  * showId: int (Referensi ke ID show TVMaze)
  * 	itle: String
  * imageUrl: String?
  * genres: List<String>
  * status: String (Plan to Watch | Watching | Completed)
  * userRating: double (0.0 s/d 5.0)
  * userNotes: String
  * ddedAt: DateTime
  * updatedAt: DateTime
