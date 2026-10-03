# Paper

Stage 7 manuscript for:

> *Pascal Cofactors: Least Extremal Rows for Alternating Cofactors of Prime Powers*

Author: John Fairfax-Ball.

## Files

- `main.tex` — complete standalone article source, including three LaTeX-native TikZ figures (proof roadmap, digit-block schematic, and a concrete valuation profile).
- `references.bib` — bibliography.
- `.github/workflows/paper.yml` — reproducible manuscript build and PDF preflight.

No external figure assets are required; all figures are generated directly from the LaTeX source.

## Build

From this directory, with a standard TeX Live installation including PGF/TikZ (provided by `texlive-latex-extra` in the repository workflow):

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

The repository Paper workflow additionally requires:

- no undefined citations or references in the final LaTeX log;
- no overfull boxes;
- no malformed math tokens in PDF bookmarks;
- a readable PDF with extractable text;
- successful preservation of the built PDF as a workflow artifact.

## Scope and provenance

The paper is based on the final Stage-4-cleared theorem package, the rigorous
proof in `notes/stage3-proof.md`, the completed Lean formalisation, and
Palomar registration `PALOMAR-2026-10-02-000014` v1.

The literature/provenance boundaries from `notes/prior-art-audit-4.md` remain
binding: the restricted-GCD family and classical Kummer/Legendre machinery are
prior art; Pascal Extremes supplies the global extremal framework; the cubic
`(p,a)=(2,1)` instance is prior; and the Chung--Yang 2026 theorem-level
comparison remains unresolved.

Palomar registration is verification/provenance evidence only. It is not
evidence of novelty, historical priority, or independent peer review.

Stage 8 arXiv preparation/submission is separate and must not begin until the
Stage-7 completion handoff.
