# Haptic Choreography (Planned)

## Intent
Haptic cues dipakai untuk memperkuat guidance tanpa menambah visual noise.

## Pattern Map
- `triggerNudge`
  - Context: transisi `IdleMonitoring -> Triggered`
  - Feel: short double nudge, noticeable tapi tidak agresif
- `breathingPace`
  - Context: selama sesi breathing
  - Feel: pulse ringan periodik untuk bantu ritme tarik/hembus
- `breathingComplete`
  - Context: sesi selesai
  - Feel: single soft acknowledge
- `summaryConfirm`
  - Context: kembali ke idle dari summary
  - Feel: subtle confirmation tap

## Constraints
- Hindari pola terlalu sering/kuat agar tidak melelahkan.
- Prioritaskan kenyamanan harian dan battery awareness.
- Haptic tidak boleh menjadi satu-satunya indikator status penting.

## Integration Notes
- Gunakan `HapticEngine` protocol di Infrastructure.
- UI layer hanya memicu intent, bukan mengatur hardware detail.
- Implementasi runtime watchOS disiapkan pada fase berikutnya.
