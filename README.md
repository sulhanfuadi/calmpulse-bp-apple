# CalmPulse BP (Apple Watch)

CalmPulse BP is a watch-first behavioral companion for young adults with hypertension to practice short, guided micro-interventions when stress signals rise.

> **Medical Safety Notice**
> CalmPulse BP is **not a diagnostic tool**, **not an emergency service**, and **does not replace professional medical care**.

## Project Snapshot
- **Project type:** watchOS-first accessibility and behavior-support product prototype
- **Primary outcome:** help users build a repeatable pause-and-regulate habit in daily routines
- **Current status:** Scaffold + PRD phase (core flow and domain contracts are available)
- **Scope boundary:** behavioral support only, not clinical diagnosis

## Why This Product Exists
Many young adults with hypertension experience short stress spikes during study, work, or commute periods and miss the right moment to pause.

CalmPulse BP is designed to:
- detect simple high-risk moments (initially with lightweight heuristics),
- nudge users into a short breathing intervention,
- capture post-session reflection,
- reinforce daily self-awareness with a minimal summary.

## Product Vision
CalmPulse BP aims to support a repeatable five-step habit:
1. **Notice** stress signal
2. **Pause** briefly
3. **Regulate** through guided breathing
4. **Reflect** quickly
5. **Learn** from daily patterns

## MVP User Flow
1. **Onboarding** — user acknowledges safety and product positioning.
2. **Idle Monitoring** — app waits in low-friction mode.
3. **Triggered** — user receives a prompt to pause.
4. **Breathing Active** — short guided breathing (target: 60 seconds).
5. **Reflection Pending** — quick mood input.
6. **Summary** — daily behavior reinforcement metrics.

Detailed transition rules: `docs/STATE_MACHINE.md`

## App Screenshots
<p align="center">
  <img src="assets/screenshots/01-onboarding.png" width="220" alt="Onboarding screen" />
  <img src="assets/screenshots/02-idle.png" width="220" alt="Idle monitoring screen" />
  <img src="assets/screenshots/03-triggered.png" width="220" alt="Triggered alert screen" />
</p>
<p align="center">
  <img src="assets/screenshots/04-breathing.png" width="220" alt="Breathing session screen" />
  <img src="assets/screenshots/05-reflection.png" width="220" alt="Reflection input screen" />
  <img src="assets/screenshots/06-summary.png" width="220" alt="Summary metrics screen" />
</p>

## Architecture Overview
### Layered Structure
- **App** — entry point and root state routing
- **Features** — screen/state-specific SwiftUI modules
- **Domain** — business contracts and shared models
- **Infrastructure** — state holder and adapters (storage/health pipeline planned)
- **Resources** — assets, strings, and theming primitives

### Source Tree
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

## Implemented vs Planned
### Implemented
- watchOS-first SwiftUI scaffold
- state-driven flow routing:
  - `Onboarding`
  - `IdleMonitoring`
  - `Triggered`
  - `BreathingActive`
  - `ReflectionPending`
  - `Summary`
- initial domain contracts for state, trigger reason, mood reflection, config, and session log model
- product, technical, and compliance documentation set

### Planned (Not Yet Implemented)
- real HealthKit ingestion pipeline
- production trigger engine
- persisted user/session storage
- production-grade haptic breathing loop
- full iPhone companion app and cross-device sync

## Domain Contract Summary
### App State
Defined in `Domain/AppState.swift`:
- `Onboarding`
- `IdleMonitoring`
- `Triggered`
- `BreathingActive`
- `ReflectionPending`
- `Summary`

### Config Defaults
Defined in `Domain/AppConfig.swift`:
- `hrThresholdDelta`: `14`
- `cooldownMinutes`: `45`
- `breathingDurationSeconds`: `60`

### Session Log Schema
Defined in `Domain/SessionLogEntry.swift`:
- `timestamp`
- `triggerReason`
- `sessionCompleted`
- `moodAfter`
- `optionalBP` (nullable, planned for v1.1)

## Documentation Index
- Product requirements: `docs/PRD.md`
- State transitions: `docs/STATE_MACHINE.md`
- Technical roadmap: `docs/TECH_PLAN.md`
- Safety/compliance baseline: `docs/COMPLIANCE_NOTES.md`
- UI style guide: `docs/UI_STYLE_GUIDE.md`
- Accessibility baseline: `docs/ACCESSIBILITY_BASELINE.md`
- Haptic choreography: `docs/HAPTIC_CHOREOGRAPHY.md`
- UI QA checklist: `docs/UI_QA_CHECKLIST.md`

## Local Development
### Prerequisites
- macOS with latest stable Xcode
- watchOS runtime installed (`Xcode > Settings > Platforms`)
- Apple ID configured in Xcode for signing (if deploying to physical watch)

### Setup
```bash
cd calmpulse-bp-apple
open CalmPulseBP.xcodeproj
```

### Run on Simulator
1. Choose a watchOS simulator target.
2. Build and run from Xcode.
3. Navigate through the six main app states.

## Validation Checklist (Current Stage)
- App compiles on watchOS simulator
- End-to-end state flow can be navigated manually
- Safety notice is visible in onboarding
- Reflection and summary screens render correctly
- Documentation links resolve correctly

## Current v1 Boundaries
- Heuristic trigger logic only (non-clinical)
- No persistent storage in current scaffold
- No automatic medical decisioning
- No emergency alert integration

## Next Iterations
- Integrate HealthKit-based signal ingestion
- Add robust trigger logic calibration and cooldown tuning
- Implement local/session persistence
- Refine haptic choreography with usability testing
- Build iPhone companion and sync strategy
