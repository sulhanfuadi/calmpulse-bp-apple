# Accessibility Baseline (watchOS)

## Core Standards
- Keep text contrast high enough for quick glance readability
- Preserve minimum tap comfort with clear button blocks
- Maintain visual hierarchy for fast comprehension

## Semantic Baseline
- Screen container keeps grouped accessibility semantics
- Primary and secondary actions remain clearly separable
- Status/chip text should remain short and meaningful
- Metrics dibacakan dengan format `label + value`

## VoiceOver Matrix
- Onboarding: "Setuju & Mulai" -> hint: mulai monitoring
- Idle: trigger simulation + summary action terbaca jelas
- Breathing: selesai/lewati punya hint outcome berbeda
- Summary: action kembali idle punya hint konteks

## Motion Safety
- Animations are subtle and low-amplitude
- Transition duration is short to avoid visual fatigue
- No heavy blur/strobe-like effects
- Reduce Motion mode: fade transition + softer breathing pulse

## Future Enhancements
- Explicit VoiceOver labels per metric grouping lebih detail
- Dynamic Type stress test on all screens
- Optional high-legibility toggle in app settings (future)
