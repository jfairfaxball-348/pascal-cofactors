# Stage 5 Lean formalisation — checkpoint 1

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

## Files created

- `lean-toolchain`
- `lakefile.toml`
- `lake-manifest.json`
- `.github/workflows/lean.yml`
- `PascalCofactors.lean`
- `PascalCofactors/Basic.lean`
- `PascalCofactors/Threshold.lean`
- `PascalCofactors/Digits.lean`

## Clean-build status

At commit `1d339067d0e9f5c717eb278c31e5326daf0ffe8c`,
GitHub Actions run `36976104875`, job `110740171485`:

- dependency resolution succeeded;
- Mathlib cache retrieval succeeded;
- `PascalCofactors/Basic.lean` compiled;
- `PascalCofactors/Threshold.lean` failed at one remaining Nat-arithmetic goal
  in the private `exponent_lower_identity`;
- `PascalCofactors/Digits.lean` was not reached;
- the proof-gap check was skipped because `lake build` failed first.

The clean CI commands are:

```bash
lake update
lake exe cache get
lake build
test "$(grep -R -E '\\b(sorry|admit)\\b' --include='*.lean' PascalCofactors PascalCofactors.lean | wc -l)" -eq 0
```

No `sorry` or `admit` was intentionally introduced.

## Formalisation architecture

`Basic.lean` proves the positive-block cofactor representation and exact quotient
identity. `Threshold.lean` follows the corrected Stage-3 threshold proof and does
not restore the false Stage-1 inequality. `Digits.lean` follows the Stage-3
finite-window digit-block mechanism and remains separate from later coefficient
and restricted-GCD statements.

The two other threshold issues found earlier in the session—power-exponent
normalization and the proof that (p\nmid C)—were repaired before this
checkpoint. The only remaining threshold compiler blocker is
`exponent_lower_identity`.

## Not yet formalised/certified

- finite-window digit-sum theorem: drafted, not compiler-certified;
- additive coefficient scaling;
- selected-coefficient formula, maximum, unique argmax;
- restricted-GCD formula, maximum, exact argmax set;
- sparse endpoint;
- Target A;
- Target C.

## Next order

1. Finish `exponent_lower_identity` without weakening the threshold theorem.
2. Get all of `Threshold.lean` green.
3. Compile and repair `Digits.lean` until the finite-window digit-sum theorem is green.
4. Only then add coefficient scaling, followed by GCD and extremal-row layers.

Formalisation is verification only and does not alter the Stage-4 novelty disposition.
