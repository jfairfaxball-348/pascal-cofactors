# Stage 6 — Palomar registration packaging and predictive preflight

Date: **2026-10-02**

## Gate

**PACKAGING/PREDICTIVE PREFLIGHT COMPLETE — HUMAN REGISTRATION PENDING.**

The immutable package candidate that passed the full predictive Palomar verifier
is:

`db0428e43802bf598582295ffd9358f78a5221e7`

This is **not** a Palomar registration. The predictive workflow has no registry
state or registration credentials. No Palomar ID or version has been created or
recorded. Stage 7 remains closed until the human maintainer completes the real
registration and supplies the result.

## Current Palomar contract revisions consulted

Stage 6 re-read the current official repositories before editing. Their heads
matched the revisions previously observed on 2 October 2026:

- `PalomarRegistry/PalomarSubmission@65f0154ed776cd26c224254aa57b379137f28b0d`;
- `PalomarRegistry/PalomarPolicy@96b034cc31a72a63d4f4041911dce337a85c9a04`;
- `PalomarRegistry/PalomarTemplate@2891de4c48955af824969a263d31b25e7a9a1406`.

The Pascal Extremes Stage-6 package and the pinned Pascal Minus One package were
used as same-author packaging precedents only. Mathematical content and
provenance were not copied or conflated.

## Exact Lean environment

- Lean: `leanprover/lean4:v4.35.0-rc2`.
- Lean release commit recorded by Palomar:
  `11acb17ec6b07a8f9e9173e6845197929540936b`.
- Direct Pascal Extremes dependency:
  `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.
- Mathlib:
  `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.
- Pascal Minus One remains inspected-only prior work at
  `5c0363d43044be94430dff489bd5c64cd153b8d5`; it is not a Lean dependency.

The committed `lake-manifest.json` was regenerated under this environment.
Package CI reran `lake update` and required an empty manifest diff. No
dependency revision moved.

## Module-system migration

Stage-5 Pascal Cofactors sources used the pre-module import style. Stage 6
mechanically ported every committed Lean source to the current module contract:

- a `module` header on every regular Lean source;
- `public import` for the public module interfaces;
- `@[expose] public section` in substantive project modules where downstream
  proofs rely on the pre-module definitional transparency.

The migration affected packaging/visibility only. No mathematical theorem
statement or proof content was weakened or altered.

The final Palomar source-requirements report checked **13** Lean files, required
module headers, used `lean --deps-json` as the header parser, and enforced the
10,000-line maximum.

## Challenge and Solution surface

The selected Challenge is a Mathlib-only statement surface:

- module: `PascalCofactorsChallenge`;
- path: `PascalCofactorsChallenge.lean`;
- direct imports: `Mathlib`;
- 98 lines;
- 3,202 bytes;
- transitive trusted source count: 2;
- trust level: `high`;
- untrusted sources: none.

The root `Challenge.lean` and `Solution.lean` copies are retained as the
ordinary human-auditable package files requested for this repository. Comparator
selects uniquely named modules because the pinned Pascal Extremes dependency
also contains modules named `Challenge` and `Solution`. An earlier
predictive run demonstrated that a generic `Challenge` module name could be
resolved from that dependency. The final unique module names remove this
ambiguity without changing the statement surface.

The advertised declarations are:

1. `PascalCofactorsPalomar.coefficient_scaling`;
2. `PascalCofactorsPalomar.restricted_gcd_valuation_bounded`;
3. `PascalCofactorsPalomar.targetA_d`;
4. `PascalCofactorsPalomar.targetC`.

They correspond exactly to the compiled project declarations
`PascalCofactors.coefficient_scaling`,
`PascalCofactors.restricted_gcd_valuation_bounded`,
`PascalCofactors.targetA_d`, and `PascalCofactors.targetC`.
The Solution bridges transparently to the completed theorem layer rather than
re-proving the mathematics.

## Comparator configuration

`comparator.json` records:

