# CalmPulse BP (Apple Watch)

A watch-first digital companion for young adults with hypertension to practice **micro-interventions** when stress signals rise.

> **Medical Safety Notice**  
> CalmPulse BP is **not a diagnostic tool**, **not an emergency service**, and **does not replace professional medical care**.

---

## 1) Why this product exists

Many young adults with hypertension experience short stress spikes during daily routines (study/work/commute), but often miss the exact moment to pause and regulate. CalmPulse BP is designed to:

- detect simple high-risk moments (initially with lightweight heuristics),
- nudge users into a short breathing intervention,
- capture post-session mood reflection,
- reinforce daily self-awareness through a simple summary.

This is intentionally **behavioral support**, not clinical diagnosis.

---

## 2) Product vision

CalmPulse BP aims to become a low-friction watch companion that helps users build a repeatable habit:

1. **Notice** stress signal,
2. **Pause** briefly,
3. **Regulate** through guided breathing,
4. **Reflect** quickly,
5. **Learn** from daily patterns.

---

## 3) Current repository status

This repository is in **Scaffold + PRD phase**.

### What is already implemented
- watchOS-first SwiftUI project structure (source scaffold).
- state-driven flow routing:
  - `Onboarding`
  - `IdleMonitoring`
  - `Triggered`
  - `BreathingActive`
  - `ReflectionPending`
  - `Summary`
- domain contracts for:
  - app states,
  - trigger reasons,
  - reflection moods,
  - app configuration constants,
  - session log entry model.
- product/technical/compliance docs.

### What is not yet implemented
- real HealthKit ingestion pipeline,
- production trigger engine,
- persisted user/session storage,
- haptic breathing loop production behavior,
- full iPhone companion app and sync.

---

## 4) User flow (MVP target)

1. **Onboarding**
   - user sees safety notice and acknowledges app positioning.
2. **Idle Monitoring**
   - app waits in low-friction mode.
3. **Triggered**
   - user receives prompt to pause.
4. **Breathing Active**
   - short guided breathing (target: 60s).
5. **Reflection Pending**
   - quick mood input.
6. **Summary**
   - simple daily metrics for behavior reinforcement.

See detailed transition rules in [`docs/STATE_MACHINE.md`](docs/STATE_MACHINE.md).

---

## 5) Architecture (watchOS-first)

High-level layers:

- **App**: app entry + root routing
- **Features**: per-screen/per-state UI modules
- **Domain**: business contracts and shared models
- **Infrastructure**: app state holder and adapters (storage/health later)
- **Resources**: assets/strings/theme (to be expanded)

Current source tree:

```text
calmpulse-bp-apple/
├─ App/
├─ Features/
│  ├─ Onboarding/
│  ├─ Idle/
│  ├─ Triggered/
│  ├─ Breathing/
│  ├─ Reflection/
│  └─ Summary/
├─ Domain/
├─ Infrastructure/
├─ Resources/
└─ docs/
```

---

## 6) Domain contracts (initial)

### App states
Defined in `Domain/AppState.swift`:

- `Onboarding`
- `IdleMonitoring`
- `Triggered`
- `BreathingActive`
- `ReflectionPending`
- `Summary`

### Config constants
Defined in `Domain/AppConfig.swift`:

- `hrThresholdDelta`
- `cooldownMinutes`
- `breathingDurationSeconds`

Default scaffold values:
- HR threshold delta: `14`
- Cooldown: `45` minutes
- Breathing duration: `60` seconds

### Session log schema
Defined in `Domain/SessionLogEntry.swift`:

- `timestamp`
- `triggerReason`
- `sessionCompleted`
- `moodAfter`
- `optionalBP` (nullable, planned v1.1 use)

---

## 7) Documentation index

- Product requirements: [`docs/PRD.md`](docs/PRD.md)
- State transitions: [`docs/STATE_MACHINE.md`](docs/STATE_MACHINE.md)
- Technical roadmap: [`docs/TECH_PLAN.md`](docs/TECH_PLAN.md)
- Safety/compliance baseline: [`docs/COMPLIANCE_NOTES.md`](docs/COMPLIANCE_NOTES.md)
- UI style guide: [`docs/UI_STYLE_GUIDE.md`](docs/UI_STYLE_GUIDE.md)
- Accessibility baseline: [`docs/ACCESSIBILITY_BASELINE.md`](docs/ACCESSIBILITY_BASELINE.md)
- Haptic choreography: [`docs/HAPTIC_CHOREOGRAPHY.md`](docs/HAPTIC_CHOREOGRAPHY.md)
- UI QA checklist: [`docs/UI_QA_CHECKLIST.md`](docs/UI_QA_CHECKLIST.md)

