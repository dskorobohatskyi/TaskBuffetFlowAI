# flutter_task_buffet_app

## Drift Web Setup

To run Drift on web, we include a WASM sqlite module and a web worker.

Required files in `web/`:
- `sqlite3.wasm`
- `drift_worker.js`

Build (or rebuild) the worker:

```bash
dart compile js web/drift_worker.dart -O2 -o web/drift_worker.js
```

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
