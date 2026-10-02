# Stage-1 provenance and predecessor reuse

Inspection date: **2026-10-01**.

This document records what was actually inspected at kickoff and how predecessor results are classified. It is not a novelty audit.

## 1. New repository state

`jfairfaxball-348/pascal-cofactors` was an empty Git repository before the Stage-1 scaffold.

No pre-existing code, proof, experiment, Lean file, paper, or registration package was present.

## 2. Pascal Minus One

Repository:
`jfairfaxball-348/pascal-minus-one`

Stage-1 inspection pin:
`5c0363d43044be94430dff489bd5c64cd153b8d5`

Relevant public theorem / infrastructure surfaces inspected include:

- `PascalMinusOne/Basic.lean`: restricted-GCD definitions and lemmas such as `G`, `Admissible`, `G_ne_zero`, and the lower-bound-plus-witness valuation mechanism later adapted by Pascal Extremes;
- `PascalMinusOne/MinusOne.lean`: public theorem `minus_one_valuation`;
- `PascalMinusOne/PlusOne.lean`: public theorem `plus_one_valuation`;
- `PascalMinusOne/Scaling.lean`: public theorem `scaling_valuation`;
- `notes/proof-outline.md`: proof architecture and the explicit separation between formal proof and regression evidence;
- `notes/literature.md` and `notes/novelty-audit-2026-09.md`: predecessor literature boundaries and caution about negative-search novelty language.

### Reuse status in this project

At Stage 1:

- **formally imported:** nothing;
- **reproved:** nothing;
- **mathematical prior work:** all cited theorem surfaces above;
- **prospective Lean reuse:** basic restricted-GCD/Kummer/scaling infrastructure may be adapted or depended on later if Stage 4 clears the new statements.

Any later reuse must preserve attribution and exact hypotheses. The project must not describe the fixed-multiple GCD family, Kummer carry machinery, plus-one theorem, minus-one theorem, or scaling lemma as new.

## 3. Pascal Extremes

Repository:
`jfairfaxball-348/Pascal-Extremes`

Stage-1 inspection pin:
`f3a4335d17e333128b9ec16f8b0b139396e5bd94`

Relevant public surfaces inspected:

### Core definitions / threshold

`PascalExtremes/Powers.lean`

- `rP p m := Nat.log p m + 1`;
- `rP_isLeast`, showing this realizes the integer minimum (\min\{r\ge1:m<p^r\}) under the stated hypotheses.

`PascalExtremes/Basic.lean`

- `G`, `AdmissibleRow`, `Admissible`;
- `padicVal_G_le_choose`;
- `padicVal_G_eq_of_lower_bound_of_witness`.

That file explicitly records that its basic infrastructure was adapted, with provenance, from `pascal-minus-one`.

### Global extremal theorem and least row

`PascalExtremes/TargetA.lean` and `PascalExtremes/TargetAAttainment.lean`

- `targetA_upper_witness`;
- `targetA_upper`;
- `targetA_attainment`;
- `targetA`, an `IsGreatest` formulation of
  [
  \max_{N>m, m\mid N}v_p(G(N;m))=r_p(m)
  ]
  for prime (p), (m\ge2), (p\nmid m);
- `extremalRows`;
- noncomputable `T`;
- `extremalRows_nonempty`;
- `T_mem_extremalRows`;
- `T_isLeast`.

Importantly, `targetA_attainment` establishes nonemptiness before the least row is used.

### Complementary predecessor family

`PascalExtremes/TargetB.lean` and `PascalExtremes/TargetBMinimality.lean`

- `q0 p a = p^(2*a) - p^a + 1`;
- `mul_q0_eq_pow_three_add_one`;
- `targetB_attainment`;
- `targetB_lower_nonattainment`;
- `targetB`, proving for prime (p), (a\ge2),
  [
  T_p(p^a+1)=p^{3a}+1.
  ]

### Reuse status in this project

At Stage 1:

- **formally imported:** nothing;
- **reproved:** nothing;
- **intended mathematical dependency:** the global maximum / existence theorem for (r_p(m)) is intended to be used as predecessor mathematics once its hypotheses are checked for (m=C_d(p^a));
- **prior theorem requiring explicit comparison:** (T_p(p^a+1)=p^{3a}+1) is the reciprocal/complementary-factor predecessor of the cubic Target C;
- **prospective Lean reuse:** undecided until Stage 5. The new repository must remain independently buildable; any dependency, copied/adapted lemma, or reproof must be documented explicitly.

The predecessor maximum theorem does **not** itself determine the least row for (C_d(p^a)), does not give strict lower-multiplier non-attainment for the cofactor family, and does not establish the proposed sharp pre-extremal coefficient bound.

