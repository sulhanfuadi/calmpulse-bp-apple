# Simulator Smoke Test (watchOS)

## Preconditions
- Xcode is installed
- watchOS platform/runtime is installed in `Xcode > Settings > Components`
- Project `CalmPulseBP.xcodeproj` opens successfully

## Steps
1. Pilih scheme `CalmPulseBP`.
2. Pilih simulator Apple Watch (Series 9 atau Ultra 2).
3. Run app.
4. Verifikasi tampilan awal `Onboarding`.
5. Tap `Start` -> enter `Idle`.
6. Tap `Trigger` -> enter `Triggered`.
7. Tap `Start` -> enter `Breathing`.
8. Wait timer completion or tap `Done` -> enter `Reflection`.
9. Tap any mood option -> enter `Summary`.
10. Tap `Back` -> return to `Idle`.

## Pass criteria
- All state transitions run without crashes.
- All placeholder screens appear in the expected state order.