---

## 8) Local development setup

## Prerequisites
- macOS with Xcode (latest stable recommended)
- watchOS platform/runtime installed in `Xcode > Settings > Components`
- Swift 5.9+ toolchain (bundled with modern Xcode)

### Run (scaffold)
Project file sudah tersedia: `CalmPulseBP.xcodeproj`.

1. Open `CalmPulseBP.xcodeproj` di Xcode.
2. Pilih scheme `CalmPulseBP`.
3. Pilih simulator Apple Watch (Series 9 / Ultra 2).
4. Run app.

### CLI build check
```bash
xcodebuild -project CalmPulseBP.xcodeproj -scheme CalmPulseBP -destination 'generic/platform=watchOS Simulator' build
```

Jika gagal dengan error platform watchOS belum tersedia, install dulu watchOS platform/runtime dari Xcode Components.

---

## 9) Safety and compliance stance

CalmPulse BP must always preserve the following constraints:

- No diagnosis claims.
- No emergency replacement claims.
- No medication or clinical treatment instructions.
- Explicit recommendation to seek professional care for severe/persistent symptoms.

Baseline wording and rules are maintained in [`docs/COMPLIANCE_NOTES.md`](docs/COMPLIANCE_NOTES.md).

---

## 10) Roadmap

### Phase 0 (current)
- scaffold architecture + docs + state contracts.

### Phase 1 (MVP core)
- HealthKit permission + heart-rate ingestion.
- trigger engine (HR + inactivity + cooldown).
- breathing guidance loop with haptic pacing.
- reflection capture + local daily summary.

### Phase 2
- persistence hardening,
- analytics/debug instrumentation,
- optional iPhone companion for trend visualization.

### Phase 3
- UX optimization, battery tuning, and pilot-readiness hardening.

---

## 11) Contribution notes

For this stage, prioritize:

- keeping state transitions explicit and testable,
- preserving safety wording in user-facing copy,
- avoiding premature complexity before MVP trigger loop is validated.

---

## 12) License

No explicit license is configured yet. Treat as private/proprietary unless a license file is added.


## 13) UI Architecture (Calm Minimal)

UI uses a reusable tokenized system for consistency:

- `UI/Theme/AppTheme.swift`: semantic tokens (color, spacing, radius, typography, opacity)
- `UI/Components`: reusable building blocks (`CalmPrimaryButton`, `CalmSecondaryButton`, `CalmCard`, `StatusChip`, `ScreenHeader`)
- `UI/Layout/ScreenScaffold.swift`: global fixed-budget no-scroll screen layout
- `UI/Modifiers/PressFeedbackStyle.swift`: subtle button micro-interactions

Design goals:
- clear hierarchy,
- calm interactions,
- strong contrast for readability,
- Apple-native feel with low visual noise.

## 14) Design Principles

- **Calm First**: visuals support regulation, not stimulation.
- **Action Clarity**: primary action selalu paling menonjol.
- **Minimal Motion**: animasi subtle, durasi pendek, tidak mengganggu.
- **Consistency**: semua screen mengikuti token/theme yang sama.
- **Safety Presence**: konteks wellness selalu dijaga, tanpa framing diagnosis.



## 15) Final Visual Direction

CalmPulse BP uses **Monochrome + Signal Red/Green** as the default visual direction for watch-first UX refinement.


## 16) Ultra Polish Readiness

Current UI baseline now includes:
- adaptive watch-size typography/spacing behavior,
- explicit accessibility labels/hints for key actions,
- reduce-motion fallback for transitions and breathing visuals,
- documented haptic choreography intent for next-phase runtime integration.


## 17) Monochrome Refactor v2

Current UI direction is **Monochrome + Red/Green Signal System** with strict **No Scroll Screen Rule** for watch-first usability.


## 18) Apple-Native Cleanup

UI now follows strict **No Decorative UI**, **No-Scroll Watch Rule**, and **Monochrome + Signal Color Discipline**.

## 19) Showcase Mode

For screenshots and demos:
- Toggle `screenshotModeEnabled` in `Infrastructure/AppStateModel.swift`.
- When enabled (default): breathing uses deterministic static capture values and calmer transitions.
- Summary renders stable dummy metrics for product showcase captures.
- All user-facing copy is English-only.
