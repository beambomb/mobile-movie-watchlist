---
description: Otomatisasi pembaruan catatan progres di docs/PROGRESS.md dan docs/DATA_DICTIONARY.md
---

# Workflow: Update Progress & Data Dictionary

Gunakan alur kerja ini setiap kali sebuah fitur atau milestone selesai dikerjakan agar dokumentasi proyek selalu akurat.

## Langkah-Langkah Eksekusi:

1. **Tinjau Perubahan Terbaru:**
   - Identifikasi komponen, file, atau fungsi apa saja yang baru selesai dibuat.
   - Pastikan kode sudah lulus verifikasi (flutter analyze atau test run).

2. **Perbarui docs/PROGRESS.md:**
   - Sesuaikan bagian **Status Terkini** (Milestone aktif & target selanjutnya).
   - Tambahkan entri baru di bawah **Riwayat Catatan Progres (Changelog)**:
     - Tanggal & Judul Pencapaian
     - Detail pencapaian
     - Hasil verifikasi

3. **Perbarui docs/DATA_DICTIONARY.md (Jika Ada Perubahan Model/State):**
   - Jika ada model data baru -> daftarkan ke tabel Model.
   - Jika ada state variable baru di Provider -> daftarkan ke tabel State Variables.
   - Jika ada storage key baru -> catat di tabel Local Storage Keys.

4. **Lanjutkan ke Workflow Commit:**
   Setelah dokumentasi diperbarui, lanjutkan dengan memanggil alur `commit-push.md`.
