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

**Stage 6 — Palomar packaging and predictive preflight: COMPLETE; PALOMAR REGISTRATION PENDING (2026-10-02).**

Stages 1–5 are complete. The Stage-4-cleared theorem package S0–S7 has been formalised in Lean, and the Palomar package and full predictive preflight were completed successfully for candidate commit `db0428e43802bf598582295ffd9358f78a5221e7`.

The human maintainer submitted that candidate to Palomar on 2 October 2026. Mechanical verification passed, but the automated editorial review requested correction of stale current-stage documentation before registration could be offered. **Palomar registration has not occurred, and no Palomar registry ID is claimed.**

See:

- `STATUS.md` for the authoritative stage/gate state and the current Palomar-review disposition;
- `AGENTS.md` for the required workflow and research standards;
- `notes/stage5-formalisation.md` for the completed Lean formalisation;
- `notes/palomar-packaging-6.md` for the completed Palomar package and predictive-preflight record;
- `notes/provenance.md` and `notes/prior-art-audit-4.md` for the binding provenance and literature boundaries.

## Research discipline

The project distinguishes conjecture, finite experimental evidence, informal proof, Lean proof, Palomar registration, and literature evidence. None substitutes for another. In particular, computation, absence of search hits, formalisation, or registration does not establish mathematical novelty or historical priority.

Major stages are separated by committed handoffs. Do not begin a later stage in the session that completes the preceding stage.