- challenge module: `PascalCofactorsChallenge`;
- solution module: `PascalCofactorsSolution`;
- the four theorem names above;
- `definition_names: []`;
- permitted axioms only:
  `propext`, `Quot.sound`, `Classical.choice`;
- no submitted `external_kernels`.

The final package-CI axiom audit reports all four advertised Solution
declarations depend only on those three permitted standard axioms.

## formalization.yaml metadata and provenance

The package uses `version: v0.4`, project name `Pascal Cofactors`, and
Apache-2.0. The project description states the formalised cofactor valuation,
pre-extremal GCD, least-row, and cubic results factually.

The source list uses Palomar's `original-proof` category only to record that
this repository is the originating mathematical source for the selected
family-level theorem package. The metadata explicitly says this is **not**
evidence of historical priority or novelty.

The following provenance boundaries are preserved:

- the fixed-multiple restricted-GCD family is prior art;
- Kummer/Legendre/carry and digit-sum machinery are classical;
- Pascal Extremes' global maximum theorem, extremal-row existence, and
  `rP`, `G`, and `T` framework are prior work and an actual Lean
  dependency;
- Pascal Minus One's `scaling_valuation` is prior common-`p^c` scaling and
  is not `PascalCofactors.coefficient_scaling`;
- Pascal Extremes'
  `T_p(p^a+1)=p^(3a)+1` for `a>=2` is prior complementary-factor work;
- the `(p,a)=(2,1),m=3,N=6` valuation phenomenon is prior work recorded by
  McTague and Pascal Minus One;
- Chung--Yang 2026 remains an unresolved theorem-level comparison;
- the Stage-4 literature audit supports only its documented negative-search
  wording.

## Repository/package CI

Final ordinary Lean CI on the immutable candidate:

- run: `37021877727`;
- job: `110886714877`;
- conclusion: **success**.

Final package CI on the immutable candidate:

- run: `37021879105`;
- job: `110886718705`;
- conclusion: **success**.

Package CI established:

- `lake update` succeeds and leaves `lake-manifest.json` unchanged;
- all Git dependency pins are public GitHub URLs at full lowercase 40-character
  revisions;
- `lake exe cache get` succeeds;
- the project, root Challenge/Solution, and uniquely selected
  `PascalCofactorsChallenge`/`PascalCofactorsSolution` modules build;
- substantive Pascal Cofactors sources contain no `sorry` or `admit` and no
  replacement `axiom` declarations;
- no Git submodules, tracked symlinks, tracked `.lake` files, Git LFS pointer
  files, or compiled Lean/native artifacts are present;
- the selected Challenge is below both Palomar warning thresholds;
- the toolchain-bundled Comparator succeeds under bubblewrap;
- con-ron, NanoDa, and Lean's default kernel accept the local Comparator
  solution;
- every advertised theorem's axioms are reported.

Local Comparator tail:

- `con-ron kernel accepts the solution`;
- `nanoda kernel accepts the solution`;
- `Lean default kernel accepts the solution`;
- `Your solution is okay!`.

## Mandatory full predictive Palomar preflight

Workflow:

`.github/workflows/palomar-preflight.yml`

Configuration:

- reusable workflow and `pipeline_commit` both pinned to
  `65f0154ed776cd26c224254aa57b379137f28b0d`;
- `request_id: pascalcof006`;
- `mode: full`;
- `execution_profile: palomar-standard-v1`;
- Comparator path `comparator.json`;
- authorization relationship: responsible author or maintainer.

Final predictive run:

- run: `37021879910`;
- profile job: `110886720511`;
- verify job: `110886765551`;
- source commit: `db0428e43802bf598582295ffd9358f78a5221e7`;
- machine report: `status: pass`, `stage: complete`,
  `phase: verification`;
- warnings: none;
- errors: none;
- artifact: `mechanical-report-pascalcof006`;
- artifact id: `11232863345`;
- artifact digest:
  `sha256:6b3160612921f8d5c72e52f2b70c08bde4d26c54ac17bf44971ae11c3175c1ef`.

