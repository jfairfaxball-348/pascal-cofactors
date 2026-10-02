# Pascal Cofactors — research workflow

This repository is an original mathematics project on restricted binomial GCDs and alternating cofactors of prime powers.

## Required stage order

Do not silently skip, merge, or reorder these stages:

1. scaffold and provenance;
2. initial theorem-level prior-art audit and independent computational reproduction;
3. rigorous informal proof;
4. deeper theorem-level prior-art / novelty audit of the final proved statements;
5. Lean formalisation;
6. Palomar registration packaging and predictive preflight; the human maintainer performs the actual Palomar registration after the package is ready;
7. research paper;
8. arXiv preparation and submission.

Each stage normally occupies its own dedicated session. At the end of every stage:

1. update `STATUS.md`;
2. preserve relevant notes, code, outputs, ranges, exclusions, and provenance;
3. commit the completed work;
4. create `notes/session-XX-handoff.md`;
5. provide a ready-to-paste prompt for the next stage;
6. stop without beginning the next stage.

## Research standards

Use explicit status language: **conjectured**, **experimentally checked in a stated range**, **proved informally**, **formalised**, **registered**, **submitted**.

Never infer mathematical novelty or historical priority from:

- finite computation;
- absence of an exact search hit;
- an informal or formal proof;
- Lean formalisation;
- Palomar registration.

A negative literature search supports only wording such as “no equivalent result was located in the documented search.” Inaccessible or very recent sources remain unresolved comparisons, not evidence of non-overlap.

Experiments must use exact integer arithmetic. Important computational claims should be checked by mathematically independent implementations where feasible. Do not use experiments as steps in an infinite proof.

Do not begin substantive Lean development before Stage 4 clears the exact proved theorem statements. Stage 6 assistant work prepares the Palomar package and runs predictive preflight only; it must stop at a green immutable candidate for the human maintainer to register. Predictive preflight is not registration. Do not begin the full paper before the human maintainer has confirmed Palomar registration is complete. Do not begin arXiv submission in the same session as paper writing.

## Core notation

For (m\ge2), (N>m), (m\mid N):
[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
]

For prime (p\nmid m):
[
r_p(m)=\min\{r\ge1:m<p^r\}.
]

Define (T_p(m)) only after existence of an extremal row has been established.

For prime (p), (a\ge1), put (Q=p^a). For odd (d\ge3):
[
C_d(Q)=\frac{Q^d+1}{Q+1}.
]

Use (q) for the row multiplier (N=mq). Keep statements about one selected coefficient distinct from statements about the restricted GCD.

## Predecessor provenance

Stage-1 inspection on 2026-10-01 is pinned to:

- `jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5`;
- `jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94`.

The predecessor projects are prior work even though they have the same author.

The current project does **not** import either predecessor at Stage 1. Exact mathematical and formal reuse decisions are recorded in `notes/provenance.md` and must not be changed silently.

## Trust boundaries

The durable repository state, not chat recollection, is authoritative. Read `STATUS.md`, `notes/targets.md`, `notes/provenance.md`, and the latest handoff before starting a new stage.

Classical tools such as Kummer's theorem, Legendre's formula, and elementary cyclotomic identities must be cited or identified as known tools rather than presented as new.
