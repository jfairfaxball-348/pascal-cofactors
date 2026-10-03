# Session 09 handoff — Stage 7 paper complete

Date: **2026-10-03**.

## Session result

Stage 7 is complete. The Pascal Cofactors research paper has been written as a
standalone mathematics manuscript, checked against the Stage-3 proof and
Stage-4 literature audit, aligned with the completed Lean theorem layer and the
registered Palomar statement package, built reproducibly to PDF, and visually
inspected.

**Stage-7 gate: PROCEED — Stage 8 arXiv preparation may begin in the next
session.**

Stage 8 was **not** started in this session.

## Authoritative checkpoints

Registered Stage-6 source:

- commit:
  `02a52e71a0a5ab1e77824490d0c47650d4a45691`;
- Palomar:
  `PALOMAR-2026-10-02-000014`, version `1`;
- status: registered, trust level high.

Final Stage-7 paper-content checkpoint:

- branch: `stage7-paper`;
- commit:
  `dd2ae2c148e4c8f736ae7e9880181217931447f3`.

A comparison from the registered source commit to the Stage-7 paper branch
showed only paper/documentation/paper-CI changes. No Lean theorem or proof
source was changed during Stage 7.

## Paper files

The completed manuscript source is:

- `paper/main.tex`;
- `paper/references.bib`;
- `paper/README.md`;
- `.github/workflows/paper.yml`.

Title:

> *Pascal Cofactors: Least Extremal Rows for Alternating Cofactors of Prime
> Powers*

Author: John Fairfax-Ball.

The paper is intentionally written as a standalone article rather than a
restatement of the Palomar Challenge.

## Mathematical content retained

Let (p) be prime, (a\ge1), (Q=p^a), (d=2s+1\ge3) odd, and
[
m=C_d(Q)=\frac{Q^d+1}{Q+1}.
]

The manuscript presents the Stage-4-cleared package:

1. exact threshold and coprimality,
   [
   p^{a(d-1)-1}<m<p^{a(d-1)},\qquad p\nmid m,
   \qquad r_p(m)=a(d-1);
   ]
2. the digit-sum shift
   [
   s_p(mt)=s_p(t)+as(p-1)\qquad(1\le t\le Q);
   ]
3. finite-window coefficient scaling
   [
   v_p\binom{mq}{mj}=as+v_p\binom qj
   \qquad(2\le q\le Q,\ 1\le j<q);
   ]
4. the selected coefficient formula and its unique maximum at (q=Q);
5. the exact pre-endpoint restricted-GCD valuation and argmax set;
6. the exact sparse-endpoint valuation at (q=Q+1);
7. for every odd (d\ge5),
   [
   T_p(C_d(p^a))=p^{ad}+1;
   ]
8. the full cubic classification
   [
   T_p(p^{2a}-p^a+1)=
   \begin{cases}
   p(p^2-p+1),&a=1,\\
   p^{3a}+1,&a\ge2.
   \end{cases}
   ]

The paper also explains why the selected coefficient alone is insufficient in
the cubic (a\ge2) case and includes concrete examples.

## Prior-work boundaries preserved

The manuscript keeps the Stage-4 distinctions intact:

- the fixed-multiple restricted-binomial-GCD family is prior art;
- Kummer/Legendre carry and digit-sum machinery is classical;
- Pascal Extremes is same-author prior work supplying the global extremal
  theorem, existence of extremal rows, and the (T_p) framework;
- the Pascal Minus One common-(p^c) scaling theorem is prior work and is not
  conflated with the additive cofactor scaling law;
- (T_p(p^a+1)=p^{3a}+1) for (a\ge2) is complementary same-author prior
  work and does not imply the cofactor-side cubic theorem;
- the ((p,a)=(2,1)), (m=3,N=6) valuation phenomenon is explicitly retained
  as prior work;
- the Chung--Yang 2026 full theorem text remains an unresolved theorem-level
  comparison.

The paper says only that no equivalent or theorem-level source implying the
family-level statements was located in the documented search through
2 October 2026. It does not claim historical priority or novelty from a
negative search.

