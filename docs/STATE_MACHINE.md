# State Machine

## States
- `Onboarding`
- `IdleMonitoring`
- `Triggered`
- `BreathingActive`
- `ReflectionPending`
- `Summary`

## Transitions
- Onboarding -> IdleMonitoring: user acknowledge disclaimer + start
- IdleMonitoring -> Triggered: trigger criteria terpenuhi
- Triggered -> BreathingActive: user start breathing
- BreathingActive -> ReflectionPending: timer selesai atau user skip
- ReflectionPending -> Summary: mood dipilih / lewati
- Summary -> IdleMonitoring: user kembali monitor

## Trigger conditions (initial contract)
- HR meningkat di atas baseline + delta threshold
- Pengguna relatif inactive
- Cooldown terpenuhi

## Failure handling
- Sensor HR unavailable: skip trigger check sementara
- State mismatch: fallback ke `IdleMonitoring`
- Data write error lokal: continue session tanpa crash
