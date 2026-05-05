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

---

## 8) Local development setup

## Prerequisites
- macOS with Xcode (latest stable recommended)
- watchOS simulator components installed in Xcode
- Swift 5.9+ toolchain (bundled with modern Xcode)

### Run (scaffold)
Because this repo is scaffold-first, create/open a watchOS app target in Xcode and attach source folders:

1. Open this folder/project container in Xcode.
2. Ensure a watchOS app target named `CalmPulseBP` exists.
3. Add source files from `App`, `Features`, `Domain`, `Infrastructure` to that target.
4. Select an Apple Watch simulator and run.

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