The report confirms:

- protected Challenge path is `PascalCofactorsChallenge.lean`, not a
  dependency copy;
- Mathlib is the only trusted Challenge dependency;
- no untrusted Challenge sources;
- Comparator success;
- con-ron accepted 12,538 declarations;
- NanoDa accepted the solution;
- Lean default kernel accepted the solution;
- Comparator conclusion: `Your solution is okay!`;
- no unresolved mechanical errors or material packaging warnings.

## Reported immutable hashes

From the passing Palomar report:

- selected Challenge SHA-256:
  `dfc471c6aa54abe6be629272a3a2a8d7c98365f0f1c576ce9b3b6b912ee543de`;
- canonical Challenge OLean SHA-256:
  `dfa068e77e3167b29f9ca10ad728c8e695295839115da0e0d32f138c2313b312`;
- selected Solution SHA-256:
  `212c96b931b4b0dfd32c0229666f01083bbbe5fb882d1d8e1f655bc683cf7396`;
- Comparator SHA-256:
  `62950ac941fd0d36bae6528adff375ea41fb6a92d753df1308200ada65a494c1`;
- protected Comparator config SHA-256:
  `b91cfcad0a62f987ea0ed56e75cb92ee565b77b65b3287c4d9bcfecf25192726`;
- `formalization.yaml` SHA-256:
  `46f2b3e9fedd5d8332d39046353d8ee786e5310d514e9393f09b08d8406bd1e9`;
- `lake-manifest.json` SHA-256:
  `d60472286f79a12939f71077096f62c708565d13a04b0b0329a4c688cd2774b8`;
- `lakefile.toml` SHA-256:
  `8a53f323e7c9b987b4712af8af9aa04ce9affff58871c2bbefd8368f1f1150e6`;
- root Apache-2.0 licence SHA-256:
  `c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4`.

The Palomar report also records tool digests and the Lean release commit; these
are verification provenance and do not change the mathematical source pins.

## Earlier packaging diagnostics

Earlier Stage-6 iterations found and repaired repository-owned packaging
problems before the immutable candidate was chosen:

1. the Stage-5 manifest used a stale Lake serialization for the hyphenated
   package name; `lake update` regenerated it canonically without moving any
   dependency revision;
2. initial package-CI ordering allowed `lean-action` to read that stale
   manifest before regeneration; CI was changed to resolve/verify the manifest
   first;
3. module migration exposed Challenge/Solution decidability and transparent
   bridge details, repaired without changing theorem statements;
4. most importantly, the generic `Challenge` module name collided with the
   Pascal Extremes dependency. Predictive report diagnostics identified that
   Palomar had selected the predecessor's Challenge source. The final unique
   module names fix that source-resolution ambiguity.

The final candidate has none of those diagnostics: its full predictive report
has no warnings and no errors.

## Manual registration handoff

For the human maintainer:

- repository: `jfairfaxball-348/pascal-cofactors`;
- selected project path: repository root;
- exact candidate commit:
  `db0428e43802bf598582295ffd9358f78a5221e7`;
- Comparator path: `comparator.json`;
- predictive run: `37021879910`;
- predictive report artifact: `mechanical-report-pascalcof006`,
  artifact id `11232863345`;
- predictive report status: pass/complete;
- warnings requiring consent attention: **none mechanically reported**.

The human maintainer should use the exact candidate above, not a later
documentation-only branch head unless that later commit is separately
preflighted and deliberately selected.

Do not ask an assistant to invoke the real Palomar submission flow. Do not
record a Palomar ID until the maintainer supplies the actual registration
result.

## Stage-6 conclusion

The package and predictive-preflight work requested from the assistant is
complete. The **registration gate itself remains open** pending the human
maintainer's real Palomar action. Stage 7 must not begin before that result is
confirmed and recorded.
