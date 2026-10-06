---
description: Alur kerja pembaruan berkas dokumentasi docs/PROGRESS.md dan docs/DATA_DICTIONARY.md
---

# Workflow: Update Progress & Data Dictionary

Gunakan alur kerja ini setiap kali sebuah fitur atau milestone selesai dikerjakan agar dokumentasi proyek selalu akurat dan mutakhir.

---

## Langkah-Langkah Eksekusi:

1. **Tinjau Perubahan Terbaru:**
   * Identifikasi komponen, file, atau fungsi apa saja yang baru selesai dibuat.
   * Pastikan kode sudah lulus verifikasi (flutter analyze atau test run).

2. **Perbarui docs/PROGRESS.md:**
   * Sesuaikan bagian **Status Terkini** (Milestone aktif & target selanjutnya).
   * Tambahkan entri baru di bawah **Riwayat Catatan Progres (Changelog)**:
     ```markdown
     ### [YYYY-MM-DD] - Judul Pencapaian / Fitur
     * **Pencapaian:**
       - Detail pencapaian 1
       - Detail pencapaian 2
     * **Verifikasi:** Hasil compile / pengujian di Chrome atau HP
     ```

3. **Perbarui docs/DATA_DICTIONARY.md (Jika Menyentuh Model atau State):**
   * Jika ada model data baru atau perubahan field model -> tambahkan ke tabel Model.
   * Jika ada state variable baru di Provider -> daftarkan ke tabel State Variables.
   * Jika ada key penyimpanan baru -> catat di tabel Local Storage Keys.

4. **Lanjutkan ke Workflow Commit:**
   Setelah dokumentasi diperbarui, lanjutkan dengan memanggil alur commit-push.md.
