# Session 06 handoff — Stage 5 Lean formalisation checkpoint 2

Date: **2026-10-02**

Stage 5 is **IN PROGRESS**. Do not begin Stage 6.

Work is on branch `stage5-lean`.

Preserve predecessor pins exactly:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.

Preserve the environment exactly:

- Lean `v4.35.0-rc2`;
- Pascal Extremes direct dependency at
  `f3a4335d17e333128b9ec16f8b0b139396e5bd94`;
- Mathlib `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

Pascal Minus One remains inspected but not imported. Its
`scaling_valuation` is not the Pascal Cofactors additive coefficient law.

## Clean checkpoint

Latest code-bearing checkpoint:

`b78321a8af50281f19379b631151c2c934922f17`

Clean GitHub Actions:

- run `36987832194`;
- job `110776801604`;
- `lake update`: success;
- `lake exe cache get`: success;
- `lake build`: success;
- zero-`sorry`/`admit` check: success.

The documentation checkpoint containing this handoff is based directly on that
green code state and introduces no Lean changes.

## Formalised and green

The following layers now compile:

1. `PascalCofactors/Basic.lean`;
2. `PascalCofactors/Threshold.lean`, including the corrected threshold,
   `p∤C`, and `rP_C = 2as`;
3. `PascalCofactors/Digits.lean`, including `digitSum_C_mul`;
4. `PascalCofactors/Scaling.lean`, including:
   - `coefficient_scaling`;
   - `selected_coefficient`;
   - selected-coefficient maximum `as+a`;
   - unique selected-coefficient argmax `q=p^a`;
5. `PascalCofactors/GCD.lean`, including:
   - exact row-by-row restricted-GCD valuation;
   - maximum `as+1`;
   - exact argmax condition `q=p^b`, `1≤b≤a`.

Thus all Stage-5 goals through the pre-extremal restricted-GCD maximum/argmax
package are formalised.

## New formal dependency/provenance detail

`GCD.lean` imports pinned Mathlib's `Mathlib.Data.Nat.Choose.Lucas` and uses
`Choose.eq_pow_multiplicity_of_choose_modEq_zero_nat` for the fixed-prime
base-row dichotomy. It also reuses Pascal Extremes'
`padicVal_G_eq_of_lower_bound_of_witness`.

These are existing formal ingredients. They do not alter the Stage-4 novelty
disposition.

## Immediate next theorem

Formalise the sparse endpoint, still exactly as proved in Stage 3.

For prime `p`, `a≥1`, `s≥1`, let
[
Q=p^a,qquad d=2s+1,qquad m=C_d(Q).
]

Prove
[
m(Q+1)=Q^d+1=p^{a(2s+1)}+1
]
and
[
v_p(G(Q^d+1;m))=2as=r_p(m).
]

Do not weaken this to a selected coefficient or finite computation.

A natural proof route is the Stage-3 endpoint coefficient identity. For
`1≤j≤Q`, with `P=p^{a(2s+1)}`, prove
[
v_p\binom{P+1}{mj}
=
a(2s+1)-v_p(j)-v_p(Q+1-j).
]
Useful pinned ingredients already inspected include:

- `Nat.choose_mul_succ_eq`;
- `Nat.Prime.emultiplicity_choose_prime_pow_add_emultiplicity`;
- `padicValNat_eq_emultiplicity`;
- `padicValNat.mul`;
- `prime_not_dvd_C`;
- Pascal Extremes' `padicVal_G_eq_of_lower_bound_of_witness`.

Then prove the lower bound `2as` for every selected coefficient and use
`j=1` as the equality witness.

## After the sparse endpoint

Proceed in logical dependency order:

1. Target A for every odd `d≥5`:
   [
   T_p(C_d(p^a))=p^{ad}+1.
   ]
   Use the formalised pre-extremal bound `as+1`, the endpoint value `2as`,
   and the prior Pascal Extremes global extremal/`T` framework.

2. Target C:
   [
   T_p(p^{2a}-p^a+1)=
   \begin{cases}
   p(p^2-p+1),&a=1,\\
   p^{3a}+1,&a≥2.
   \end{cases}
   ]
   Keep `a=1` separate: the `(p,a)=(2,1)`, `m=3,N=6` valuation
   phenomenon is prior work recorded by McTague and Pascal Minus One.

Do not begin Stage 6 until these remaining theorems also clean-build.

## Required clean build

```bash
lake update
lake exe cache get
lake build
test "$(grep -R -E '\\b(sorry|admit)\\b' --include='*.lean' PascalCofactors PascalCofactors.lean | wc -l)" -eq 0
```

Treat the repository as authoritative and record any new formal dependency,
adapted lemma, theorem-signature adjustment, or significant representation
choice in `notes/provenance.md` and/or `notes/stage5-formalisation.md`.
