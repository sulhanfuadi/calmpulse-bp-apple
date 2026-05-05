# PRD — CalmPulse BP (Apple Watch)

## Problem
Pengguna hipertensi muda sering mengalami lonjakan stres harian, tetapi tidak selalu punya intervensi cepat dan ringan di momen kritis.

## Audience
- Usia 20–40
- Peduli kesehatan kardiovaskular
- Pengguna Apple Watch yang nyaman dengan interaksi singkat

## MVP goals
- Deteksi momen check-in berbasis sinyal sederhana (HR + konteks aktivitas/cooldown)
- Dorong intervensi napas 60 detik dengan haptic guidance
- Catat refleksi mood singkat pasca sesi
- Tampilkan ringkasan harian sederhana

## Non-goals (v1)
- Diagnosis medis
- Rekomendasi obat
- Penanganan keadaan darurat
- Integrasi backend/cloud penuh

## Success metrics (early)
- Session start rate
- Session completion rate
- Reflection completion rate
- Repeat usage harian/mingguan

## Risks
- False trigger (terlalu sensitif / kurang sensitif)
- Battery impact
- Misinterpretasi sebagai alat medis

## Guardrails
- Disclaimer eksplisit non-diagnosis/non-emergency
- Trigger konservatif + cooldown
- Fokus edukasi self-awareness
