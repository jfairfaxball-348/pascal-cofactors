# Session 04 handoff — Stage 4 final theorem-level prior-art / novelty audit

Date: **2026-10-02**

## Completed in this session

Stage 4 only was completed. No Lean development, Palomar registration, paper drafting, or arXiv work was begun.

Predecessor pins remain exactly:

- \`jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5\`;
- \`jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94\`.

The durable final audit is \`notes/prior-art-audit-4.md\`.

## Exact theorem package audited

For prime \(p\), \(a\ge1\), \(Q=p^a\), odd \(d=2s+1\ge3\), and
\[
m=C_d(Q)=\frac{Q^d+1}{Q+1},
\]
Stage 4 audited the exact final Stage-3 statements:

\[
v_p\binom{mq}{mj}=as+v_p\binom qj
\qquad(2\le q\le Q,\ 1\le j<q);
\]

\[
v_p\binom{mq}{m}=as+v_p(q),
\]
with maximum \(a(d+1)/2\) uniquely at \(q=Q\);

\[
v_p(G(mq;m))
=
as+
\begin{cases}
1,&q=p^b,\ 1\le b\le a,\\
0,&\text{otherwise},
\end{cases}
\]
with maximum \(as+1\) and exact argmax \(\{p,\ldots,p^a\}\);

\[
v_p(G(Q^d+1;m))=a(d-1);
\]

\[
T_p(C_d(p^a))=p^{ad}+1
\qquad(d\ge5\text{ odd});
\]

and
\[
T_p(p^{2a}-p^a+1)=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
\]

## Main Stage-4 conclusions

No located accessible source was found to be an exact equivalent of, or theorem-level implication for, the **family-level** Stage-3 cofactor package beyond the prior ingredients and isolated edge already identified. This is a documented-search conclusion, not a claim of novelty or historical priority.

The Stage-3 theorem statements therefore remain suitable for formalisation in their strongest proved form.

The important scope boundaries are:

1. the fixed-multiple restricted-GCD object is prior art;
2. Kummer carry/borrow and Legendre/digit-sum machinery are classical;
3. Pascal Extremes supplies the prior global maximum \(r_p(m)\), existence framework, and \(T_p\) infrastructure;
4. Pascal Minus One's \`scaling_valuation\` is prior common-\(p^c\) scaling but is **not** the Stage-3 additive coefficient scaling law;
5. the Pascal Extremes complementary theorem
   \[
   T_p(p^a+1)=p^{3a}+1
   \]
   for \(a\ge2\) is prior work;
6. the \((p,a)=(2,1)\), \(m=3,N=6\) valuation-2 phenomenon is prior work in McTague and the pinned Pascal Minus One predecessor;
7. Chung--Yang 2026 remains unresolved at theorem level because the full text could not be obtained.

## New date-sensitive predecessor item

After the Stage-2 cutoff, the pinned Pascal Extremes theorem package became public as:

John Fairfax-Ball, *Sharp \(p\)-adic Extrema and Least Extremal Rows for Restricted Binomial GCDs*, arXiv:2610.01328v1 [math.NT], 1 October 2026.

Theorem 4.3 is the general global maximum theorem. Theorem 7.2 proves, for \(a\ge2\),
\[
T_p(p^a+1)=p^{3a}+1,
\]
equivalently with least multiplier
\[
p^{2a}-p^a+1=\Phi_6(p^a).
\]

This is especially close to cubic Target C, but it swaps the complementary factors: Target C uses \(\Phi_6(p^a)\) as the restriction modulus and \(p^a+1\) as the multiplier. The predecessor theorem does not transfer through the factorisation alone.

## Pascal Minus One scaling distinction

At the exact pin, \`PascalMinusOne/Scaling.lean\` proves
\[
v_p(G(p^cN';p^cq))=v_p(G(N';q)),
\]
and internally
\[
v_p\binom{p^cn}{p^ck}=v_p\binom nk.
\]

Neither is the Stage-3 identity
\[
v_p\binom{mq}{mj}=as+v_p\binom qj.
\]
Do not describe the latter as merely an instance of the predecessor's theorem named “scaling.”

## McTague / cubic edge

McTague's corrected arXiv v5 remains the primary earlier source for
\[
v_2(G(6;3))=2.
\]
The pinned Pascal Minus One theorem also covers that regime. Any later formal or paper-level treatment may include the full family theorem but must preserve this isolated prior instance explicitly.

## Chung--Yang 2026 unresolved comparison

Source:

Chan-Liang Chung, Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, Mediterranean Journal of Mathematics **23**, article 209 (2026), DOI 10.1007/s00009-026-03202-3, version of record 27 September 2026.

Stage-4 attempts included the DOI/Springer page, publisher PDF and institutional routes, SharedIt, exact-title searches, DOI+PDF, title+PDF/manuscript, arXiv, ResearchGate, \`edu.cn\`, \`edu.tw\`, and author/title variants.

Springer exposes the abstract/metadata/references but marks the article body as subscription content and offers no current SharedIt link. No legitimate open full theorem text was located.

The abstract advertises a non-coprime-index selector, not fixed multiples of an external modulus, but that alone is insufficient to certify theorem-level non-overlap. Keep the comparison **UNRESOLVED**.

## Stage-5 gate

**CLEARED.**

Formalise the exact Stage-3 theorem package in its strongest proved form. Formalisation is not novelty evidence.

No Stage-5 work has yet begun.

## Ready-to-paste Stage-5 prompt

Continue the Pascal Cofactors project at Stage 5 only in \`jfairfaxball-348/pascal-cofactors\`.

First read \`AGENTS.md\`, \`STATUS.md\`, \`notes/provenance.md\`, \`notes/stage3-proof.md\`, \`notes/prior-art-audit-4.md\`, and \`notes/session-04-handoff.md\`. Preserve the predecessor pins exactly:

- \`jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5\`;
- \`jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94\`.

Treat the repository as authoritative. Perform **Stage 5 Lean formalisation only**. Do not begin Palomar registration, paper drafting, or arXiv work.

Formalise the exact Stage-3 theorem package cleared by Stage 4, including:

1. for prime \(p\), \(a\ge1\), \(Q=p^a\), odd \(d=2s+1\ge3\), and
   \[
   m=C_d(Q)=\frac{Q^d+1}{Q+1},
   \]
   the corrected threshold
   \[
   p^{a(d-1)-1}<m<p^{a(d-1)},\qquad p\nmid m,\qquad r_p(m)=a(d-1);
   \]

2. the finite-window digit-sum mechanism and coefficient scaling
   \[
   v_p\binom{mq}{mj}=as+v_p\binom qj
   \qquad(2\le q\le Q,\ 1\le j<q);
   \]

3. the selected-coefficient formula
   \[
   v_p\binom{mq}{m}=as+v_p(q),
   \]
   its maximum \(a(d+1)/2\), and unique argmax \(q=Q\);

4. the exact restricted-GCD formula
   \[
   v_p(G(mq;m))
   =
   as+
   \begin{cases}
   1,&q=p^b\text{ for some }1\le b\le a,\\
   0,&\text{otherwise},
   \end{cases}
   \]
   together with maximum \(as+1\) and exact argmax set \(\{p,p^2,\ldots,p^a\}\);

5. the sparse endpoint
   \[
   v_p(G(Q^d+1;m))=a(d-1);
   \]

6. Target A for every odd \(d\ge5\):
   \[
   T_p(C_d(p^a))=p^{ad}+1;
   \]

7. Target C:
   \[
   T_p(p^{2a}-p^a+1)=
   \begin{cases}
   p(p^2-p+1),&a=1,\\
   p^{3a}+1,&a\ge2.
   \end{cases}
   \]

Use the Stage-3 proof architecture rather than inventing a weaker theorem. Keep coefficient statements distinct from restricted-GCD statements. Do not restore the false Stage-1 lower bound \(p^{a(d-1)}<C_d(p^a)\).

Before deciding whether to import, adapt, or reprove predecessor infrastructure, inspect the exact pinned theorem signatures. Record every formal dependency or copied/adapted lemma in \`notes/provenance.md\` or a Stage-5 formalisation note. In particular:

- Pascal Extremes' global maximum / \(T_p\) framework is prior work;
- Pascal Minus One's \`scaling_valuation\` removes common powers \(p^c\) from both row and modulus and is **not** the Stage-3 additive coefficient scaling law;
- the \((p,a)=(2,1),m=3,N=6\) valuation phenomenon is prior work recorded by McTague and the pinned Pascal Minus One predecessor;
- the complementary Pascal Extremes theorem \(T_p(p^a+1)=p^{3a}+1\) is prior work and does not replace the cofactor-side Target-C proof.

Build and test the Lean project from a clean state. Preserve exact compiler/toolchain versions and all material proof engineering decisions. Do not use computation as a substitute for a theorem proof.

At the end of Stage 5:

1. ensure all intended Lean theorems compile;
2. create a Stage-5 formalisation/provenance note recording theorem names, source files, dependencies, any theorem-statement adjustments forced by Lean, and exact build commands/results;
3. update \`STATUS.md\`;
4. create \`notes/session-05-handoff.md\`;
5. commit all Stage-5 work;
6. provide a ready-to-paste Stage-6 Palomar-registration prompt only if the formalisation is complete and the theorem statements still match the cleared Stage-4 scope;
7. stop without beginning Stage 6.
