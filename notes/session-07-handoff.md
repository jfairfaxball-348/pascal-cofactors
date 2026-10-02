# Session 07 handoff — Stage 5 complete

Date: **2026-10-02**

## Stage gate

Stage 5 is **COMPLETE**. The entire Stage-4-cleared theorem package S0–S7 is
formalised in Lean and clean-builds. No Stage-6 action has yet been performed.

The next permitted phase is **Stage 6 — Palomar registration only**. Do not
begin paper drafting or arXiv work in Stage 6.

## Repository and branch

Repository: \`jfairfaxball-348/pascal-cofactors\`

Stage-5 working branch: \`stage5-lean\`

Final code-bearing completion checkpoint:

\`545318a6fcf10d9bde1d72345e1794fa05249728\`

Successful code-completion CI:

- run \`37012780672\`;
- job \`110856780401\`.

It established:

- \`lake update\` succeeds;
- \`lake exe cache get\` succeeds;
- the full \`lake build\` succeeds;
- the zero-\`sorry\`/\`admit\` check succeeds.

## Pins to preserve

Predecessor pins:

- \`jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5\`;
- \`jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94\`.

Lean environment:

- Lean \`v4.35.0-rc2\`;
- direct Pascal Extremes dependency at
  \`f3a4335d17e333128b9ec16f8b0b139396e5bd94\`;
- Mathlib \`bd6c1abe5f55b6c3856172d6a23703e0888f5286\`.

Pascal Minus One remains outside the Lean dependency graph.

## Formalised S0–S7 package

- S0: corrected cofactor threshold, prime nondivisibility, and \`rP_C\`.
- S1: finite-window additive coefficient scaling.
- S2: selected-coefficient formula.
- S3: selected-coefficient maximum and unique argmax.
- S4: exact pre-extremal restricted-GCD formula, maximum, and exact argmax set.
- S5: sparse endpoint row identity, endpoint coefficient formula, and exact
  endpoint restricted-GCD valuation \(2as=r_p(m)\).
- S6: Target A for every odd \(d\ge5\).
- S7: Target C, with separate \(a=1\) and \(a\ge2\) proofs.

Relevant final files:

- \`PascalCofactors/Endpoint.lean\`;
- \`PascalCofactors/TargetA.lean\`;
- \`PascalCofactors/TargetC.lean\`.

## Provenance boundaries that remain binding

- Pascal Extremes' \`rP\`, \`G\`, global extremal theorem, extremal-row
  existence, and \`T\` framework are prior work.
- Pascal Minus One's \`scaling_valuation\` is not
  \`PascalCofactors.coefficient_scaling\`.
- Pascal Extremes'
  \(T_p(p^a+1)=p^{3a}+1\) for \(a\ge2\) is prior complementary-factor work.
- The \((p,a)=(2,1),m=3,N=6\) valuation phenomenon is prior work recorded by
  McTague and Pascal Minus One.
- Chung--Yang 2026 remains unresolved at theorem level.
- Lean formalisation is verification, not evidence of novelty or historical
  priority.

## Stage-6 scope

Stage 6 should perform Palomar registration for the completed theorem package,
record the exact registration metadata in the repository, and preserve the
Stage-4 novelty wording. It must not begin the research paper or arXiv work.

Before any registration action, re-read:

- \`AGENTS.md\`;
- \`STATUS.md\`;
- \`notes/provenance.md\`;
- \`notes/stage3-proof.md\`;
- \`notes/prior-art-audit-4.md\`;
- \`notes/stage5-formalisation.md\`;
- this handoff.

Treat the repository as authoritative.
