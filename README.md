# Pascal Cofactors

**Working title:** *Pascal Cofactors: least extremal rows for alternating cofactors of prime powers*

This repository is an original-mathematics research project on restricted binomial GCDs. It is intended as the mathematical successor to:

- `jfairfaxball-348/pascal-minus-one`;
- `jfairfaxball-348/Pascal-Extremes`.

For integers (m\ge 2) and (N>m) with (m\mid N), write
[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
]
For a prime (p\nmid m), let
[
r_p(m)=\min\{r\ge1:m<p^r\}.
]
Only after existence of an extremal row has been established, write
[
T_p(m)=\min\{N>m:m\mid N, v_p(G(N;m))=r_p(m)\}.
]

The new family starts from (Q=p^a) and odd (d\ge3):
[
C_d(Q)=\frac{Q^d+1}{Q+1}
      =Q^{d-1}-Q^{d-2}+\cdots-Q+1.
]

## Current stage

**Stage 7 — research paper: IN PROGRESS (2026-10-03).**

Stages 1–6 are complete. The theorem package is formalised in Lean and is
registered in Palomar as `PALOMAR-2026-10-02-000014` version 1, with registered
source commit `02a52e71a0a5ab1e77824490d0c47650d4a45691` and trust level
`high`.

Stage 7 is writing the research paper from the proved, audited, formalised, and
registered theorem set. Registration is verification/provenance evidence only;
it is not used as evidence of novelty or historical priority. Stage 8 arXiv
preparation/submission has not begun.

See:

- `STATUS.md` for the authoritative stage/gate state and the current Palomar-review disposition;
- `AGENTS.md` for the required workflow and research standards;
- `notes/stage5-formalisation.md` for the completed Lean formalisation;
- `notes/palomar-packaging-6.md` for the completed Palomar package and predictive-preflight record;
- `notes/palomar-registration-6.md` for the public registration record;
- `notes/provenance.md` and `notes/prior-art-audit-4.md` for the binding provenance and literature boundaries.

## Research discipline

The project distinguishes conjecture, finite experimental evidence, informal proof, Lean proof, Palomar registration, and literature evidence. None substitutes for another. In particular, computation, absence of search hits, formalisation, or registration does not establish mathematical novelty or historical priority.

Major stages are separated by committed handoffs. Do not begin a later stage in the session that completes the preceding stage.
