# Stage-2 independent computational reproduction

Date: **2026-10-01**.

Status: **finite experimental evidence only; not a proof**.

## Purpose and independence

This reproduction was written from scratch for Pascal Cofactors. It does not import code from either pinned predecessor repository and does not rely on the kickoff evidence ledger.

The principal coefficient valuation implementation uses Kummer's theorem in subtraction form: the number of borrows in base-\(p\) subtraction of \(k\) from \(N\). It is compared against the mathematically independent Legendre factorial formula

\[
v_p\binom Nk=v_p(N!)-v_p(k!)-v_p((N-k)!).
\]

For tractable rows an additional reference computes the actual integer

\[
G(N;m)=\gcd\{\binom Nk:0<k<N,\ m\mid k\}
\]

with `math.comb` and `math.gcd`, then takes its \(p\)-adic valuation.

Coefficient valuations and restricted-GCD valuations are stored in separate fields throughout.

## Code and raw outputs

- `experiments/stage2_reproduce.py`: standard-library-only exact-integer implementation.
- `experiments/stage2-grid.csv`: one summary row for every \((p,a,d)\) test case.
- `experiments/stage2-exact-gcd.csv`: every tractable exact-integer-GCD row.
- `experiments/stage2-run.txt`: deterministic console summary.

SHA-256:
- `stage2-grid.csv`: `0b56991f8b019cb0778279c6a5c5bdf7999b60ea4b28b43e366a263cb7b691c0`.
- `stage2-exact-gcd.csv`: `b68a0e5e51e9186b884091b81e906888bcdb00f544181b2cbb2e58e8075ce201`.

Runtime used for the preserved run: Python **3.13.5**.

## Exact grid

Odd degrees:
\[
d\in\{3,5,7,9,11,13,15\}.
\]

Prime/exponent pairs:
- \(p=2\), \(1\le a\le7\);
- \(p=3\), \(1\le a\le4\);
- \(p=5\), \(1\le a\le3\);
- \(p=7,11\), \(1\le a\le2\);
- \(p\in\{13,17,19,23,29,31\}\), \(a=1\).

This is **24** \((p,a)\) pairs and **168** \((p,a,d)\) cases.

For each case, with \(Q=p^a\) and \(m=C_d(Q)\), every multiplier
\[
q=2,3,\ldots,Q,Q+1
\]
was checked. This is **5,943** multiplier rows. The pre-extremal window is always \(2\le q\le Q\); the sparse-row endpoint \(q=Q+1\) is recorded separately.

An additional implementation sanity sweep compared Kummer and Legendre for every \(0\le k\le n<80\) at \(p\in\{2,3,5,7\}\): **12,956** binomial valuations, zero mismatches.

Exact integer GCDs were computed whenever \(N=mq\le10,000\): **225** multiplier rows from **33** parameter cases.

No cases were silently excluded from the stated grid. Exact-integer GCD checking alone is capped by \(N\le10,000\); valuation-based Kummer/Legendre checks are not.

## Reproduction results

### Threshold prerequisite

The Stage-1 displayed lower bound
\[
p^{a(d-1)}<C_d(p^a)
\]
is false throughout this grid: it held in **0/168** cases. This is directionally consistent with the alternating expansion, whose leading term is \(Q^{d-1}\).

The corrected candidate bounds
\[
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}
\]
held in **168/168** cases, and the computed threshold was
\[
r_p(C_d(p^a))=a(d-1)
\]
throughout. This correction remains to be proved in Stage 3.

### Target A, odd \(d\ge5\)

Across **144** cases:
- endpoint \(q=Q+1\) had restricted-GCD valuation \(a(d-1)\);
- every \(2\le q\le Q\) had restricted-GCD valuation strictly below \(a(d-1)\);
- therefore the complete finite analogue of Target A had **0 failures**.

This is experimental checking only.

### Target B, odd \(d\ge5\)

Across the same **144** cases:
\[
\max_{2\le q\le Q}v_p\binom{mq}{m}=\frac{a(d+1)}2
\]
with **0 failures**.

In every tested case the maximum was attained **uniquely at \(q=Q\)**. The uniqueness/argmax observation is stronger than the currently stated Target B and is only an experimental pattern at this stage.

### Restricted-GCD pre-extremal maximum

A separate, previously unstated pattern survived **all 168** cases, including \(d=3\):
\[
\max_{2\le q\le Q}v_p(G(mq;m))
=
\frac{a(d-1)}2+1.
\]

In every tested case the argmax set was exactly
\[
q\in\{p,p^2,\ldots,p^a\}.
\]

This is now a Stage-2 conjectural candidate, not a theorem. It is deliberately kept distinct from Target B's selected coefficient.

### Target C, \(d=3\)

Across all **24** \((p,a)\) pairs:
- for \(a=1\), the first tested extremal multiplier was \(q=Q=p\), giving row \(p(p^2-p+1)\);
- for \(a\ge2\), the first tested extremal multiplier was \(q=Q+1\), giving row \(p^{3a}+1\);
- **0 failures**.

The \((p,a)=(2,1)\) case is the row \(m=3,N=6\), whose valuation-2 phenomenon is already recorded in McTague and in the pinned Pascal Minus One predecessor; it must not be presented as new.

## Cross-check totals

- Kummer vs Legendre project rows: **5,943/5,943 matched** for both the selected coefficient and the restricted-GCD minimum.
- Exact integer GCD vs Kummer/Legendre: **225/225 matched**.
- Target A failures: **0**.
- Target B failures: **0**.
- Target C failures: **0**.
- corrected-threshold-bound failures: **0**.
- restricted-GCD candidate failures: **0**.

## Trust boundary

These computations support target selection, catch formulation errors, and provide regression data. They do **not** prove any infinite statement, establish novelty, or replace the Stage-3 proof. The Stage-1 bound error is retained in Git history and corrected explicitly in the Stage-2 target/status notes rather than retroactively erased from provenance.
