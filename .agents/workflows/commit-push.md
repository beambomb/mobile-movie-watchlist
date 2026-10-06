---
description: Alur kerja git commit terstandarisasi dan push ke remote repository sesuai aturan agents.md
---

# Workflow: Commit & Push

Gunakan alur kerja ini untuk menyimpan perubahan kode ke Git dan mendorongnya ke repositori remote (origin).

---

## Langkah-Langkah Eksekusi:

1. **Periksa Status Berkas:**
   Verifikasi daftar file yang diubah atau ditambahkan:
   ```powershell
   git status
   ```

2. **Stage Perubahan:**
   Tambahkan seluruh perubahan yang relevan:
   ```powershell
   git add .
   ```

3. **Buat Git Commit Berstandar:**
   Tuliskan pesan commit yang singkat, jelas, dan on-point menggunakan konvensi:
   * `feat(scope): penjelasan fitur baru`
   * `fix(scope): penjelasan perbaikan bug`
   * `style(scope): penyesuaian desain/tema`
   * `refactor(scope): restrukturisasi kode`
   * `docs(scope): pembaruan dokumentasi`

   Jalankan:
   ```powershell
   git commit -m "feat(frontend): implementasi fitur baru"
   ```

4. **Push ke GitHub (Remote):**
   Kirimkan perubahan ke repositori remote:
   ```powershell
   git push -u origin master
   ```
