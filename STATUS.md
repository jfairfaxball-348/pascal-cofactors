# Project status

Date: **2026-10-02**

## Stage gates

- **Stage 1 — scaffold and provenance: COMPLETE.**
  - Predecessor inspection remains pinned to:
    - jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5
    - jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94
  - The original kickoff evidence remains historical provenance in notes/preliminary-evidence.md.

- **Stage 2 — initial prior-art audit and independent computational reproduction: COMPLETE.**
  - Initial theorem-level audit: notes/prior-art-audit-2.md.
  - Independent exact-integer framework and preserved outputs: experiments/stage2_reproduce.py, experiments/stage2-grid.csv, experiments/stage2-exact-gcd.csv, experiments/stage2-run.txt, and experiments/stage2-summary.md.
  - The Stage-1 threshold-bound formulation was found to contain a false lower inequality and was corrected before proof work.

- **Stage 3 — rigorous informal proof: COMPLETE.**
  - Proof note: notes/stage3-proof.md.
  - Targets A, B, and C are proved informally.
  - The stronger coefficient-scaling and exact restricted-GCD statements are proved informally.

- **Stage 4 — deeper final-statement prior-art / novelty audit: COMPLETE.**
  - Final theorem-level audit: notes/prior-art-audit-4.md.
  - The exact Stage-3 statements, not the earlier conjectural formulations, were audited.
  - All Stage-2 serious sources were revisited, the pinned predecessors were re-inspected, and materially relevant 2026 literature was searched through 2 October 2026.
  - The Pascal Extremes predecessor is now also public as arXiv:2610.01328v1 (1 October 2026); it remains same-author prior work.
  - The Chung--Yang 2026 full theorem text remained subscription-inaccessible after renewed exact-title, DOI, PDF/manuscript, arXiv, ResearchGate, institutional, and SharedIt searches. It remains an explicit unresolved comparison.
  - No Stage-5 Lean, Palomar, paper, or arXiv work was begun.

