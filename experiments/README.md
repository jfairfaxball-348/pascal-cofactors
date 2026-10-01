# Experiments

Stage 2 independent computational reproduction was completed on **2026-10-01**.

No experiment is part of the proof trust boundary.

## Stage-2 artifacts

- `stage2_reproduce.py` — standard-library-only exact-integer reproduction script.
- `stage2-grid.csv` — complete ((p,a,d))-level output for the stated grid.
- `stage2-exact-gcd.csv` — raw tractable-row exact integer GCD cross-checks.
- `stage2-run.txt` — deterministic run summary and output hashes.
- `stage2-summary.md` — methods, exact ranges, exclusions, findings, and trust boundary.

The framework keeps selected coefficient valuations and restricted-GCD valuations separate. It compares Kummer borrow counts with an independent Legendre factorial-valuation implementation on every tested multiplier and with direct integer GCDs when (Nle10,000).

Re-run from this directory with:

```bash
python3 stage2_reproduce.py
```

The preserved run used Python 3.13.5. Exact grids and SHA-256 hashes are recorded in `stage2-summary.md` and `stage2-run.txt`.

Finite agreement is evidence and regression coverage only. It is not a proof or evidence of novelty.
