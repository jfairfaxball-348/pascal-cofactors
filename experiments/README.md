# Experiments

Stage 2 independent computational reproduction was completed on **2026-10-01**.

No experiment is part of the proof trust boundary.

## Stage-2 artifacts

- experiments/stage2_reproduce.py — standard-library-only exact-integer reproduction script.
- experiments/stage2-grid.csv — complete \((p,a,d)\)-level output for the stated grid.
- experiments/stage2-exact-gcd.csv — raw tractable-row exact integer GCD cross-checks.
- experiments/stage2-run.txt — deterministic run summary and output hashes.
- experiments/stage2-summary.md — methods, exact ranges, exclusions, findings, and trust boundary.

The framework keeps selected coefficient valuations and restricted-GCD valuations separate. It compares Kummer borrow counts with an independent Legendre factorial-valuation implementation on every tested multiplier and with direct integer GCDs when \(N\le10,000\).

Re-run from this directory with:

    python3 stage2_reproduce.py

The preserved run used Python 3.13.5. Exact grids and SHA-256 hashes are recorded in experiments/stage2-summary.md and experiments/stage2-run.txt.

Finite agreement is evidence and regression coverage only. It is not a proof or evidence of novelty.