- **Stage 5 — Lean formalisation: IN PROGRESS.**
  - Working branch: `stage5-lean`.
  - Lean toolchain pinned to `leanprover/lean4:v4.35.0-rc2`.
  - Formal dependency pinned to `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`; its manifest pins Mathlib to `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.
  - `PascalCofactors/Basic.lean` compiles in the clean GitHub Actions build.
  - `PascalCofactors/Threshold.lean` is down to one local Nat-arithmetic proof obligation in the private `exponent_lower_identity`; the mathematical threshold statement has not been weakened.
  - `PascalCofactors/Digits.lean` is drafted following the Stage-3 digit-block architecture but has not yet been compiler-reached because compilation still stops in `Threshold.lean`.
  - Coefficient scaling, selected-coefficient maxima, restricted-GCD formulas, sparse endpoint, Target A, and Target C remain to be formalised.
  - Stage 5 is not complete; no Stage-6 work has begun.
- **Stage 6 — Palomar registration: NOT STARTED.**
- **Stage 7 — research paper: NOT STARTED.**
- **Stage 8 — arXiv preparation/submission: NOT STARTED.**

## Mathematical claim status

Let \(p\) be prime, \(a\ge1\), \(Q=p^a\), \(d=2s+1\ge3\) odd, and
\[
m=C_d(Q)=\frac{Q^d+1}{Q+1}.
\]

- **Threshold prerequisite: PROVED INFORMALLY.**
  \[
  p^{a(d-1)-1}<m<p^{a(d-1)},\qquad p\nmid m,
  \]
  hence
  \[
  r_p(m)=a(d-1)=2as.
  \]
  The false Stage-1 lower bound \(p^{a(d-1)}<m\) remains withdrawn and is not used.

- **Finite-window coefficient scaling: PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  For
  \[
  2\le q\le Q,\qquad 1\le j<q,
  \]
  \[
  v_p\binom{mq}{mj}
  =
  as+v_p\binom qj.
  \]

- **Project Target B: PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  \[
  v_p\binom{mq}{m}=as+v_p(q),
  \]
  so
  \[
  \max_{2\le q\le Q}v_p\binom{mq}{m}
  =
  as+a
  =
  \frac{a(d+1)}2,
  \]
  uniquely at
  \[
  q=Q=p^a.
  \]

- **Restricted-GCD pre-extremal formula: PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  For every \(2\le q\le Q\),
  \[
  v_p(G(mq;m))
  =
  as+
  \begin{cases}
  1,&q=p^b\text{ for some }1\le b\le a,\\
  0,&\text{otherwise}.
  \end{cases}
  \]
  Consequently
  \[
  \max_{2\le q\le Q}v_p(G(mq;m))
  =
  \frac{a(d-1)}2+1,
  \]
  with exact argmax set
  \[
  \{p,p^2,\ldots,p^a\}.
  \]

- **Sparse endpoint: PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  At \(q=Q+1\),
  \[
  m(Q+1)=Q^d+1,
  \qquad
  v_p(G(Q^d+1;m))=a(d-1)=r_p(m).
  \]

- **Project Target A, odd \(d\ge5\): PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  \[
  T_p(C_d(p^a))=p^{ad}+1.
  \]

- **Project Target C, \(d=3\): PROVED INFORMALLY; CLEARED FOR STAGE 5.**
  \[
  T_p(p^{2a}-p^a+1)=
  \begin{cases}
  p(p^2-p+1),&a=1,\\
  p^{3a}+1,&a\ge2.
  \end{cases}
  \]
  The \((p,a)=(2,1)\), \(m=3,N=6\) valuation-2 phenomenon is a prior-work instance recorded by McTague and the pinned Pascal Minus One predecessor. The full family theorem may be formalised, but that isolated instance must never be presented as new.

## Stage-4 literature disposition

The final audit found substantial prior work and preserved these boundaries:

- the fixed-multiple restricted-GCD family \(G(N;m)\) / Wu's \(g(m,n)\) is prior art;
- Kummer carries and Legendre/digit-sum valuation formulas are classical;
- Pascal Extremes supplies the prior global maximum / existence theorem for \(r_p(m)\);
- Pascal Minus One's \`scaling_valuation\` is prior common-\(p^c\) GCD scaling, but it is mathematically different from the Stage-3 additive coefficient scaling law;
- Pascal Extremes proves the complementary theorem
  \[
  T_p(p^a+1)=p^{3a}+1\qquad(a\ge2),
  \]
  where the least multiplier is \(\Phi_6(p^a)\); this does not imply the cofactor-side Target C obtained by swapping the complementary factors;
- McTague and Pascal Minus One already contain the \((p,a)=(2,1),m=3,N=6\) valuation phenomenon;
- Wu has exactly the same GCD object under different prime-power-modulus hypotheses;
- Hong, Chiu--Yuan--Zhou, and Chung--Yang--Zhou use different lower-index selectors;
- Guo--Qiu--Cao--Feng--Gao use a different aggregation across row multipliers;
- Chung--Yang 2026 remains an unresolved theorem-level comparison because the full text was not accessible.

No accessible theorem located in the documented Stage-4 search is an exact equivalent of, or theorem-level implication for, the **family-level** Stage-3 cofactor package beyond the explicit prior edge and general predecessor ingredients above. This is a documented-search statement, not a novelty or historical-priority claim.

## Formalisation suitability

**Stage-5 gate: CLEARED.**

The Stage-3 theorem statements remain suitable for Lean formalisation in their strongest proved forms. Stage 5 must preserve the prior-work distinctions in notes/provenance and notes/prior-art-audit-4.md. Formalisation itself will not establish novelty.

## Stage-2 computational coverage retained as regression evidence only

The preserved Stage-2 run used exact integer arithmetic and:

- \(d\in\{3,5,7,9,11,13,15\}\);
- 24 prime/exponent pairs;
- 168 \((p,a,d)\) cases;
- every multiplier \(q=2,\ldots,Q+1\), totaling 5,943 row/multiplier checks;
- 12,956 independent small Kummer-vs-Legendre sanity comparisons;
- 225 exact-integer restricted-GCD rows with \(N\le10,000\).

These computations remain regression evidence only. None is an infinite proof step or novelty evidence.

## Proof / experiment / novelty trust boundary

- Stage 3 establishes **rigorous informal proofs**, not Lean formalisation.
- Stage 4 establishes a **documented final-statement literature audit**, not historical priority.
- Stage-2 computation is finite evidence only.
- Chung--Yang 2026 remains unresolved at theorem level.
- Lean formalisation has begun and is incomplete. No Palomar, paper, or arXiv work has begun.

## Next action

Continue **Stage 5 only** from `notes/session-05-handoff.md`: first finish the remaining threshold arithmetic obligation, then compiler-check the digit-sum layer before proceeding to coefficient scaling and the later GCD/extremal theorems. Do not begin Stage 6 until the full cleared Stage-4 theorem package compiles.
