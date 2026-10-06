---
trigger: always_on
glob: '**/*'
description: Panduan arsitektur sistem dan struktur kode untuk movie_watchlist (Monorepo)
---

# Architecture & Code Structure (Fullstack Monorepo)

Aplikasi ini menerapkan pola **Fullstack Monorepo** dengan pemisahan tegas antara Mobile Client (rontend/) dan REST API Server (ackend/).

---

## 1. Struktur Direktori Monorepo
`	ext
projek1/
├── .agents/                   # Aturan & pedoman pengembang AI
│   └── rules/
│       ├── agents.md
│       ├── architecture.md
│       ├── design.md
│       ├── PRD.md
│       ├── specs.md
│       └── tasks.md
├── docs/                      # Dokumentasi progres & kamus data
│   ├── PROGRESS.md
│   └── DATA_DICTIONARY.md
├── backend/                   # Server Express.js (Node.js REST API)
│   └── (routes, controllers, models)
├── frontend/                  # Aplikasi Mobile Flutter
│   ├── lib/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   └── app_theme.dart
│   │   ├── models/
│   │   │   ├── show.dart
│   │   │   └── watchlist_item.dart
│   │   ├── services/
│   │   │   ├── api_service.dart
│   │   │   └── storage_service.dart
│   │   ├── providers/
│   │   │   ├── movie_provider.dart
│   │   │   └── watchlist_provider.dart
│   │   ├── views/
│   │   │   ├── screens/
│   │   │   │   ├── main_screen.dart
│   │   │   │   ├── explore_screen.dart
│   │   │   │   ├── detail_screen.dart
│   │   │   │   └── watchlist_screen.dart
│   │   │   └── widgets/
│   │   │       ├── movie_card.dart
│   │   │       ├── watchlist_card.dart
│   │   │       └── edit_watchlist_sheet.dart
│   │   └── main.dart
│   └── pubspec.yaml
└── .gitignore
`

---

## 2. Aliran Data (Data Flow)
`
[ UI Layer: Screens & Widgets (frontend/lib/views) ]
                      ▲
                      │ (Listen & Consumer)
                      ▼
[ State Management: Providers (frontend/lib/providers) ]
                      ▲
                      │ (Async Calls & Business Logic)
                      ▼
[ Services Layer: ApiService & StorageService (frontend/lib/services) ]
                      ▲
                      │ (HTTP GET/POST / Local Disk)
                      ▼
[ Data Sources: Express Backend / TVMaze API & SharedPreferences ]
`
