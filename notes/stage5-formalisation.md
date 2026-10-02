# Stage 5 Lean formalisation — completion report

Date: **2026-10-02**

Stage 5 is **COMPLETE**. The entire Stage-4-cleared theorem package S0–S7 is formalised and clean-builds. This completion opens the Stage-6 gate; it does not itself perform Palomar registration.

## Exact environment

The environment was preserved exactly throughout Stage 5:

- Lean: \`leanprover/lean4:v4.35.0-rc2\`.
- Direct formal dependency:
  \`jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94\`.
- Transitive Mathlib:
  \`bd6c1abe5f55b6c3856172d6a23703e0888f5286\`.
- Pascal Minus One inspected at
  \`5c0363d43044be94430dff489bd5c64cd153b8d5\`, but never imported.

No predecessor or toolchain pin was changed.

## Clean-build completion checkpoint

The final code-bearing completion checkpoint is
\`545318a6fcf10d9bde1d72345e1794fa05249728\`.

GitHub Actions run \`37012780672\`, job \`110856780401\`, completed successfully:

- \`lake update\` succeeded;
- \`lake exe cache get\` succeeded;
- the full \`lake build\` succeeded;
- the proof-gap check found zero occurrences of \`sorry\` or \`admit\`.

The clean commands remain:

\`\`\`bash
lake update
lake exe cache get
lake build
test "$(grep -R -E '\\b(sorry|admit)\\b' --include='*.lean' PascalCofactors PascalCofactors.lean | wc -l)" -eq 0
\`\`\`

## Formalised theorem package

### S0 — corrected threshold

\`PascalCofactors/Threshold.lean\` formalises:

- \`C_lower_threshold\`;
- \`C_upper_threshold\`;
- \`prime_not_dvd_C\`;
- \`rP_C\`;
- \`C_threshold_d\`.

Thus, for \(d=2s+1\),
\[
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)},\qquad
p\nmid C_d(p^a),\qquad
r_p(C_d(p^a))=a(d-1)=2as.
\]

The false Stage-1 inequality \(p^{a(d-1)}<C_d(p^a)\) was not restored.

### S1 — finite-window coefficient scaling

\`PascalCofactors/Digits.lean\` proves the finite-window digit-sum shift, and
\`PascalCofactors/Scaling.lean\` proves \`coefficient_scaling\`:
\[
v_p\binom{mq}{mj}=as+v_p\binom qj
\]
for \(2\le q\le p^a\) and \(1\le j<q\).

### S2–S3 — selected coefficient and unique maximum

\`Scaling.lean\` also formalises:

- \`selected_coefficient\`;
- \`selected_coefficient_le_max\`;
- \`selected_coefficient_eq_max_iff\`;
- \`selected_coefficient_maximum_unique\`.

Hence
\[
v_p\binom{mq}{m}=as+v_p(q),
\]
with maximum \(as+a\) uniquely at \(q=p^a\).

### S4 — exact pre-extremal restricted-GCD formula

\`PascalCofactors/GCD.lean\` formalises:

- \`restricted_gcd_valuation\`;
- \`isPositivePPower_iff_bounded\`;
- \`restricted_gcd_valuation_bounded\`;
- \`restricted_gcd_le_max\`;
- \`restricted_gcd_eq_max_iff\`;
- \`restricted_gcd_maximum_at_p\`;
- \`restricted_gcd_maximum_and_argmax\`.

For \(2\le q\le p^a\),
\[
v_p(G(mq;m))
=
as+
\begin{cases}
1,&q=p^b\text{ for some }1\le b\le a,\\
0,&\text{otherwise},
\end{cases}
\]
with maximum \(as+1\) and exact argmax set \(\{p,p^2,\ldots,p^a\}\).

### S5 — sparse endpoint

\`PascalCofactors/Endpoint.lean\` formalises:

- \`endpoint_row_identity\`;
- \`endpoint_coefficient\`;
- \`endpoint_gcd_valuation\`;
- \`endpoint_gcd_valuation_eq_rP\`.

It proves
\[
C_d(p^a)(p^a+1)=p^{a(2s+1)}+1
\]
and
\[
v_p\!\left(G\!\left(p^{a(2s+1)}+1;C_d(p^a)\right)\right)
=2as
=r_p(C_d(p^a)).
\]

The coefficient theorem is kept distinct:
\[
v_p\binom{p^{a(2s+1)}+1}{C_d(p^a)j}
=
a(2s+1)-v_p(j)-v_p(p^a+1-j)
\]
for \(1\le j\le p^a\). The GCD proof derives the lower bound for every admissible selected coefficient and uses \(j=1\) as the equality witness.

### S6 — Target A

\`PascalCofactors/TargetA.lean\` formalises:

- \`targetA\`, in the primary \(d=2s+1\), \(s\ge2\) representation;
- \`targetA_d\`, with the odd degree named explicitly.

Thus, for every odd \(d\ge5\),
\[
T_p(C_d(p^a))=p^{ad}+1.
\]

The proof uses the sparse endpoint for attainment, the pre-extremal bound
\(as+1<2as\) for every earlier multiplier, and Pascal Extremes' prior
\`extremalRows\`/\`T\` least-row framework.

### S7 — Target C

\`PascalCofactors/TargetC.lean\` formalises:

- \`C_cubic\`;
- \`targetC_a_one_C\`;
- \`targetC_ge_two_C\`;
- \`targetC_a_one\`;
- \`targetC_ge_two\`;
- \`targetC\`.

It proves
\[
T_p(p^{2a}-p^a+1)=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
\]

The \(a=1\) and \(a\ge2\) proofs are deliberately distinct. The exponent-one
branch uses the exact pre-extremal equality classification to force the first
extremal multiplier to be \(p\). The \(a\ge2\) branch uses the sparse endpoint
and the strict pre-endpoint gap \(a+1<2a\).

## Formal dependencies and representation choices

The existing Pascal Extremes dependency supplies prior-work infrastructure:
\`rP\`, \`G\`, \`Admissible\`, \`AdmissibleRow\`,
\`padicVal_G_eq_of_lower_bound_of_witness\`, \`extremalRows\`, \`T\`,
\`T_mem_extremalRows\`, and \`T_isLeast\`.

The endpoint layer uses pinned Mathlib's existing:

- \`Nat.choose_mul_succ_eq\`;
- \`Nat.Prime.emultiplicity_choose_prime_pow_add_emultiplicity\`;
- \`padicValNat_eq_emultiplicity\`;
- \`padicValNat.mul\`.

The GCD layer continues to use pinned Mathlib's
\`Choose.eq_pow_multiplicity_of_choose_modEq_zero_nat\` and
\`Nat.Prime.dvd_choose_pow\`.

Lean's primary odd-degree representation remains \(d=2s+1\). Public wrapper
theorems reconnect that representation to the exact Stage-3 degree statements.
The cubic identity \`C_cubic\` reconnects \`C p a 1\` to
\(p^{2a}-p^a+1\).

Pascal Minus One remains outside the Lean dependency graph. Its
\`scaling_valuation\` is still a different common-\(p^c\) scaling theorem and
must not be conflated with \`PascalCofactors.coefficient_scaling\`.

## Provenance / novelty boundary

All Stage-4 literature dispositions remain unchanged:

- Pascal Extremes' global maximum, extremal-row existence, \`rP\`, \`G\`, and
  \`T\` framework are prior work.
- The complementary Pascal Extremes theorem
  \(T_p(p^a+1)=p^{3a}+1\) for \(a\ge2\) is prior work and does not replace
  Target C.
- The \((p,a)=(2,1)\), \(m=3,N=6\) valuation phenomenon is prior work recorded
  by McTague and the pinned Pascal Minus One predecessor.
- Chung--Yang 2026 remains unresolved at theorem level.
- Lean formalisation is verification, not evidence of novelty or historical
  priority.

## Stage gate

**Stage 5 is complete.** The next permitted phase is Stage 6, Palomar
registration. Paper drafting and arXiv work remain out of scope until their
later stage gates.
