# Session 02 handoff — Stage 2 prior art and independent reproduction

Date: **2026-10-01**

## Completed in this session

Stage 2 only was completed. No informal proof, Lean development, Palomar work, paper drafting, or arXiv work was started.

### Literature

Created notes/prior-art-audit-2.md with theorem-level/source-level comparison against:

- pinned Pascal Extremes;
- pinned Pascal Minus One and its now-public arXiv paper;
- McTague, corrected arXiv v5;
- Wu arXiv:2606.20940v2;
- Chung--Yang--Zhou (2025);
- Chiu--Yuan--Zhou (2023);
- Chung--Yang (2026);
- Siao Hong (2016);
- Guo--Qiu--Cao--Feng--Gao (2026);
- Kummer;
- additional 2026 search formulations and false-positive screening.

Important conclusions:

1. Wu's
   \[
   g(m,q)=\gcd_{1\le k<q}\binom{mq}{mk}
   \]
   is exactly \(G(mq;m)\), so the GCD object itself is established prior art.
2. Pascal Extremes supplies the global maximum \(r_p(m)\) and the complementary-factor predecessor
   \[
   T_p(p^a+1)=p^{3a}+1
   \]
   for \(a\ge2\); it does not determine the cofactor least row.
3. McTague and Pascal Minus One directly cover the cubic edge \(p=2,a=1,m=3,N=6\) as a valuation phenomenon. That edge must be attributed as prior work.
4. No theorem mathematically equivalent to the full exact Targets A/B/C was located in the documented Stage-2 search. This is negative-search evidence only, not a novelty claim.
5. The recent Chung--Yang paper, Mediterranean Journal of Mathematics 23, article 209, version of record 27 September 2026, remains a concrete unresolved source because its full theorem text was not openly inspectable. Stage 4 must revisit it.

### Computation

Created:

- experiments/stage2_reproduce.py;
- experiments/stage2-grid.csv;
- experiments/stage2-exact-gcd.csv;
- experiments/stage2-run.txt;
- experiments/stage2-summary.md.

Independent methods:

- Kummer borrow counting;
- Legendre factorial valuation;
- direct exact integer row GCD with math.comb/math.gcd for \(N\le10,000\).

Exact preserved grid:

- \(d\in\{3,5,7,9,11,13,15\}\);
- 24 \((p,a)\) pairs:
  - \(p=2,\ 1\le a\le7\);
  - \(p=3,\ 1\le a\le4\);
  - \(p=5,\ 1\le a\le3\);
  - \(p=7,11,\ 1\le a\le2\);
  - \(p=13,17,19,23,29,31,\ a=1\);
- 168 parameter cases;
- exhaustive \(q=2,\ldots,Q+1\), 5,943 multiplier rows;
- 12,956 additional Kummer/Legendre sanity valuations;
- 225 exact integer GCD rows.

All independent comparisons matched.

### Target findings

- Target A: zero failures in 144 \(d\ge5\) cases.
- Target B: zero failures in 144 \(d\ge5\) cases; selected-coefficient maximum was uniquely at \(q=Q\) throughout the grid.
- Target C: zero failures in 24 \(d=3\) cases.
- New restricted-GCD experimental candidate, zero failures in all 168 cases:
  \[
  \max_{2\le q\le Q}v_p(G(C_d(Q)q;C_d(Q)))
  =
  \frac{a(d-1)}2+1,
  \]
  with observed argmax set
  \[
  q\in\{p,p^2,\ldots,p^a\}.
  \]

All of these remain conjectural until proved.

## Critical Stage-2 correction

The Stage-1 proposed threshold lower bound
\[
p^{a(d-1)}<C_d(p^a)
\]
is false. It held in 0/168 Stage-2 cases.

The corrected prerequisite recorded in notes/targets.md is
\[
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}.
\]

It held in 168/168 cases and gives the intended
\[
r_p(C_d(p^a))=a(d-1).
\]

Stage 3 must prove this before using the threshold equality. Do not silently reuse the Stage-1 incorrect inequalities.

## Stage-3 proof priorities

Stage 3 should remain an **informal rigorous proof session only**.

A sensible dependency order is:

1. prove \(p\nmid C_d(p^a)\), basic positivity/integrality, and the corrected threshold inequalities;
2. prove the exact sparse-row endpoint valuation at \(q=Q+1\);
3. prove the Target-B selected-coefficient formula/max and enough strict pre-extremal control for Target A;
4. prove strict Target-A lower-multiplier non-attainment for every \(2\le q\le Q\);
5. treat \(d=3\) separately and prove Target C, explicitly attributing the \(p=2,a=1,N=6\) prior-work edge;
6. investigate the stronger restricted-GCD maximum/argmax pattern. Prove it if the argument is clean and rigorous; otherwise do not let it block the core A/B/C proof.

Coefficient valuations and GCD valuations must remain logically and notationally separate.

The Pascal Extremes global-max theorem may be cited as predecessor mathematics under its exact hypotheses. Do not rebrand it as a new proof result.

## Unresolved prior-art item carried forward

Do not convert the Stage-2 negative search into a novelty claim. The full Chung--Yang 2026 article remains inaccessible in this audit. Stage 4 exists specifically to re-audit the exact statements that survive Stage 3.

## Ready-to-paste Stage-3 prompt

Continue the Pascal Cofactors project at Stage 3 only in jfairfaxball-348/pascal-cofactors.

First read AGENTS.md, STATUS.md, notes/targets.md, notes/provenance.md, notes/prior-art-audit-2.md, experiments/stage2-summary.md, and notes/session-02-handoff.md. Preserve the predecessor pins exactly and treat the repository as authoritative.

Develop rigorous informal proofs for the Stage-2-surviving mathematical statements only. Do not begin Stage 4 literature work, Lean, Palomar, paper, or arXiv work.

Before using the extremal threshold, prove the corrected prerequisite
\[
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}
\]
and \(p\nmid C_d(p^a)\), hence \(r_p(C_d(p^a))=a(d-1)\). The Stage-1 lower bound \(p^{a(d-1)}<C_d(p^a)\) was false and must not be reused.

Prove Target A for odd \(d\ge5\), including both endpoint attainment at \(q=p^a+1\) and strict non-attainment for every \(2\le q\le p^a\). Prove Target B as a selected-coefficient statement
\[
\max_{2\le q\le p^a}v_p\binom{C_d(p^a)q}{C_d(p^a)}=\frac{a(d+1)}2,
\]
keeping it distinct from the restricted GCD. Determine whether the Stage-2 stronger observations (unique coefficient argmax \(q=p^a\), and restricted-GCD maximum \(\frac{a(d-1)}2+1\) with argmax \(q=p,p^2,\ldots,p^a\)) admit clean rigorous proofs; include them only if proved.

Prove the cubic Target C classification separately:
\[
T_p(p^{2a}-p^a+1)=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
\]
Explicitly treat the \((p,a)=(2,1)\), \(m=3,N=6\) valuation phenomenon as prior work already recorded by McTague and the pinned Pascal Minus One predecessor.

You may use the pinned Pascal Extremes global maximum theorem as predecessor mathematics once its exact hypotheses are checked, but do not silently reprove or relabel predecessor results. Computation may be used only as regression evidence, never as a proof step.

Preserve a complete rigorous proof note with theorem statements, lemmas, edge cases, dependencies, and any failed proof approaches that materially affect scope. If a target is false or needs qualification, correct it rather than forcing the conjecture. At the end of Stage 3, update STATUS.md, commit all Stage-3 work, create notes/session-03-handoff.md, and stop without beginning Stage 4.
