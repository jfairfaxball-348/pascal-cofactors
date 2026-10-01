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
Once existence of an extremal row has been established, write
[
T_p(m)=\min\{N>m:m\mid N, v_p(G(N;m))=r_p(m)\}.
]

The new family starts from (Q=p^a) and odd (d\ge3):
[
C_d(Q)=\frac{Q^d+1}{Q+1}
      =Q^{d-1}-Q^{d-2}+\cdots-Q+1.
]

## Current stage

**Stage 1 — scaffold and provenance: COMPLETE (2026-10-01).**

No project target has been proved in this repository. No independent computational reproduction has yet been performed. No theorem-level novelty conclusion has been reached.

See:

- `STATUS.md` for the authoritative stage/gate state;
- `AGENTS.md` for the required workflow and research standards;
- `notes/targets.md` for the exact conjectural targets;
- `notes/provenance.md` for predecessor inspection and reuse status;
- `notes/preliminary-evidence.md` for kickoff evidence that has **not** yet been independently reproduced;
- `notes/session-01-handoff.md` for the Stage-2 handoff.

## Research discipline

The project distinguishes conjecture, finite experimental evidence, informal proof, Lean proof, Palomar registration, and literature evidence. None substitutes for another. In particular, computation, absence of search hits, formalisation, or registration does not establish mathematical novelty or historical priority.

Major stages are separated by committed handoffs. Do not begin a later stage in the session that completes the preceding stage.
