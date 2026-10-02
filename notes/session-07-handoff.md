# Session 07 handoff — Stage 5 complete

Date: **2026-10-02**

## Stage gate

Stage 5 is **COMPLETE**. The entire Stage-4-cleared theorem package S0–S7 is
formalised in Lean and clean-builds. No Stage-6 action has yet been performed.

The next permitted assistant phase is **Stage 6 — Palomar registration packaging and predictive preflight only**. The human maintainer will perform the actual Palomar submission/registration after the package is complete. Do not submit, register, or claim registration in Stage 6, and do not begin paper drafting or arXiv work.

## Repository and branch

Repository: `jfairfaxball-348/pascal-cofactors`

Stage-5 working branch: `stage5-lean`

Final code-bearing completion checkpoint:

`545318a6fcf10d9bde1d72345e1794fa05249728`

Successful code-completion CI:

- run `37012780672`;
- job `110856780401`.

It established:

- `lake update` succeeds;
- `lake exe cache get` succeeds;
- the full `lake build` succeeds;
- the zero-`sorry`/`admit` check succeeds.

## Pins to preserve

Predecessor pins:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.

Lean environment:

- Lean `v4.35.0-rc2`;
- direct Pascal Extremes dependency at
  `f3a4335d17e333128b9ec16f8b0b139396e5bd94`;
- Mathlib `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

Pascal Minus One remains outside the Lean dependency graph.

## Formalised S0–S7 package

- S0: corrected cofactor threshold, prime nondivisibility, and `rP_C`.
- S1: finite-window additive coefficient scaling.
- S2: selected-coefficient formula.
- S3: selected-coefficient maximum and unique argmax.
- S4: exact pre-extremal restricted-GCD formula, maximum, and exact argmax set.
- S5: sparse endpoint row identity, endpoint coefficient formula, and exact
  endpoint restricted-GCD valuation \(2as=r_p(m)\).
- S6: Target A for every odd \(d\ge5\).
- S7: Target C, with separate \(a=1\) and \(a\ge2\) proofs.

Relevant final files:

- `PascalCofactors/Endpoint.lean`;
- `PascalCofactors/TargetA.lean`;
- `PascalCofactors/TargetC.lean`.

## Provenance boundaries that remain binding

- Pascal Extremes' `rP`, `G`, global extremal theorem, extremal-row
  existence, and `T` framework are prior work.
- Pascal Minus One's `scaling_valuation` is not
  `PascalCofactors.coefficient_scaling`.
- Pascal Extremes'
  \(T_p(p^a+1)=p^{3a}+1\) for \(a\ge2\) is prior complementary-factor work.
- The \((p,a)=(2,1),m=3,N=6\) valuation phenomenon is prior work recorded by
  McTague and Pascal Minus One.
- Chung--Yang 2026 remains unresolved at theorem level.
- Lean formalisation is verification, not evidence of novelty or historical
  priority.

## Stage-6 scope

Stage 6 prepares the Palomar registration package and obtains a clean predictive
mechanical preflight. It does **not** perform the real Palomar submission or
registration. The session must stop with an immutable green candidate commit
for the human maintainer to register.

Before packaging, re-read the current official Palomar contract rather than
copying an older predecessor blindly. As checked on 2026-10-02, the current
official heads are:

- `PalomarRegistry/PalomarSubmission@65f0154ed776cd26c224254aa57b379137f28b0d`;
- `PalomarRegistry/PalomarPolicy@96b034cc31a72a63d4f4041911dce337a85c9a04`;
- `PalomarRegistry/PalomarTemplate@2891de4c48955af824969a263d31b25e7a9a1406`.

If those official heads have changed when Stage 6 begins, inspect the new
contract and document the exact revisions actually used.

The current Palomar policy requires every committed regular `.lean` source to
use Lean's module system and to contain at most 10,000 physical lines. The
Challenge is additionally limited to 1,000 lines and 100 KiB, with a warning
above 300 lines or 32 KiB. Pascal Cofactors' Stage-5 files therefore require a
mechanical module-system packaging migration before predictive preflight.
Preserve theorem statements and proofs; use `module`, `public import`, and
`@[expose] public section` where required to retain the existing transparency
and downstream interfaces.

Prepare the ordinary Palomar root package:

- `Challenge.lean`: small Mathlib-only statement surface;
- `Solution.lean`: exact matching declarations proved by bridging to the
  completed Pascal Cofactors theorem layer;
- `comparator.json`: exact selected theorem declarations and only the
  permitted axioms;
- `formalization.yaml`: current v0.4 metadata, sources, provenance,
  classification, automation, fidelity/alignment, review status and limitations;
- exactly one accepted root licence matching `project.license`;
- committed `lake-manifest.json` with all Git dependencies pinned to full
  lowercase 40-character GitHub SHAs;
- Lake targets sufficient to build the project, Challenge and Solution.

The Challenge must not import project-specific source transitively. Prefer only
`Mathlib`. Do not use `definition_names` merely to list concrete helper
definitions: under the current contract it is for definitions intentionally
left unspecified in the Challenge and supplied by the Solution. Concrete
definitions appearing in theorem types are protected through the compared
theorem dependency surface.

Run repository/package validation including:

- regenerate `lake-manifest.json` with `lake update` and require no diff;
- `lake exe cache get`;
- full `lake build`, including Challenge and Solution;
- zero proof-development `sorry`/`admit` and no replacement `axiom`
  declarations in the substantive proof sources;
- no Git submodules, symlinks, committed `.lake` content, Git LFS pointers,
  prebuilt Lean artifacts, or other Palomar packaging-hygiene violations;
- report the axioms of every advertised Solution theorem;
- run the toolchain-bundled Comparator locally where the runner supports the
  required sandbox/tools.

Add and run the specific reusable **Palomar Predictive Preflight** workflow,
pinned to the exact current PalomarSubmission commit. With the current contract
it must use the same full SHA in `uses` and `pipeline_commit`, a valid
12-character lowercase-alphanumeric `request_id`, `mode: full`,
`execution_profile: palomar-standard-v1`, and options naming
`comparator.json` plus
`"authorization_relationship":"I am a responsible author or maintainer"`.
The workflow is predictive only and has no registry state or credentials.

Inspect the predictive run and its machine-readable report. The packaging stage
is ready for the human maintainer only when the immutable candidate has:

- clean repository/package CI;
- a passing full predictive Palomar preflight;
- successful Comparator;
- accepted Lean, NanoDa and con-ron kernel checks;
- no unresolved mechanical errors;
- exact commit, workflow run, package hashes/report identifiers and any warnings
  recorded in a Stage-6 packaging note.

At that point stop and provide the human maintainer the exact repository,
40-character commit SHA and Comparator configuration path to enter into Palomar.
Do not perform the real submission, do not record a Palomar ID, and do not mark
registration complete. Stage 7 remains blocked until the human maintainer later
supplies the registration result.

Before Stage-6 work, re-read:

- `AGENTS.md`;
- `STATUS.md`;
- `notes/provenance.md`;
- `notes/stage3-proof.md`;
- `notes/prior-art-audit-4.md`;
- `notes/stage5-formalisation.md`;
- this handoff.

Treat the repository as authoritative.
