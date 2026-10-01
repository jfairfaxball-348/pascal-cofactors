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
