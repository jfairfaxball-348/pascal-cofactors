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
  - The full text of Chung--Yang (Mediterranean Journal of Mathematics 23, article 209, published 27 September 2026) remained inaccessible in Stage 2 and is still an unresolved Stage-4 comparison.

- **Stage 3 — rigorous informal proof: COMPLETE.**
  - Proof note: notes/stage3-proof.md.
  - Targets A, B, and C are proved informally.
  - The stronger Stage-2 coefficient-argmax and restricted-GCD observations are also proved informally, in stronger exact forms.
  - No Stage-4 literature work, Lean, Palomar, paper, or arXiv work was begun.

- **Stage 4 — deeper final-statement prior-art / novelty audit: NOT STARTED.**
- **Stage 5 — Lean formalisation: NOT STARTED.**
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

- **Finite-window coefficient scaling: PROVED INFORMALLY.**
  For
  \[
  2\le q\le Q,\qquad 1\le j<q,
  \]
  \[
  v_p\binom{mq}{mj}
  =
  as+v_p\binom qj.
  \]

- **Project Target B: PROVED INFORMALLY.**
  \[
  \max_{2\le q\le Q}v_p\binom{mq}{m}
  =
  as+a
  =
  \frac{a(d+1)}2.
  \]
  The stronger Stage-2 observation is also proved: the selected-coefficient maximum is attained uniquely at
  \[
  q=Q=p^a.
  \]

- **Restricted-GCD pre-extremal formula: PROVED INFORMALLY.**
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
  q\in\{p,p^2,\ldots,p^a\}.
  \]

- **Sparse endpoint: PROVED INFORMALLY.**
  At \(q=Q+1\),
  \[
  m(Q+1)=Q^d+1,
  \]
  and
  \[
  v_p(G(Q^d+1;m))=a(d-1)=r_p(m).
  \]

- **Project Target A, odd \(d\ge5\): PROVED INFORMALLY.**
  \[
  T_p(C_d(p^a))=p^{ad}+1.
  \]
  Endpoint attainment and strict non-attainment for every \(2\le q\le p^a\) are both proved.

- **Project Target C, \(d=3\): PROVED INFORMALLY.**
  \[
  T_p(p^{2a}-p^a+1)=
  \begin{cases}
  p(p^2-p+1),&a=1,\\
  p^{3a}+1,&a\ge2.
  \end{cases}
  \]
  The \((p,a)=(2,1)\), \(m=3,N=6\) valuation-2 phenomenon remains explicitly classified as prior work recorded by McTague and the pinned Pascal Minus One predecessor.

- **Novelty / historical priority: UNRESOLVED.**
  - Stage 3 changes theorem status from conjectured to proved informally; it does not establish novelty.
  - Stage 2 located no mathematically equivalent theorem for the full exact Targets A/B/C in the documented search, but that remains negative-search evidence only.
  - The recent inaccessible Chung--Yang 2026 source remains an explicit unresolved comparison for Stage 4.

## Predecessor dependency checked in Stage 3

At the exact pin
jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94,
the global maximum theorem assumes:

- \(p\) prime;
- \(m\ge2\);
- \(p\nmid m\).

Stage 3 proves \(m\ge3\) and \(p\nmid m\) for the cofactor family, so the theorem applies and identifies \(r_p(m)\) as the global maximum. The Stage-3 proof directly establishes the new sparse endpoint and lower-multiplier minimality; it does not relabel the predecessor global theorem as new work.

The predecessor theorem
\[
T_p(p^a+1)=p^{3a}+1\qquad(a\ge2)
\]
also remains explicit complementary prior mathematics and is not used to infer Target C.

## Stage-2 computational coverage retained as regression evidence only

The preserved Stage-2 run used exact integer arithmetic and:

- \(d\in\{3,5,7,9,11,13,15\}\);
- 24 prime/exponent pairs;
- 168 \((p,a,d)\) cases;
- every multiplier \(q=2,\ldots,Q+1\), totaling 5,943 row/multiplier checks;
- 12,956 independent small Kummer-vs-Legendre sanity comparisons;
- 225 exact-integer restricted-GCD rows with \(N\le10,000\).

These computations remain regression evidence only. None is used as an infinite proof step in notes/stage3-proof.md.

## Proof / experiment / novelty trust boundary

- Stage 3 establishes **rigorous informal proofs**, not Lean formalisation.
- Stage-2 computation is finite evidence only.
- Proof does not establish novelty or historical priority.
- No Lean, Palomar, paper, or arXiv work has begun.

## Next action

Run **Stage 4 only**: perform a deeper theorem-level prior-art / novelty audit against the exact final proved statements in notes/stage3-proof.md, including the newly proved finite-window scaling law and exact restricted-GCD formula, and revisit the unresolved Chung--Yang 2026 full text if accessible. Do not begin Lean or any later stage during Stage 4.
