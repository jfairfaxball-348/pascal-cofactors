# Session 10 handoff — Stage 7 readability revision complete

Date: **2026-10-03**.

## Session result

The requested limited Stage-7 readability revision is complete.

Three compact explanatory figures were added to the completed manuscript. They
are mathematical aids only: no theorem statement, proof dependency, Palomar
registered scope, or literature/provenance boundary was changed.

**Stage 7 remains COMPLETE. Gate: PROCEED.**

Stage 8 arXiv preparation/submission was **not** started.

## Authoritative checkpoints

Registered Stage-6 source:

- commit:
  `02a52e71a0a5ab1e77824490d0c47650d4a45691`;
- Palomar:
  `PALOMAR-2026-10-02-000014`, version `1`.

Original validated Stage-7 paper-content checkpoint:

- `dd2ae2c148e4c8f736ae7e9880181217931447f3`.

Stage-7 branch head at the start of this readability revision:

- `0505965eb0f3ee8b4197eb3d1be2149ebc76a013`.

Final figure-bearing paper-content checkpoint:

- `ac448c885b4c2e9090278942b0af89510834d19f`.

The readability revision from the pre-revision head to that paper-content
checkpoint changes only:

- `paper/main.tex`;
- `paper/README.md`.

No Lean theorem/proof source, Palomar package, bibliography entry, or paper
workflow file was changed.

## Figures added

### 1. Proof roadmap

An early TikZ dependency diagram now shows the existing logical structure:

- threshold and coprimality;
- digit-sum shift;
- coefficient scaling;
- exact pre-endpoint restricted-GCD valuation;
- sparse endpoint;
- comparison with the extremal threshold;
- odd-`d >= 5` least-row theorem;
- cubic classification.

The diagram introduces no new claim or dependency.

### 2. Base-`Q` digit-block schematic

The digit-sum section now visualises the already-proved normalised expansion
[
mt
=
t+sum_{i=0}^{s-1}(Q-t)Q^{2i+1}
+sum_{i=1}^{s}(t-1)Q^{2i}.
]

It shows the repeated base-`Q` block pairs ((Q-t,t-1)), the complement
identity
[
s_p(Q-t)+s_p(t-1)=a(p-1),
]
and therefore the mechanism behind
[
s_p(mt)=s_p(t)+as(p-1).
]

A final spacing adjustment separated the brace annotation from the explanatory
line below it.

### 3. Concrete valuation profile

The examples section now plots the exact restricted-GCD valuation profile for
[
p=3,qquad a=2,qquad d=3,qquad Q=9,qquad m=73.
]

The plot displays:

- the baseline (as=2);
- the (+1) bumps at the powers (q=3) and (q=9);
- the endpoint jump at (q=10=Q+1) to the extremal threshold
  (r_3(73)=4).

This is a visualisation of the existing exact formula and existing worked
example, not additional computational evidence or a new statement.

### Optional fourth figure

No fourth figure was added. The exponent-one cubic exception is already
explained clearly in the theorem and examples, so an additional comparison
graphic would have increased length without adding enough explanatory value.

## Figure implementation

All three figures are LaTeX-native TikZ in `paper/main.tex`.

No external figure assets or generated image files are required.

`paper/README.md` now records the TikZ dependency and notes that the existing
workflow's `texlive-latex-extra` installation supplies PGF/TikZ.

## Paper validation

The relevant validation for this documentation/paper-only revision was the
paper build plus layout/visual inspection.

Final figure-bearing Paper workflow:

- run: `37129883073`;
- job: `111222716808`;
- conclusion: **success**;
- head:
  `ac448c885b4c2e9090278942b0af89510834d19f`.

The workflow passed:

- LaTeX generation;
- final undefined-citation/reference checks;
- the no-overfull-box check;
- PDF-bookmark checks;
- PDF metadata/text inspection;
- PDF artifact upload.

Final figure-bearing PDF:

- 15 A4 pages;
- PDF 1.5;
- 353386 bytes;
- title and author metadata preserved.

Artifact:

- name: `pascal-cofactors-paper`;
- artifact ID: `11276188278`;
- upload digest:
  `sha256:1283c40ecd311cbb42132a7353e9a4db5249a30e22406193750456517fc6e7e9`.

The three figures were also rendered at 160 dpi for targeted inspection.
The final render showed no clipped figure text or annotation overlap.

## Lean / Palomar boundary

No Lean change and no Palomar change was made.

The repository's existing Lean workflow happened to run automatically on the
paper-only push and passed at the figure-bearing checkpoint:

- run: `37129883029`;
- job: `111222716880`.

That automatic run is recorded only as incidental CI. A fresh Lean regression
was not mathematically required for this readability revision.

No Palomar preflight, verification, packaging, or registration action was run
or reopened. The registered Stage-6 source remains exactly
`02a52e71a0a5ab1e77824490d0c47650d4a45691`.

## Mathematical and literature scope

The validated theorem package remains unchanged.

The existing prior-work boundaries also remain unchanged, including:

- the restricted-GCD family is prior art;
- Kummer/Legendre machinery is classical;
- Pascal Extremes is same-author prior work;
- the cubic `(p,a)=(2,1)` instance is prior;
- Chung--Yang 2026 remains an unresolved theorem-level comparison.

No novelty or priority inference is drawn from the figures, Lean, Palomar, or
the paper build.

## Stage-8 readiness

**The manuscript is ready to move into Stage 8 arXiv preparation in the next
session.**

Stage 8 should use the figure-bearing paper-content checkpoint

`ac448c885b4c2e9090278942b0af89510834d19f`

together with this handoff as the manuscript source of truth.

Stage 8 should remain packaging/preflight work unless a genuine error is
identified; it should not reopen the mathematics merely because the paper now
contains figures.
