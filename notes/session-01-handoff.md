# Session 01 handoff — Stage 1 scaffold

Date: **2026-10-01**

## Completed in this session

- Confirmed `jfairfaxball-348/pascal-cofactors` was empty before scaffold.
- Inspected the current public theorem surfaces and research notes of:
  - `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
  - `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.
- Recorded exact predecessor theorem/infrastructure surfaces and current reuse status in `notes/provenance.md`.
- Defined project Targets A/B/C as conjectural in `notes/targets.md`.
- Separated kickoff computational claims from project-generated evidence in `notes/preliminary-evidence.md`.
- Created reserved areas for experiments, Lean source, registration, paper, and arXiv work.
- Established the eight-stage workflow and explicit prohibition on deriving novelty from experiments, search absence, Lean, or Palomar.
- Marked Stage 1 complete in `STATUS.md`.

No novelty audit, new proof, Lean development, Palomar work, paper writing, or arXiv work was performed.

## Important predecessor boundary for Stage 2

The strongest reusable predecessor theorem is Pascal Extremes `targetA`: for prime (p), (m\ge2), (p\nmid m), the global maximum is (r_p(m)), with constructive attainment before `T` is defined.

Pascal Extremes also proves
[
T_p(p^a+1)=p^{3a}+1\qquad(a\ge2),
]
which must be compared explicitly with the new cubic cofactor conjecture
[
T_p(p^{2a}-p^a+1)=p^{3a}+1.
]

Do not treat either predecessor theorem as new in Pascal Cofactors.

## Stage-2 deliverables

Stage 2 must do two things in parallel, without starting a proof.

### Literature

Create `notes/prior-art-audit-2.md` with:

- exact sources, versions, publication dates, theorem/page references, and hypotheses;
- direct comparison against the exact new Targets A/B/C;
- the translation (G(mq;m)=g(m,q));
- searches for least multiplier / least extremal row formulations;
- searches for ((x^d+1)/(x+1)), alternating quotients, odd cyclotomic factors, (p^{ad}+1), (Phi_6(p^a)), Kummer carry bounds, and reciprocal/complementary-factor formulations;
- explicit re-checks of McTague, Wu, Chung–Yang, Chung–Yang–Zhou, Chiu–Yuan–Zhou, Siao Hong, Guo–Qiu–Cao–Feng–Gao, Kummer and relevant 2026 work;
- a clear distinction among verified non-overlap, probable non-overlap, and unresolved comparison.

Absence of a hit is negative evidence only.

### Computation

Create a clean experimental framework and independently reproduce the kickoff claims.

At minimum compare:

1. Kummer carry/borrow valuation;
2. direct Legendre/binomial valuation or exact-GCD reference checks where tractable.

Test broad grids of (p,a,d), including:

- (p=2);
- (a=1);
- (d=3);
- odd (d\ge5), including larger values;
- multiplier endpoints;
- Target A attainment/minimality;
- Target B coefficient maximum;
- the corresponding restricted-GCD maximum;
- Target C;
- any stronger/weaker patterns suggested by failures.

Preserve code, outputs, ranges, exclusions, implementation assumptions, and provenance.

## Required gate

End Stage 2 with exactly one of:

**PROCEED**, **REVISE**, or **STOP**.

Do not start the informal proof in Stage 2.

## Ready-to-paste Stage-2 prompt

> Continue the Pascal Cofactors project at Stage 2 only in `jfairfaxball-348/pascal-cofactors`.
>
> First read `AGENTS.md`, `STATUS.md`, `notes/targets.md`, `notes/provenance.md`, `notes/preliminary-evidence.md`, and `notes/session-01-handoff.md`. Treat the repository as authoritative and preserve the predecessor pins recorded there.
>
> Perform the Stage-2 initial theorem-level prior-art audit and independent computational reproduction from scratch. Create `notes/prior-art-audit-2.md` with exact sources, versions/dates, theorem/page references, hypotheses, overlap/equivalence analysis, unresolved inaccessible sources, and all meaningful search formulations. Explicitly compare Targets A/B/C with Pascal Extremes, McTague, Wu, Chung–Yang, Chung–Yang–Zhou, Chiu–Yuan–Zhou, Siao Hong, Guo–Qiu–Cao–Feng–Gao, Kummer, and relevant recent 2026 literature. Do not infer novelty from a negative search.
>
> Build an independent experimental framework with at least a Kummer carry/borrow implementation and, on tractable ranges, an independent Legendre/binomial-valuation or exact-GCD reference implementation. Test Target A, Target B, the corresponding restricted-GCD maximum, and Target C across a broad grid including (p=2), (a=1), (d=3), several larger odd (d), and endpoint multipliers. Preserve code, raw/summary outputs, exact ranges, exclusions, and provenance. Keep coefficient valuations distinct from GCD valuations.
>
> Do not start an informal proof, Lean, Palomar, paper, or arXiv work. When Stage 2 is complete, update `STATUS.md`, commit all Stage-2 work, create `notes/session-02-handoff.md`, and finish with exactly one gate: PROCEED, REVISE, or STOP, plus a ready-to-paste prompt for a fresh Stage-3 session if appropriate.
