# Project status

Date: **2026-10-01**

## Stage gates

- **Stage 1 — scaffold and provenance: COMPLETE.**
  - The repository was empty before this scaffold.
  - Predecessor inspection is pinned to:
    - `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
    - `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.
  - Exact candidate targets and predecessor reuse status are recorded in `notes/targets.md` and `notes/provenance.md`.
  - Kickoff computational claims are recorded separately in `notes/preliminary-evidence.md`; they have not been independently reproduced here.

- **Stage 2 — initial prior-art audit and independent computational reproduction: NOT STARTED.**
- **Stage 3 — rigorous informal proof: NOT STARTED.**
- **Stage 4 — deeper final-statement prior-art / novelty audit: NOT STARTED.**
- **Stage 5 — Lean formalisation: NOT STARTED.**
- **Stage 6 — Palomar registration: NOT STARTED.**
- **Stage 7 — research paper: NOT STARTED.**
- **Stage 8 — arXiv preparation/submission: NOT STARTED.**

## Mathematical claim status

- **Project Target A (odd cofactor least-extremal-row theorem, odd (d\ge5)): CONJECTURED.**
- **Project Target B (sharp pre-extremal coefficient bound): CONJECTURED.**
- **Restricted-GCD analogue of Target B: OPEN QUESTION / CONJECTURAL INVESTIGATION.**
- **Project Target C (cubic boundary classification): CONJECTURED.**
- **Claim (r_p(C_d(p^a))=a(d-1)): NOT YET ESTABLISHED IN THIS PROJECT.** The required integer inequalities must be checked rather than assumed.
- **Novelty / historical priority of the new targets: UNRESOLVED.** Stage 1 makes no novelty claim.

## Reused prior mathematics

`Pascal-Extremes` already proves and formalises, for prime (p), (m\ge2), (p\nmid m),
[
\max_{N>m, m\mid N}v_p(G(N;m))=r_p(m),
]
including constructive attainment before defining its least extremal row `T`.

It also proves and formalises, for prime (p) and (a\ge2),
[
T_p(p^a+1)=p^{3a}+1.
]

These are predecessor results, not new claims of this repository. Stage 1 has not imported them formally and has not reproved them. Their exact theorem surfaces and prospective reuse are recorded in `notes/provenance.md`.

## Proof / experiment trust boundary

No new infinite theorem has been proved. No Stage-2 experiments exist yet. The kickoff evidence is provenance only and cannot be cited as a project verification result.

## Next action

Run **Stage 2 only**: a serious first-pass theorem-level prior-art audit plus independent computational reproduction from scratch. End with exactly one gate: **PROCEED**, **REVISE**, or **STOP**. Do not start a proof.