## Formal verification and Palomar wording

The formal-verification section maps the principal mathematical statements to:

- `PascalCofactors.coefficient_scaling`;
- `PascalCofactors.restricted_gcd_valuation_bounded`;
- `PascalCofactors.targetA_d`;
- `PascalCofactors.targetC`.

It records Palomar registration
`PALOMAR-2026-10-02-000014` v1 and the registered source commit exactly.

The manuscript explicitly says that formal verification and registry
preservation are verification/provenance facts, not evidence of historical
novelty, literature completeness, or independent human peer review.

## Final build and inspection

Final Stage-7 paper CI:

- workflow run: `37105302866`;
- job: `111152508881`;
- head:
  `dd2ae2c148e4c8f736ae7e9880181217931447f3`;
- conclusion: success.

The workflow performed the LaTeX build, final-log citation/reference checks,
overfull-box and PDF-bookmark checks, PDF metadata/text inspection, and PDF
artifact upload.

Final generated PDF:

- 13 pages;
- A4;
- PDF 1.5;
- 333695 bytes;
- PDF title:
  *Pascal Cofactors: Least Extremal Rows for Alternating Cofactors of Prime
  Powers*;
- PDF author: John Fairfax-Ball.

Preserved workflow artifact:

- name: `pascal-cofactors-paper`;
- artifact ID: `11267592824`;
- digest:
  `sha256:97b566792155df5af005485b88a5c11e2a10bff8940e994b5c690016d7e7e63a`.

The 13-page PDF was rendered at 160 dpi and inspected. No clipped text,
overlaps, broken glyphs, or malformed equations were observed. The formal
verification table and final bibliography were inspected specifically. The
arXiv identifiers for the four preprints are visible in the rendered
bibliography.

Final Stage-7 Lean regression:

- workflow run: `37105302860`;
- job: `111152546692`;
- same head:
  `dd2ae2c148e4c8f736ae7e9880181217931447f3`;
- conclusion: success.

## Stage-8 boundary

No arXiv source bundle, arXiv metadata form, submission, or public posting was
started in this session.

Stage 8 should use the completed Stage-7 manuscript as its source of truth,
perform arXiv-specific packaging/preflight, preserve all literature and
provenance caveats, and avoid mathematical changes unless a genuine correction
is identified and separately documented.

## Ready-to-paste kickoff prompt for the next session

Continue the Pascal Cofactors project at **Stage 8 only** in
`jfairfaxball-348/pascal-cofactors`.

Stages 1--7 are COMPLETE. Do not reopen the proof, novelty audit, Lean
formalisation, Palomar registration, or paper-writing stages unless a genuine
error is found.

First read:

- `AGENTS.md`
- `STATUS.md`
- `notes/provenance.md`
- `notes/stage3-proof.md`
- `notes/prior-art-audit-4.md`
- `notes/stage5-formalisation.md`
- `notes/palomar-registration-6.md`
- `notes/session-09-handoff.md`
- `paper/main.tex`
- `paper/references.bib`
- `paper/README.md`

Treat the repository as authoritative.

Use the completed Stage-7 paper-content checkpoint:

`dd2ae2c148e4c8f736ae7e9880181217931447f3`

The final Stage-7 paper CI is run `37105302866`, job `111152508881`, and
the final Stage-7 Lean regression is run `37105302860`, job
`111152546692`; both passed at that checkpoint.

Perform **Stage 8 arXiv preparation only**: prepare a clean arXiv source bundle,
check the title/author/abstract/category/MSC/comments metadata against the
completed paper, run a clean arXiv-oriented TeX preflight, and document the
submission-ready package and any arXiv-specific changes. Preserve the exact
theorem scope and all prior-work caveats, especially the unresolved
Chung--Yang 2026 theorem-level comparison.

Do not infer novelty or priority from Lean, Palomar, or arXiv. Do not change
the mathematical claims merely for packaging. If an actual arXiv submission
requires a human account action, stop at a submission-ready package and give
John Fairfax-Ball the exact remaining manual steps.
