# Project status

Date: **2026-10-01**

## Stage gates

- **Stage 1 — scaffold and provenance: COMPLETE.**
  - Predecessor inspection remains pinned to:
    - `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
    - `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.
  - The original kickoff evidence remains historical provenance in `notes/preliminary-evidence.md`.

- **Stage 2 — initial prior-art audit and independent computational reproduction: COMPLETE.**
  - Initial theorem-level audit: `notes/prior-art-audit-2.md`.
  - Independent exact-integer framework and preserved outputs: `experiments/stage2_reproduce.py`, `stage2-grid.csv`, `stage2-exact-gcd.csv`, `stage2-run.txt`, and `stage2-summary.md`.
  - The Stage-1 threshold-bound formulation was found to contain a false lower inequality and has been explicitly corrected in `notes/targets.md`; Git history preserves the original.
  - The full text of Chung--Yang (Mediterranean Journal of Mathematics 23, article 209, published 27 September 2026) was not openly inspectable in this audit and remains an unresolved prior-art comparison.
  - No proof work was started.

- **Stage 3 — rigorous informal proof: NOT STARTED.**
- **Stage 4 — deeper final-statement prior-art / novelty audit: NOT STARTED.**
- **Stage 5 — Lean formalisation: NOT STARTED.**
- **Stage 6 — Palomar registration: NOT STARTED.**
- **Stage 7 — research paper: NOT STARTED.**
- **Stage 8 — arXiv preparation/submission: NOT STARTED.**

## Mathematical claim status

- **Project Target A (odd cofactor least-extremal-row theorem, odd (dge5)): CONJECTURED; experimentally checked in 144 Stage-2 cases with zero failures.**
- **Project Target B (sharp pre-extremal selected-coefficient bound): CONJECTURED; experimentally checked in 144 Stage-2 cases with zero failures.**
  - Stage 2 additionally observed unique selected-coefficient argmax (q=Q) in every tested (dge5) case.
- **Restricted-GCD pre-extremal maximum: CONJECTURED from Stage-2 evidence.**
  - Candidate:
    [
    max_{2le qle p^a}v_p(G(C_d(p^a)q;C_d(p^a)))
    =rac{a(d-1)}2+1.
    ]
  - Observed argmax set: (qin{p,p^2,ldots,p^a}).
  - Checked with zero failures in all 168 Stage-2 cases, including (d=3).
- **Project Target C (cubic boundary classification): CONJECTURED; experimentally checked in 24 Stage-2 ((p,a)) cases with zero failures.**
  - The ((p,a)=(2,1)), (m=3,N=6) valuation-2 instance is prior work (McTague; also covered by the pinned Pascal Minus One predecessor) and is not a new phenomenon.
- **Threshold prerequisite (r_p(C_d(p^a))=a(d-1)): CONJECTURED / experimentally checked, not proved.**
  - Corrected candidate bounds:
    [
    p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}.
    ]
  - They held in 168/168 Stage-2 cases.
  - The Stage-1 proposed lower bound (p^{a(d-1)}<C_d(p^a)) held in 0/168 cases and has been withdrawn.
- **Novelty / historical priority: UNRESOLVED.**
  - The Stage-2 documented search located no theorem mathematically equivalent to the full exact Targets A/B/C.
  - This is negative-search evidence only.
  - The recent inaccessible Chung--Yang 2026 source remains an explicit unresolved comparison, to be revisited in Stage 4.

## Stage-2 computational coverage

The preserved run used exact integer arithmetic and:

- (din{3,5,7,9,11,13,15});
- 24 prime/exponent pairs, including (p=2) through (a=7), multiple odd primes, and (a=1);
- 168 ((p,a,d)) cases;
- every multiplier (q=2,ldots,Q+1), totaling 5,943 row/multiplier checks;
- 12,956 independent small Kummer-vs-Legendre sanity comparisons;
- 225 exact-integer restricted-GCD rows with (Nle10,000).

Kummer and Legendre agreed on every project multiplier row, and every exact integer GCD valuation agreed with both valuation implementations on the tractable reference set.

## Reused prior mathematics

`Pascal-Extremes` already proves and formalises, for prime (p), (mge2), (p
mid m),
[
max_{N>m, mmid N}v_p(G(N;m))=r_p(m),
]
including constructive attainment before defining its least extremal row (T).

It also proves and formalises, for prime (p) and (age2),
[
T_p(p^a+1)=p^{3a}+1.
]

These remain predecessor results, not claims of this repository. No formal dependency has been introduced in Stage 2.

## Proof / experiment trust boundary

No new infinite theorem has been proved. Stage-2 computation is finite evidence only. No Lean, Palomar, paper, or arXiv work was begun.

## Next action

Run **Stage 3 only**: produce rigorous informal proofs or discover a genuine obstruction. In particular, prove the corrected threshold prerequisite before using (r_p(C_d(p^a))=a(d-1)); keep selected-coefficient and restricted-GCD arguments distinct; preserve explicit attribution for the cubic ((2,1)) edge; and do not begin the Stage-4 final prior-art audit or any later stage.