## 4. Predecessor research notes carried forward as cautions

The inspected Pascal Extremes notes record that:

- the selected GCD family itself is prior art, matching Wu's notation (g(m,n));
- McTague covers a (p\equiv1\pmod m) subcase of the global maximum theorem;
- a 2026 Chung–Yang source was a recent adjacent caveat whose full theorem text was not openly inspectable during the predecessor audit.

These are **carried-forward provenance facts**, not a substitute for Stage 2. Stage 2 must independently refresh the literature search through its own cutoff date and compare the new cofactor targets, including exact equivalent formulations.

## 5. Repository-status caution

At inspection time the Pascal Extremes root `README.md` and `STATUS.md` reflected different operational-stage summaries. The theorem files themselves and the cited theorem statements above are the basis for this reuse record; no operational status from the predecessor is inherited into this project.

## 6. Novelty language

Nothing in this provenance file establishes that Targets A, B, or C are new. Same-author predecessor work counts as prior work. Formalisation status and Palomar status in predecessor repositories are verification/provenance facts, not novelty evidence.


## 7. Stage-5 formalisation dependency decision

Inspection/formalisation date: **2026-10-02**.

The exact predecessor pins were re-inspected before choosing a Lean dependency strategy:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.

Both pinned predecessor projects use Lean `v4.35.0-rc2` and Mathlib
`bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

This repository now directly depends on the exact pinned Pascal Extremes commit.
That supplies the prior-work `rP`, `G`, valuation/GCD helpers, global maximum,
extremal-row existence, and `T` framework needed later. The dependency is pinned
in `lakefile.toml` and `lake-manifest.json`.

The exact pinned `PascalMinusOne/Scaling.lean` signature was also inspected.
Its `scaling_valuation` removes a common `p^c` from row and modulus and is not
the Stage-3 additive law
[
v_p\binom{mq}{mj}=as+v_p\binom qj.
]
Pascal Minus One is therefore not a Lean dependency at this checkpoint, and no
lemma has been copied from it.

New Stage-5 source surfaces include:

- `PascalCofactors/Basic.lean`: `cofactor`, `cofactor_succ`,
  `add_one_mul_cofactor`, `cofactor_eq_div`, `C`, `C_eq_div`,
  `add_one_mul_C`;
- `PascalCofactors/Threshold.lean`: `cofactor_pos`,
  `cofactor_lower_block`, `cofactor_upper`, `C_lower_threshold`,
  `C_upper_threshold`, `prime_not_dvd_C`, `rP_C`, `C_threshold_d`;
- `PascalCofactors/Digits.lean`: drafted `digitSum`, block-splitting,
  complement, and finite-window cofactor digit-sum lemmas.

Lean uses `s` as the primary odd-degree parameter, with (d=2s+1), and defines
the cofactor first in the positive-block form
[
1+(Q-1)\sum_{i<s}Q^{2i+1}.
]
The theorem `cofactor_eq_div` reconnects this definition to
[
(Q^{2s+1}+1)/(Q+1).
]
This is a proof-engineering representation choice, not a weakening.

The latest clean build at commit
`1d339067d0e9f5c717eb278c31e5326daf0ffe8c` compiles
`PascalCofactors/Basic.lean` and leaves one remaining proof obligation in the
private `exponent_lower_identity` inside `Threshold.lean`. The build therefore
does not yet certify the threshold file or reach `Digits.lean`.

All Stage-4 prior-work boundaries remain unchanged: Pascal Extremes' global
maximum/`T_p` framework is prior work; the cubic ((2,1)) instance is prior
work; the complementary Pascal Extremes theorem remains prior work;
Chung--Yang 2026 remains unresolved; and formalisation is not novelty evidence.

## 8. Stage-5 formalisation checkpoint 2

Formalisation date: **2026-10-02**.

The environment and predecessor pins remain exactly unchanged:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`;
- Lean `v4.35.0-rc2`;
- Mathlib `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

The corrected threshold layer, digit-sum layer, additive coefficient scaling,
selected-coefficient maximum, exact pre-extremal restricted-GCD formula,
restricted-GCD maximum, and exact argmax characterization now compile.

New source surfaces since checkpoint 1 are:

- `PascalCofactors/Scaling.lean`, containing the new project theorem
  `coefficient_scaling` and the selected-coefficient consequences;
- `PascalCofactors/GCD.lean`, containing the exact pre-extremal
  restricted-GCD formula and maximum/argmax consequences.

The restricted-GCD layer formally reuses the **prior** Pascal Extremes theorem
`padicVal_G_eq_of_lower_bound_of_witness` together with its `G` and
`Admissible` framework. This is predecessor infrastructure, not new work of
Pascal Cofactors.

A new pinned-Mathlib formal dependency is used at theorem level:
`Mathlib.Data.Nat.Choose.Lucas`, specifically
`Choose.eq_pow_multiplicity_of_choose_modEq_zero_nat`. It supplies the
fixed-prime characterization needed for the base-row dichotomy: if every
interior binomial coefficient is divisible by `p`, the row is a power of
`p`. The positive-power side uses Mathlib's `Nat.Prime.dvd_choose_pow`.
These are existing formal/classical ingredients and are not novelty evidence.

The helper `IsPositivePPower p q` is a proof-engineering representation.
`isPositivePPower_iff_bounded` reconnects it to the exact mathematical
condition `q=p^b` with `1≤b≤a` in the finite window.

No lemma was copied from Pascal Minus One and Pascal Minus One remains outside
the Lean dependency graph. Its `scaling_valuation` must not be conflated with
`PascalCofactors.coefficient_scaling`.

Clean code-bearing checkpoint:
`b78321a8af50281f19379b631151c2c934922f17`.
GitHub Actions run `36987832194`, job `110776801604`, passed dependency
resolution, cache retrieval, the full Lean build, and the zero-`sorry`/`admit`
check.

All Stage-4 prior-work and unresolved-literature boundaries remain unchanged.
In particular, Chung--Yang 2026 remains unresolved at theorem level, and Lean
formalisation is verification rather than evidence of novelty or priority.

## 9. Stage-5 formalisation completion

Completion date: **2026-10-02**.

The exact environment remained unchanged through completion:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5` remained inspected only;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94` remained the sole direct predecessor Lean dependency;
- Lean remained `v4.35.0-rc2`;
- Mathlib remained `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

