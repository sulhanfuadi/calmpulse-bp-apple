# UI Style Guide — Calm Minimal Ice Blue

## Visual Direction
- Mood: cool, minimalist, calming
- Contrast: balanced for readability on small watch display
- Motion: subtle spring, low-noise transitions

## Size-Class Rules
- **Compact watch heights**:
  - gunakan `Typography.title(compact: true)`
  - kurangi vertical rhythm (`Spacing.dynamic(compact: true)`)
  - prioritaskan 1 primary + 1 secondary CTA visible
- **Regular/Large watch heights**:
  - gunakan typography normal
  - ruang card/metrics bisa lebih breathable

## Color Rules
- Base/background: deep cool navy tones
- Primary accent: ice blue (`accent`, `accentStrong`)
- Secondary accent: soft cyan (`accentSoft`)
- Warning: warm restrained orange-coral (only for stress context)

## Surface Depth
- `surface1`: lightest container
- `surface2`: standard card/container
- `surface3`: elevated/high-focus container
- Use stroke tokens for separation, avoid heavy borders

## Typography
- Title: rounded headline semibold
- Body/action: rounded callout/body
- Supporting text: caption2 with reduced emphasis
- Metrics: title3/title2 semibold for quick scan

## Component Usage
- `CalmPrimaryButton`: single highest-priority action
- `CalmSecondaryButton`: supporting CTA
- `CalmGhostButton`: low-priority/safe skip action
- `StatusChip`: lightweight context/status cue
- `CalmCard`: grouped information and metrics

## Motion Rules
- Press feedback: subtle scale + opacity
- Screen transition: subtle spring
- Breathing animation: calm cyclical pulse
- No aggressive bounce or flashy effects

## Reduce Motion Fallback
- Transition turun ke fade-only ringan
- Breathing pulse amplitude diturunkan
