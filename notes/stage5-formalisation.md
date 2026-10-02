# Stage 5 Lean formalisation — checkpoint 2

Date: **2026-10-02**

Stage 5 is **in progress**, not complete. This checkpoint does not authorize Stage 6.

## Exact environment

- Lean: `leanprover/lean4:v4.35.0-rc2`.
- Direct formal dependency:
  `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.
- Transitive Mathlib:
  `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.
- Pascal Minus One inspected at
  `5c0363d43044be94430dff489bd5c64cd153b8d5`, but not imported.

No dependency pin was changed in this checkpoint.

## Clean-build status

The latest code-bearing checkpoint is
`b78321a8af50281f19379b631151c2c934922f17`.

GitHub Actions run `36987832194`, job `110776801604`, completed successfully:

- `lake update` succeeded;
- `lake exe cache get` succeeded;
- `lake build` succeeded;
- the proof-gap check found zero occurrences of `sorry` or `admit`.

The clean CI commands remain:

```bash
lake update
lake exe cache get
lake build
test "$(grep -R -E '\\b(sorry|admit)\\b' --include='*.lean' PascalCofactors PascalCofactors.lean | wc -l)" -eq 0
```

## Formalised theorem layers

### Basic and threshold

`PascalCofactors/Basic.lean` and `PascalCofactors/Threshold.lean` compile cleanly.

The private `exponent_lower_identity` blocker was closed by an explicit Nat subtraction calculation after the polynomial identity, without changing the mathematical statement. The corrected threshold package is therefore formalised:

- `C_lower_threshold`;
- `C_upper_threshold`;
- `prime_not_dvd_C`;
- `rP_C`;
- `C_threshold_d`.

The false Stage-1 lower inequality was not restored.

### Digit-sum layer

`PascalCofactors/Digits.lean` compiles cleanly. It formalises the Stage-3 block architecture:

- `digitSum`;
- block splitting at a power-of-`p` boundary;
- digitwise complement;
- the high-block identity;
- `digitSum_C_mul_lt`;
- `digitSum_C_mul`, including the endpoint `t=p^a`.

Thus the finite-window shift
\[
s_p(C_d(p^a)t)=s_p(t)+as(p-1),\qquad 1\le t\le p^a,
\]
is compiler-certified.

### Coefficient scaling and selected coefficient

`PascalCofactors/Scaling.lean` compiles cleanly.

The exact individual-coefficient theorem `coefficient_scaling` formalises
\[
v_p\binom{mq}{mj}=as+v_p\binom qj
\]
for `2 ≤ q ≤ p^a` and `1 ≤ j < q`.

The selected-coefficient layer is kept distinct and is also formalised:

- `selected_coefficient`;
- `selected_coefficient_le_max`;
- `selected_coefficient_eq_max_iff`;
- `selected_coefficient_maximum_unique`.

These give the maximum `as+a` and unique argmax `q=p^a`.

### Restricted-GCD layer

`PascalCofactors/GCD.lean` was added and compiles cleanly.

It formalises:

- `restricted_gcd_valuation`;
- `isPositivePPower_iff_bounded`;
- `restricted_gcd_valuation_bounded`;
- `restricted_gcd_le_max`;
- `restricted_gcd_eq_max_iff`;
- `restricted_gcd_maximum_at_p`;
- `restricted_gcd_maximum_and_argmax`.

Hence for `2 ≤ q ≤ p^a`,
\[
v_p(G(mq;m))=
as+
\begin{cases}
1,&q=p^b\text{ for some }1\le b\le a,\\
0,&\text{otherwise},
\end{cases}
\]
with maximum `as+1` and exact argmax set `{p,p^2,…,p^a}`.

## Formal dependency / proof-engineering notes

The GCD layer reuses Pascal Extremes' prior `G`, `Admissible`, and
`padicVal_G_eq_of_lower_bound_of_witness` infrastructure.

For the base-row dichotomy it imports pinned Mathlib's
`Mathlib.Data.Nat.Choose.Lucas` and uses
`Choose.eq_pow_multiplicity_of_choose_modEq_zero_nat` to show that if every
interior binomial coefficient is divisible by the fixed prime `p`, then the
row multiplier is a power of `p`. Positive powers use
`Nat.Prime.dvd_choose_pow` plus an explicit valuation-one witness.
This is existing Mathlib/classical infrastructure, not project novelty.

The helper proposition `IsPositivePPower p q` is a Lean representation choice
for the fixed-prime case split. The public bounded theorem reconnects it to the
exact Stage-3 condition `q=p^b` with `1≤b≤a`.

Pascal Minus One remains **not imported**. Its `scaling_valuation` is still
mathematically different from the additive coefficient-scaling theorem proved
here.

## Remaining Stage-5 package

The next theorem layer is the sparse endpoint at `q=p^a+1`:
\[
m(p^a+1)=p^{a(2s+1)}+1,\qquad
v_p(G(p^{a(2s+1)}+1;m))=2as=r_p(m).
\]

After that remain:

1. Target A for odd `d≥5`;
2. Target C for `d=3`, with the `a=1` and `a≥2` branches kept distinct.

No Stage-6 work has begun.

Formalisation remains verification only and does not change the Stage-4 novelty disposition.
