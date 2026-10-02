# Session 08 handoff — Stage 6 package ready, registration pending

Date: **2026-10-02**

## Gate

Stage-6 **packaging and predictive preflight are complete**. Real Palomar
registration has **not** been performed. The next action belongs to the human
maintainer, John Fairfax-Ball.

Do not begin Stage 7, paper drafting, or arXiv work until the human maintainer
confirms the actual Palomar registration result and the repository records the
Palomar ID/version/public entry.

## Exact registration candidate

Repository:

`jfairfaxball-348/pascal-cofactors`

Selected project path:

repository root

Exact immutable candidate:

`db0428e43802bf598582295ffd9358f78a5221e7`

Comparator configuration:

`comparator.json`

Selected modules:

- Challenge: `PascalCofactorsChallenge`;
- Solution: `PascalCofactorsSolution`.

Advertised declarations:

- `PascalCofactorsPalomar.coefficient_scaling`;
- `PascalCofactorsPalomar.restricted_gcd_valuation_bounded`;
- `PascalCofactorsPalomar.targetA_d`;
- `PascalCofactorsPalomar.targetC`.

## Verification evidence

Ordinary Lean CI:

- run `37021877727`;
- job `110886714877`;
- success.

Palomar package CI:

- run `37021879105`;
- job `110886718705`;
- success.

Full predictive Palomar preflight:

- run `37021879910`;
- verify job `110886765551`;
- artifact `mechanical-report-pascalcof006`;
- artifact id `11232863345`;
- artifact digest
  `sha256:6b3160612921f8d5c72e52f2b70c08bde4d26c54ac17bf44971ae11c3175c1ef`;
- report `status: pass`;
- report `stage: complete`;
- warnings: none;
- errors: none;
- trusted Challenge dependency: Mathlib only;
- untrusted Challenge sources: none;
- Comparator: success;
- con-ron: accepted;
- NanoDa: accepted;
- Lean default kernel: accepted.

The selected Challenge is 98 lines and 3,202 bytes, below the 300-line and
32-KiB warning thresholds.

## Contract and environment pins

Palomar contract:

- `PalomarSubmission@65f0154ed776cd26c224254aa57b379137f28b0d`;
- `PalomarPolicy@96b034cc31a72a63d4f4041911dce337a85c9a04`;
- `PalomarTemplate@2891de4c48955af824969a263d31b25e7a9a1406`.

Lean/dependencies:

- Lean `v4.35.0-rc2`;
- Pascal Extremes
  `f3a4335d17e333128b9ec16f8b0b139396e5bd94`;
- Mathlib `bd6c1abe5f55b6c3856172d6a23703e0888f5286`;
- Pascal Minus One inspected only at
  `5c0363d43044be94430dff489bd5c64cd153b8d5`.

## Human registration action

Use the real Palomar submission interface manually with:

- repository: `jfairfaxball-348/pascal-cofactors`;
- commit: `db0428e43802bf598582295ffd9358f78a5221e7`;
- project path: repository root;
- Comparator configuration path: `comparator.json`;
- relationship/authorization: responsible author or maintainer.

Review the predictive run/report above before consenting. There are no
mechanical warnings requiring special handling.

Do not substitute the current branch name for the 40-character commit.
Do not use a later documentation-only commit unless it has been deliberately
chosen and independently preflighted.

After the real registration completes, provide the resulting Palomar ID,
version, public-entry URL, and verification evidence. Only then should a new
repository commit record registration and close Stage 6.

## Provenance caution

Predictive Palomar verification establishes mechanical verification of the
selected Lean statement/proof package under the recorded contract. It does not
establish historical novelty, priority, uniqueness, or literature completeness.
All Stage-4 caveats, including the unresolved Chung--Yang 2026 theorem-level
comparison, remain in force.

Full packaging details and hashes are in
`notes/palomar-packaging-6.md`.
