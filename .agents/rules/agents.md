---
trigger: always_on
---

---
trigger: always_on
glob: '**/*'
description: Aturan perilaku dan standar kerja AI agent untuk proyek movie_watchlist
---

# Agent Rules & Working Guidelines

Dokumen ini berisi aturan wajib bagi agen AI maupun pengembang yang berkontribusi pada repositori ini.

---

## 1. Aturan Kerja Utama (Core Directives)
* **Wajib Membaca Seluruh Dokumentasi:** Sebelum memulai tugas atau menulis kode apa pun, agen/pengembang **wajib membaca seluruh berkas di folder `.agents/rules/`** (`agents.md`, `design.md`, `PRD.md`, `architecture.md`, `specs.md`, `tasks.md`) untuk memastikan pemahaman konteks, batasan teknis, dan standar visual.
* **Penulisan Kode Minim Komentar:** Kode harus bersih, ekspresif, dan minim komentar. Jangan menulis komentar untuk hal-hal yang sudah jelas (self-explanatory code).
* **Komentar Wajib On-Point:** Jika memang diperlukan komentar, tuliskan **secara singkat, padat, dan langsung pada intinya** (hanya untuk menjelaskan alasan keputusan arsitektur tertentu, kasus tepi/edge-case, atau logika parser khusus).
* **Disiplin Git Commit:** **Wajib membuat git commit setelah setiap 3 perubahan atau milestone fitur penting selesai dikerjakan**. Jangan menumpuk perubahan besar tanpa riwayat commit berkala.
* **Verifikasi Mandiri:** Selalu jalankan verifikasi sintaks dan compile (`flutter analyze` atau test run) sebelum menyatakan pekerjaan selesai.

---

## 2. Kepatuhan Arsitektur & Desain
* Semua penulisan logika bisnis harus berada di dalam **Provider (`ChangeNotifier`)**, dilarang mencampur logika fetch API atau manipulasi data di dalam widget tampilan.
* Semua styling antarmuka **wajib mengacu penuh pada `design.md`** (dark mode minimalis, no neon, no gradients, no rainbow, no extreme rounded corners).
