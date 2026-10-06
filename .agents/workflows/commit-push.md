---
description: Otomatisasi git commit terstandarisasi dan push ke remote repository sesuai aturan agents.md
---

# Workflow: Commit & Push

Gunakan alur kerja ini untuk menyimpan perubahan kode ke Git dan mendorongnya ke repositori remote (origin).

## Langkah-Langkah Eksekusi:

1. **Periksa Status Berkas:**
   ```powershell
   git status

2. **Stage Perubahan:**
   ```powershell
   git add .

3. **Buat Git Commit Berstandar**: 
Tulis pesan commit singkat dan on-point sesuai konvensi:

- feat(scope): penjelasan fitur baru
- fix(scope): penjelasan perbaikan bug
- style(scope): penyesuaian desain/tema
- refactor(scope): restrukturisasi kode
- docs(scope): pembaruan dokumentasi

4. **jalankan** : git commit -m "pesan commit"

5. git push -u origin main