The new final Stage-5 source surfaces are:

- `PascalCofactors/Endpoint.lean`;
- `PascalCofactors/TargetA.lean`;
- `PascalCofactors/TargetC.lean`.

### Endpoint dependencies

`Endpoint.lean` uses pinned Mathlib's
`Nat.choose_mul_succ_eq`,
`Nat.Prime.emultiplicity_choose_prime_pow_add_emultiplicity`,
`padicValNat_eq_emultiplicity`, and `padicValNat.mul` to formalise the
prime-power-plus-one coefficient identity. It then uses the **prior** Pascal
Extremes theorem `padicVal_G_eq_of_lower_bound_of_witness` to pass from the
coefficient lower bound plus the \(j=1\) witness to the restricted-GCD
valuation. These are existing formal ingredients, not novelty evidence.

The individual theorem `endpoint_coefficient` is kept separate from
`endpoint_gcd_valuation` and `endpoint_gcd_valuation_eq_rP`. This preserves
the Stage-3 proof architecture rather than replacing the GCD theorem by a
single selected coefficient.

### Target-A dependencies and representation

`TargetA.lean` imports the pinned Pascal Extremes
`TargetAAttainment` surface specifically for the existing
`extremalRows`, `T`, `T_mem_extremalRows`, and `T_isLeast` framework.
It does not reprove the predecessor global extremal theory.

The project theorem `targetA` uses the primary Lean representation
\(d=2s+1\), \(s\ge2\). The wrapper `targetA_d` states the same result with the
odd degree explicitly named, reconnecting to the Stage-3/Stage-4 statement for
every odd \(d\ge5\).

### Target-C split and cubic identity

`TargetC.lean` proves `C_cubic` to reconnect the positive-block cofactor
representation at \(s=1\) with \(p^{2a}-p^a+1\).

The two Target-C branches are formally distinct:

- `targetC_a_one_C` / `targetC_a_one` use the exact pre-extremal
  restricted-GCD equality classification to force multiplier \(p\);
- `targetC_ge_two_C` / `targetC_ge_two` use the sparse endpoint together
  with the strict pre-endpoint gap \(a+1<2a\).

The public `targetC` combines those branches into the exact Stage-4-cleared
piecewise theorem.

The isolated \((p,a)=(2,1),m=3,N=6\) phenomenon remains explicitly classified
as prior work from McTague and the pinned Pascal Minus One predecessor; its
formal inclusion in the family theorem is not a novelty claim.

### Final clean code checkpoint

Code-bearing Stage-5 completion checkpoint:
`545318a6fcf10d9bde1d72345e1794fa05249728`.

GitHub Actions run `37012780672`, job `110856780401`, passed dependency
resolution, Mathlib cache retrieval, the full Lean build, and the
zero-`sorry`/`admit` check.

No lemma was copied from Pascal Minus One, and Pascal Minus One never entered
the Lean dependency graph.

All prior-work boundaries remain unchanged. In particular, formalisation does
not establish novelty or historical priority, and Chung--Yang 2026 remains an
unresolved theorem-level literature comparison.

