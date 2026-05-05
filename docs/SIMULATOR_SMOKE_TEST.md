# Simulator Smoke Test (watchOS)

## Preconditions
- Xcode terinstall
- watchOS platform/runtime sudah terpasang di `Xcode > Settings > Components`
- Project `CalmPulseBP.xcodeproj` berhasil dibuka

## Steps
1. Pilih scheme `CalmPulseBP`.
2. Pilih simulator Apple Watch (Series 9 atau Ultra 2).
3. Run app.
4. Verifikasi tampilan awal `Onboarding`.
5. Tap `Setuju & Mulai` -> masuk `Idle`.
6. Tap `Simulasi Trigger` -> masuk `Triggered`.
7. Tap `Mulai Breathing 60s` -> masuk `Breathing`.
8. Tap `Selesai` -> masuk `Reflection`.
9. Tap salah satu mood -> masuk `Summary`.
10. Tap `Kembali Idle` -> kembali ke `Idle`.

## Pass criteria
- Semua transisi state berjalan tanpa crash.
- Semua placeholder screen tampil sesuai urutan state contract.
