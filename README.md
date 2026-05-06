# CalmPulse BP (Apple Watch)

CalmPulse BP is a watch-first behavioral companion for young adults with hypertension. It helps users notice stress signals, run short guided breathing, and reflect after each session to build a repeatable self-regulation habit.

## Why This Problem Matters
Many young adults with hypertension do not struggle only with long-term health plans—they struggle with **short stress spikes** during classes, work blocks, and commutes. In those moments, the key issue is timing: people often realize they are overwhelmed **after** the peak has passed, not during the escalation window when a micro-intervention would be most useful.

CalmPulse BP focuses on that missing window with a low-friction watch flow: notice → pause → breathe → reflect.

## Founder Motivation
I built this from a bottom-up perspective because I have also experienced hypertension patterns linked to chronic stress and poor rest. That lived experience shaped the product direction: instead of starting with a complex clinical dashboard, this MVP starts with practical moment-to-moment behavior support that is realistic to use in daily life.

> **Medical Safety Notice**
> CalmPulse BP is **not a diagnostic tool**, **not an emergency service**, and **does not replace professional medical care**.

## User Research Insights
Research context for this MVP is early-stage and practical: lightweight conversations and observation-based feedback from young adults with stress-heavy routines, used to prioritize intervention flow and watch usability.

Key findings and product decisions:
- **Finding:** users miss the stress peak moment during routine activities.
  **Decision:** add a direct trigger prompt that encourages immediate pause.
- **Finding:** users are more likely to complete very short interventions.
  **Decision:** set a brief guided breathing session (target 60 seconds).
- **Finding:** users need a simple way to capture “how I feel after”.
  **Decision:** include quick reflection mood input after each session.
- **Finding:** users respond better to lightweight progress signals than dense charts.
  **Decision:** provide compact daily summary metrics from session logs.

Research scope note: this is a small, early-stage discovery baseline and is not intended as clinical evidence.

## Project Snapshot
- **Type:** watchOS-first accessibility and behavior-support MVP
- **Primary user:** young adults with hypertension in daily study/work routines
- **Current status:** scaffold + runtime-dynamic MVP flow
- **Core behavior:** state-driven intervention flow with session-based summary metrics
- **Scope boundary:** behavioral support only, not clinical diagnosis

## Core User Flow
1. **Onboarding** — user acknowledges safety and product positioning.
2. **Idle Monitoring** — app waits in low-friction mode.
3. **Triggered** — user receives a prompt to pause.
4. **Breathing Active** — short guided breathing (target: 60 seconds).
5. **Reflection Pending** — user records post-session mood.
6. **Summary** — app shows live metrics derived from recorded sessions.

Detailed transition rules: [docs/STATE_MACHINE.md](docs/STATE_MACHINE.md)

## Current MVP Capabilities
- watchOS-first SwiftUI app scaffold with six routed states
- runtime session logging through trigger → breathing/skip → reflection → summary
- summary metrics derived from in-app session data (not hardcoded demo values)
- reflection result captured into session mood outcome
- breathing phase countdown with inhale/exhale state handling
- empty-state handling when no session exists yet

## Known Limitations
- no persistent storage across app relaunch yet
- no real HealthKit ingestion pipeline yet
- trigger behavior is still heuristic/non-clinical
- no iPhone companion sync in current MVP
- no emergency escalation integration

## Testing Status
- Functional validation is currently performed on **watchOS Simulator only**.
- Physical Apple Watch testing has **not** been completed yet.
- Current outcomes should be interpreted as **Scaffold/MVP-stage validation**.

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

> Screenshots represent the current simulator-based MVP state.

## Architecture & Docs
### Layered Architecture
- **App** — app entry point and root state routing
- **Features** — screen/state-specific UI modules
- **Domain** — app states, trigger/mood contracts, and session model
- **Infrastructure** — state model, flow orchestration, timer/haptic adapters
- **Resources/UI** — theme tokens and reusable components

### Domain Notes
- `Domain/AppState.swift` defines the six app states.
- `Domain/AppConfig.swift` defines runtime defaults:
  - `hrThresholdDelta`: `14`
  - `cooldownMinutes`: `45`
  - `breathingDurationSeconds`: `60`
- `Domain/SessionLogEntry.swift` includes:
  - `timestamp`
  - `triggerReason`
  - `sessionCompleted`
  - `moodAfter`
  - `recoveryDurationSeconds`
  - `optionalBP` (nullable, planned for v1.1)

### Key Documentation
- Product requirements: [docs/PRD.md](docs/PRD.md)
- State transitions: [docs/STATE_MACHINE.md](docs/STATE_MACHINE.md)
- Technical roadmap: [docs/TECH_PLAN.md](docs/TECH_PLAN.md)
- Safety/compliance notes: [docs/COMPLIANCE_NOTES.md](docs/COMPLIANCE_NOTES.md)
- Accessibility baseline: [docs/ACCESSIBILITY_BASELINE.md](docs/ACCESSIBILITY_BASELINE.md)
- UI style guide: [docs/UI_STYLE_GUIDE.md](docs/UI_STYLE_GUIDE.md)
- Haptic choreography: [docs/HAPTIC_CHOREOGRAPHY.md](docs/HAPTIC_CHOREOGRAPHY.md)
- UI QA checklist: [docs/UI_QA_CHECKLIST.md](docs/UI_QA_CHECKLIST.md)

## Local Run
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
3. Navigate through the six core app states.
