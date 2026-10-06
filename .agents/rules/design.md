---
trigger: always_on
glob: '**/*'
description: Panduan desain antarmuka (UI/UX) minimalis dark mode untuk movie_watchlist
---

# Design System Guidelines: Minimalist Dark Mode

Dokumen ini menetapkan batasan visual dan aturan antarmuka untuk aplikasi movie_watchlist.

---

## 1. Filosofi Desain
* **Minimalis & Utilitarian:** Antarmuka harus fokus pada fungsi, kerapian tipografi, dan kemudahan navigasi tanpa elemen dekoratif berlebihan.
* **Default Dark Mode Murni:** Aplikasi menggunakan tampilan gelap pekat yang nyaman di mata untuk pengalaman sinema personal.

---

## 2. Aturan Larangan Keras (Strict Constraints)
* **DILARANG MENGGUNAKAN WARNA NEON:** Tidak boleh ada warna berpijar (electric cyan, neon green, bright pink, dll.).
* **DILARANG MENGGUNAKAN WARNA-WARNI:** Jangan membuat palet pelangi yang ramai. Pertahankan keselarasan warna monokrom dan netral.
* **DILARANG MENGGUNAKAN WARNA GRADASI (NO GRADIENTS):** Semua elemen latar belakang, tombol, dan kartu wajib menggunakan warna datar (flat solid colors).
* **DILARANG BORDER RADIUS EKSTRIM:** Elemen kotak (cards, buttons, dialog, bottom sheet, text input) **tidak boleh diberi rounded berlebihan / bentuk kapsul (pill shape)**.
  * Border radius maksimal: **4px hingga 8px** untuk mempertahankan karakter tegas, modern, dan kokoh.

---

## 3. Palet Warna (Color Palette)
* **Background Utama:** #121212 (Dark Charcoal pekat)
* **Surface / Cards / Dialog:** #1E1E1E (Muted Dark Gray)
* **Surface Secondary (Input / List Tile):** #262626
* **Borders & Dividers:** #333333 (Garis pemisah tipis 1px yang bersih)
* **Primary Text:** #F5F5F5 (Off-white dengan kontras tinggi)
* **Secondary / Muted Text:** #9E9E9E (Medium gray untuk metadata/sinopsis)
* **Primary Accent (Tombol/Aksi Utama):** #E0E0E0 (Clean light neutral) atau #90A4AE (Muted Slate)
* **Status Badges (Muted, Flat):**
  * *Plan to Watch:* Background #2C2C2C, Text #B0BEC5
  * *Watching:* Background #243324, Text #81C784 (Muted flat green)
  * *Completed:* Background #1C2E3D, Text #64B5F6 (Muted flat blue)
* **Destructive Action (Hapus):** #CF6679 (Muted Crimson, bukan merah terang)

---

## 4. Tipografi & Tata Letak
* **Font:** Sans-serif bersih standar sistem (Inter / Roboto).
* **Spacing:** Skala 8pt konsisten (4px, 8px, 16px, 24px).
* **Padding:** Cukup ruang bernapas tanpa padding berlebihan.
