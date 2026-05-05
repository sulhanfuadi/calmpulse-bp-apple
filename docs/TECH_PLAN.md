# Technical Plan (Scaffold -> MVP)

## Architecture
- watchOS-first, SwiftUI-first
- Lightweight layers:
  - App: entry/root routing
  - Features: per-state views + actions
  - Domain: contracts/models/state/config
  - Infrastructure: state holder, storage adapter, health adapter (next)

## Milestones
1. Scaffold UI states + transition wiring (done in this phase)
2. HealthKit ingestion adapter (HR + permission flow)
3. Trigger engine + cooldown gate
4. Breathing loop + haptic pacing
5. Reflection logging + summary metrics
6. Hardening + simulator/device validation

## Storage
- Phase awal: local-only (UserDefaults/SwiftData)
- Session log minimal: timestamp, reason, completed, mood, optional BP

## Observability (later)
- Local debug events for state transitions
- Basic counters for trigger/completion/reflection
