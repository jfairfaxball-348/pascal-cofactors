# Stage-4 final theorem-level prior-art / novelty audit

Audit date and literature cutoff: **2026-10-02**.

Status: **deeper final-statement audit complete**. This audit is against the exact theorem package proved informally in \`notes/stage3-proof.md\`, not against the earlier Stage-2 conjectural formulations.

A documented negative search is not a proof of novelty or historical priority. An inaccessible source remains an unresolved comparison. Same-author predecessor work is prior work.

The predecessor pins are preserved exactly:

- \`jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5\`;
- \`jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94\`.

## 1. Exact Stage-3 statements audited

Let \(p\) be prime, \(a\ge1\), \(Q=p^a\), \(d=2s+1\ge3\) odd, and
\[
m=C_d(Q)=\frac{Q^d+1}{Q+1}.
\]

The exact final statements compared against the literature are:

**S0 — threshold prerequisite.**
\[
p^{a(d-1)-1}<m<p^{a(d-1)},\qquad p\nmid m,
\qquad r_p(m)=a(d-1)=2as.
\]

**S1 — finite-window coefficient scaling.** For
\(2\le q\le Q\) and \(1\le j<q\),
\[
v_p\binom{mq}{mj}=as+v_p\binom qj.
\]

**S2 — selected coefficient.** For \(2\le q\le Q\),
\[
v_p\binom{mq}{m}=as+v_p(q).
\]

**S3 — selected-coefficient maximum and equality classification.**
\[
\max_{2\le q\le Q}v_p\binom{mq}{m}
=as+a=\frac{a(d+1)}2,
\]
with unique argmax \(q=Q=p^a\).

**S4 — exact pre-extremal restricted-GCD formula.** For
\(2\le q\le Q\),
\[
v_p(G(mq;m))
=
as+
\begin{cases}
1,&q=p^b\text{ for some }1\le b\le a,\\
0,&\text{otherwise}.
\end{cases}
\]
Consequently,
\[
\max_{2\le q\le Q}v_p(G(mq;m))=as+1
=\frac{a(d-1)}2+1
\]
with exact argmax set \(\{p,p^2,\ldots,p^a\}\).

**S5 — sparse endpoint.**
\[
v_p(G(Q^d+1;m))=a(d-1)=r_p(m).
\]

**S6 — Target A, odd \(d\ge5\).**
\[
T_p(C_d(p^a))=p^{ad}+1.
\]

**S7 — Target C, \(d=3\).**
\[
T_p(p^{2a}-p^a+1)=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
\]

For \((p,a)=(2,1)\), \(m=3,N=6\), the valuation
\[
v_2(G(6;3))=2
\]
is prior work explicitly recorded by McTague and by the pinned Pascal Minus One predecessor. That isolated instance is not a new claim of this project.

## 2. Comparison categories

The classifications below mean:

- **exact equivalence**: the source theorem is the same mathematical statement after notation changes;
- **theorem implying project result**: the cited theorem supplies the project statement under its stated hypotheses;
- **strict special case**: the source proves a proper subfamily or isolated instance of the project statement;
- **same object, different hypotheses**: the source studies \(G(N;m)\) / Wu's \(g(m,n)\), but its theorem hypotheses do not yield the cofactor statement;
- **adjacent, different selector or aggregation**: the source studies a genuinely different set of lower indices or takes a GCD/minimum in a different variable;
- **unresolved comparison**: the available theorem text is insufficient to decide implication/equivalence.

No source is promoted from “not located” to “nonexistent.”

## 3. Classical Kummer / Legendre / digit-sum infrastructure

### Kummer 1852

E. E. Kummer, *Über die Ergänzungssätze zu den allgemeinen Reciprocitätsgesetzen*, Journal für die reine und angewandte Mathematik **44** (1852), 93--146, DOI 10.1515/crll.1852.44.93.

The classical theorem identifies
\[
v_p\binom nk
\]
with the number of base-\(p\) carries in \(k+(n-k)\), equivalently borrows in subtracting \(k\) from \(n\). Together with Legendre's factorial valuation formula it yields the standard digit-sum identity
\[
v_p\binom nk
=
\frac{s_p(k)+s_p(n-k)-s_p(n)}{p-1}.
\]

**Comparison with S1.** Kummer/Legendre immediately convert the project-specific digit-sum shift
\[
s_p(mt)=s_p(t)+as(p-1)\qquad(1\le t\le Q)
\]
into S1. They do **not** supply that shift for
\[
m=(Q^d+1)/(Q+1).
\]
The additive constant \(as\) therefore does not follow from Kummer or Legendre alone. The source is classical method/infrastructure, not an exact equivalent or theorem implying S1 without the new cofactor digit structure.

Searches were run for equivalent carry, borrow, digit-sum, and Legendre formulations of S1. No theorem-level source was located that gives the project-specific finite-window digit-sum shift or the resulting additive coefficient scaling for this cofactor family. This is negative-search evidence only.

Classification: **classical infrastructure; not target-level equivalence**.

## 4. Pascal Minus One — exact pin and public version

Pinned source:
\[
\texttt{jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5}.
\]

Public paper: John Fairfax-Ball, *Restricted Binomial GCDs at Primes Congruent to -1*, arXiv:2609.37754v1 [math.NT], 29 September 2026.

Relevant exact surfaces:

- \`PascalMinusOne/MinusOne.lean\`, public \`minus_one_valuation\`;
- arXiv Theorem 1.1, the complete \(p\equiv-1\pmod m\) valuation classification;
- \`PascalMinusOne/Scaling.lean\`, public \`scaling_valuation\`;
- arXiv Theorem 8.1:
  \[
  v_p(G(p^cN';p^cq))=v_p(G(N';q)).
  \]
- the private coefficient lemma used there:
  \[
  v_p\binom{p^cn}{p^ck}=v_p\binom nk.
  \]

### Scaling-name collision resolved

The predecessor theorem called “scaling” is **not** S1. It removes a common power \(p^c\) from both the row and the restriction modulus and preserves a restricted-GCD valuation. Its coefficient lemma likewise shifts both binomial arguments by the same power of \(p\) and has no additive constant.

S1 instead fixes the cofactor modulus \(m=C_d(p^a)\), which is coprime to \(p\), and states
\[
v_p\binom{mq}{mj}=as+v_p\binom qj
\]
over the finite window \(q\le Q\). Neither predecessor scaling statement implies this.

### Cubic edge

At \(p=2,a=1,d=3\), the project has \(m=3,q=2,N=6\). The pinned minus-one theorem covers the valuation-2 phenomenon, and its public paper explicitly credits McTague for the same isolated example. Thus this is a **strict special case** of S4/S7 already in predecessor mathematics.

Classification:

- S1--S3: **adjacent infrastructure, not equivalence or implication**;
- S4/S7 at \((p,a)=(2,1)\): **verified strict special case / prior instance**;
- general S4--S7: no implication from the predecessor theorem located.

## 5. Pascal Extremes — exact pin and newly public arXiv version

Pinned source:
\[
\texttt{jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94}.
\]

A public version appeared after the Stage-2 cutoff:

John Fairfax-Ball, *Sharp \(p\)-adic Extrema and Least Extremal Rows for Restricted Binomial GCDs*, arXiv:2610.01328v1 [math.NT], **1 October 2026**.

Relevant theorem-level surfaces:

- Definition 2.1: \(G(N;m)\) and \(r_p(m)\);
- Proposition 3.1: universal rowwise bound \(v_p(G(N;m))\le r_p(m)\) for \(p\nmid m\);
- Theorem 4.3: for prime \(p\), \(m\ge2\), \(p\nmid m\),
  \[
  \max_{\substack{N>m\\m\mid N}}v_p(G(N;m))=r_p(m),
  \]
  with constructive attainment;
- Definition 5.1: the least extremal row \(T_p(m)\);
- Proposition 6.1:
  \[
  v_p(G(p^{3a}+1;p^a+1))=a+1;
  \]
- Proposition 7.1: strict lower-row non-attainment for modulus \(p^a+1\);
- Theorem 7.2, for \(a\ge2\):
  \[
  T_p(p^a+1)=p^{3a}+1,
  \]
  equivalently the least multiplier is
  \[
  p^{2a}-p^a+1=\Phi_6(p^a);
  \]
- Remark 8.4 records McTague's known \(v_2(G(6;3))=2\) instance.

### Exact comparison

Theorem 4.3 is a **theorem-level prerequisite / general prior theorem** for the extremal framework. Once S0 proves \(p\nmid m\) and identifies \(r_p(m)\), it establishes that \(r_p(m)\) is the global maximum and that extremal rows exist. It does **not** identify the cofactor sparse endpoint \(Q^d+1\), prove S5, or prove any lower-multiplier minimality for \(C_d(Q)\).

Theorem 7.2 is especially close to S7 but is not the same theorem. Put
\[
Q=p^a,\qquad \Phi_6(Q)=Q^2-Q+1.
\]
The predecessor says, for \(a\ge2\), that with **restriction modulus \(Q+1\)** the least extremal multiplier is **\(\Phi_6(Q)\)**:
\[
(Q+1)\Phi_6(Q)=Q^3+1.
\]
S7 says that with **restriction modulus \(\Phi_6(Q)\)** the least extremal multiplier is **\(Q+1\)**:
\[
\Phi_6(Q)(Q+1)=Q^3+1.
\]
The factorisation alone does not transfer a least-row statement from one factor to the complementary factor. The Stage-3 proof establishes separate lower-row non-attainment for the cofactor modulus.

Classification:

- global extremal value / existence framework: **theorem implying the prerequisite global-max fact; prior work**;
- S5/S6: **same object, stronger family-specific endpoint/minimality not implied**;
- S7 for \(a\ge2\): **substantial complementary-factor prior work; not equivalence or implication**;
- S7 \((p,a)=(2,1)\): prior instance as separately noted.

This newly public arXiv version is a material Stage-4 update and must be cited in any later paper-level literature discussion.

## 6. McTague — corrected v5

Carl McTague, *On the Greatest Common Divisor of Binomial Coefficients \(\binom nq,\binom n{2q},\binom n{3q},\ldots\)*, American Mathematical Monthly **124**(4) (2017), 353--356, DOI 10.4169/amer.math.monthly.124.4.353. Corrected preprint: arXiv:1510.06696v5, 25 July 2018.

Theorem-level locations retained from the primary/predecessor audit:

- Theorem Q, page 1:
  for \(n>q>0\) and prime \(p\equiv1\pmod q\),
  \[
  v_p\!\left(\gcd_{0<k<n/q}\binom n{qk}\right)
  =
  \begin{cases}
  1,&\alpha_p(n)\le q,\\
  0,&\text{otherwise};
  \end{cases}
  \]
- corrected first remark, page 2: same-residue extension with the corrected conditions including \(p>q\);
- page 2 example:
  \[
  v_2\!\left(\gcd_{0<k<2}\binom6{3k}\right)=2.
  \]

After \(n=N,q=m\), McTague's object is exactly \(G(N;m)\).

For the cofactor family, the valuation prime \(p\) is less than \(m=C_d(p^a)\) outside the tiny cubic edge. Hence the \(p\equiv1\pmod m\) theorem and the corrected \(p>m\) same-residue extension cannot imply the general cofactor results.

The \(m=3,p=2,N=6\) example is a direct prior instance of the cubic family and is preserved as such.

Classification:

- S4/S7 at \((2,1)\): **verified strict special case**;
- general S1--S7: **same fixed-multiple object but different hypotheses; no implication located**.

## 7. Wu 2026

Chai Wah Wu, *Computing the Greatest Common Divisor of Binomial Coefficients \(\binom{mn}{mk}\)*, arXiv:2606.20940v2 [math.NT], first submitted 18 June 2026, v2 revised 4 August 2026.

Definition, page 1:
\[
g(m,n)=\gcd\left\{\binom{mn}{mk}:1\le k<n\right\}.
\]
Thus exactly
\[
g(m,q)=G(mq;m).
\]

Theorem 1, page 2: if the restriction modulus is \(m=p^t\), then
\[
v_p(g(m,n))=
\begin{cases}
1,&n\text{ is a power of }p,\\
0,&\text{otherwise}.
\end{cases}
\]

Theorem 2, page 2: an explicit product formula under \(m=p^t\) together with congruence conditions on the other relevant primes.

Wu's Theorem 1 is structurally close to the ordinary-row minimum used inside S4: it has the same “power of \(p\) versus not a power of \(p\)” dichotomy. But Wu's theorem concerns valuation at a prime that **divides the restriction modulus**, whereas the project family has
\[
p\nmid C_d(p^a).
\]
It therefore does not imply S4 or S1.

Classification: **exactly same GCD object; different mutually incompatible family hypothesis for the target prime**.

## 8. Chung--Yang--Zhou 2025

Chan-Liang Chung, Tse-Chung Yang, Kanglun Zhou, *The Greatest Common Divisor of Sets of Binomial Coefficients with Restrictions*, Contemporary Mathematics **6**(1) (2025), 971--985, DOI 10.37256/cm.6120255017. Received 23 May 2024, revised 12 August 2024, accepted 15 August 2024, published 10 February 2025.

The paper defines, page 973,
\[
A_d(n)=\left\{\binom nk:1\le k\le n-1,\ \gcd(n,k)=d\right\}.
\]

Relevant inspected statements:

- Theorem 4, page 973: a \(p\)-adic formula for \(\gcd A_2(n)\) for a sparse four-term \(p\)-power shape;
- Theorem 5, page 973: a \(p\)-adic formula for \(\gcd A_2(n)\) for an alternating/geometric \(p\)-power sum with even length;
- Proposition 1, page 974: an even-\(n\) result when \(n-1\) is an odd-prime power.

The sparse \(p\)-power shapes make these results mathematically adjacent to S5, but the selector is \(\gcd(n,k)=2\) (more generally \(\gcd(n,k)=d\)), not a fixed external divisibility condition \(m\mid k\). There is no notation change turning those selected sets into the project set in general.

Classification: **adjacent sparse-row results with a different selector; no implication of S1--S7 located**.

## 9. Chiu--Yuan--Zhou 2023

Sunben Chiu, Pingzhi Yuan, Tao Zhou, *On the Greatest Common Divisor of Binomial Coefficients*, Bulletin of the Korean Mathematical Society **60**(4) (2023), 863--872, DOI 10.4134/BKMS.b220166.

The publisher/KCI abstract gives the main theorem in the following setup. Let \(b(n)\) be the smallest central-band cutoff for which the unrestricted central-band GCD is nontrivial. For composite \(n\), prime \(p\mid n\), and
\[
n=a_mp^m+r,\qquad 0\le r<p^m,\quad0<a_m<p,
\]
the paper determines
\[
v_p\!\left(
\gcd\left\{\binom nk:b(n)<k<n-b(n),\ \gcd(n,k)>1\right\}
\right)
\]
as \(1\) exactly in the specified leading-digit case \(a_m=1,r=b(n)\), and \(0\) otherwise.

This selector is a **central-band non-coprime-index selector**, and the visible theorem also assumes \(p\mid n\). It is not the fixed-multiple selector \(m\mid k\).

Stage 4 rechecked the publisher/KCI metadata and attempted the openly linked full-text route. The bibliographic pages and the exact main formula were recoverable, but an authoritative internal theorem-number/page pinpoint for that displayed main formula was not reliably recovered from the accessible full-text route. That pinpoint remains a limited bibliographic access gap; the mathematical selector/hypotheses of the displayed main result are explicit.

Classification: **adjacent but different selector/hypotheses; no implication of S1--S7 from the accessible theorem statement**.

## 10. Chung--Yang 2026 — renewed access attempt

Chan-Liang Chung, Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, Mediterranean Journal of Mathematics **23**, article 209 (2026), DOI 10.1007/s00009-026-03202-3.

Publisher metadata:

- received 6 April 2026;
- revised 21 August 2026;
- accepted 8 September 2026;
- published / version of record 27 September 2026.

The Springer abstract states that the paper studies binomial coefficients for which the upper and lower indices are non-coprime. For the full range it gives a complete characterization when \(n\) is even, with possible GCD values \(2,p,2p,1\) depending on power-of-two and \(p^t+1\) shapes; it also studies central-band variants and exact \(p\)-adic valuations under additional conditions.

### Stage-4 access attempts

The following were attempted on 2 October 2026:

1. the DOI / Springer article page;
2. Springer article/PDF access from the publisher page;
3. Springer institutional-login route;
4. Springer SharedIt / shareable-link route;
5. exact-title general web search;
6. exact DOI plus “pdf” search;
7. exact title plus “pdf”;
8. exact title plus “manuscript”;
9. exact-title arXiv search;
10. exact-title ResearchGate search;
11. exact-title searches scoped to \`edu.cn\` and \`edu.tw\`;
12. author/title variants.

Result: Springer exposes the abstract, references, dates, and bibliographic metadata but marks the article body as subscription content; the PDF is offered through institutional/subscription or paid access, and Springer states that no SharedIt link is currently available. No legitimate openly accessible manuscript/full theorem text was located in the Stage-4 searches.

### Comparison status

The abstract's advertised selector, “upper and lower indices are not coprime,” is visibly different from fixed multiples \(m\mid k\). That is **not sufficient** to certify theorem-level non-overlap, because inaccessible lemmas or special cases inside the paper could still intersect the project family.

Classification: **UNRESOLVED COMPARISON**. No novelty inference is drawn from the access failure.

## 11. Siao Hong 2016

Siao Hong, *The greatest common divisor of certain binomial coefficients*, Comptes Rendus Mathématique **354**(8) (2016), 756--761, DOI 10.1016/j.crma.2016.06.001. Received 15 March 2016, accepted 8 June 2016, online 12 July 2016.

Theorem 1.1, page 757:
for positive integers \(m,n\),
\[
\gcd\left\{
\binom{mn}{k}:1\le k\le mn,\ \gcd(k,m)=1
\right\}
=
m\prod_{p\mid\gcd(m,n)}p^{v_p(n)}.
\]

Corollaries 1.2 and 1.3 give specializations.

The selector \(\gcd(k,m)=1\) is essentially complementary in flavor to “\(m\mid k\)”; it is not the project selector. The theorem does not give a least multiplier or a coefficient-scaling identity of S1 type.

Classification: **adjacent but different selector**.

## 12. Guo--Qiu--Cao--Feng--Gao 2026

Dakai Guo, Ruichen Qiu, Yichuan Cao, Ruyong Feng, Xiao-Shan Gao, *A Greatest Common Divisor Criterion of Certain Binomial Coefficients*, arXiv:2606.22997v1 [math.NT], submitted 22 June 2026.

Theorem 1, page 2, concerns
\[
D(k)=\gcd_{2\le q\le k+1}\binom{qk}{k},
\qquad n=k+1,
\]
and characterizes when \(D(k)=1\) in terms of the largest exact prime-power component of \(n\). The paper includes a Lean formalization of this different criterion.

This is not \(G(mq;m)\). It fixes the lower index and takes a GCD **across row multipliers \(q\)**. Thus at a prime it aggregates by a minimum across \(q\). S3 instead takes a maximum of selected coefficient valuations across \(q\), while S4 takes a per-row GCD over \(j\).

Classification: **adjacent but different aggregation; no implication**.

## 13. Other historical/background sources screened

The related-work chains of the serious sources above also point to Ram's 1909 full-row GCD theorem, Albree (1972), Joris--Oestreicher--Steinig (J. Number Theory **21**(1), 101--119 (1985), DOI 10.1016/0022-314X(85)90013-7), Fine (1947), Granville (1997), and other general divisibility/congruence work.

These were screened as background for hidden equivalent formulations, especially through the citation chains of McTague, Wu, Chung--Yang--Zhou, Chung--Yang, and Pascal Extremes. No theorem-level statement from that screening was located that specializes directly to S1 or to the cofactor least-row formulas S6/S7. They are not used as negative evidence of historical priority.

## 14. Search formulations preserved

The Stage-4 audit reran Stage-2 author/title and citation-chain searches and added exact final-statement translations. Material query families included punctuation, TeX, plain-text, and notation variants of:

- \`"v_p" "binom{mq}{mj}"\`;
- \`"binom(mq,mj)" p-adic valuation scaling\`;
- \`"binom{mn}{mk}" "p-adic valuation" Kummer\`;
- \`"v_p binom(mq,mj) = c + v_p binom(q,j)"\`;
- \`"s_p(mt)" digit sum binomial valuation scaling\`;
- \`"s_p(mx)" "s_p(x)"\`;
- \`"sum of digits" multiplication "p^a-1"\`;
- base-\(p\) complement / block-complement / carry formulations;
- \`g(m,n)\`, \`G(mq;m)\`, \`C(mn,mk)\`, and fixed-multiple lower-index GCD formulations;
- \`"restricted binomial gcd" exact valuation\`;
- \`"row-by-row" binomial gcd valuation\`;
- \`"argmax" binomial coefficient p-adic valuation power\`;
- \`"least extremal row" binomial gcd\`;
- \`"least multiplier" binomial gcd\`;
- \`"least" "g(m,n)" binomial\`;
- \`"p^{ad}+1" binomial gcd Kummer\`;
- \`"(Q^d+1)/(Q+1)" binomial coefficient valuation\`;
- \`"alternating cofactor" binomial gcd\`;
- \`"complementary factor" binomial gcd p-adic\`;
- \`"p^{2a}-p^a+1" binomial gcd\`;
- \`"Q^2-Q+1" binomial gcd\`;
- \`"Phi_6" binomial gcd p-adic\`;
- searches for \((Q+1)\Phi_6(Q)=Q^3+1\) with either factor as modulus/multiplier;
- exact author/title searches for McTague, Wu, Chung--Yang--Zhou, Chiu--Yuan--Zhou, Chung--Yang, Hong, and Guo--Qiu--Cao--Feng--Gao;
- forward/backward citation searches from those sources;
- 2026 recency searches through the Stage-4 date.

No exact family-level source for S1, S4, S5, S6, or S7 was located in those documented searches. That sentence records search output only; it is not a novelty or priority theorem.

## 15. Final theorem-by-theorem comparison matrix

| Source | S1 coefficient scaling | S3 selected max/argmax | S4 exact GCD row formula | S5 endpoint | S6 Target A | S7 Target C |
| --- | --- | --- | --- | --- | --- | --- |
| Kummer / Legendre | general tool; needs project digit-sum shift | tool only | tool only | tool only | tool only | tool only |
| Pascal Minus One pin / arXiv:2609.37754 | different common-\(p^c\) scaling | no | strict \((2,1)\) edge overlap | edge only | no | strict \((2,1)\) edge overlap |
| Pascal Extremes pin / arXiv:2610.01328 | no | no | global max framework, not row formula | does not identify cofactor endpoint | does not give cofactor least row | complementary-factor theorem, not implication |
| McTague v5 | no | no | same object/different hypotheses; \((2,1)\) edge | edge only | no | strict \((2,1)\) edge |
| Wu v2 | no | no | same object, modulus \(p^t\) hypothesis | no | no | no |
| Chung--Yang--Zhou 2025 | no | no | different \(\gcd(n,k)=d\) selector | sparse-row adjacent | no | no |
| Chiu--Yuan--Zhou 2023 | no | no | different central-band/non-coprime selector | no | no | no |
| Chung--Yang 2026 | unresolved full theorem text | unresolved | unresolved | unresolved | unresolved | unresolved |
| Hong 2016 | no | no | different coprime-index selector | no | no | no |
| Guo et al. 2026 | no | different aggregation | different aggregation | no | no | no |

## 16. Scope decision after Stage 4

No located accessible theorem is an exact equivalent of, or a theorem-level implication for, the **family-level** S1--S7 package beyond the explicitly carved-out \((p,a)=(2,1)\), \(m=3,N=6\) instance and the general predecessor facts already identified.

Accordingly, the Stage-3 theorem statements do **not** need to be weakened before formalisation. They remain suitable for Stage 5 in their strongest proved formulations.

The scope is nevertheless narrowed explicitly in how later work may describe the contribution:

1. the fixed-multiple restricted-GCD object is prior art;
2. Kummer/carry and Legendre/digit-sum machinery are classical;
3. the global maximum \(r_p(m)\), existence of extremal rows, and the \(T_p\) framework are prior same-author work;
4. the common-\(p^c\) predecessor scaling theorem is prior work and must not be conflated with S1;
5. \(T_p(p^a+1)=p^{3a}+1\) for \(a\ge2\), with least multiplier \(\Phi_6(p^a)\), is complementary same-author prior work;
6. \(v_2(G(6;3))=2\) / \(T_2(3)=6\) is prior work already recorded by McTague and the pinned Pascal Minus One predecessor;
7. Chung--Yang 2026 remains unresolved at theorem level because the full text was not accessible.

The strongest defensible literature statement after this audit is:

> No mathematically equivalent or theorem-level source implying the family-level Stage-3 cofactor statements was located in the documented search through 2 October 2026; the Chung--Yang 2026 full theorem text remains an unresolved comparison.

This is deliberately **not** a claim of novelty or historical priority.

## 17. Stage-5 suitability

The exact Stage-3 theorem package is suitable to proceed to Lean formalisation. Formalisation must preserve the prior-work boundaries above and must not be treated as evidence of novelty.

No Lean, Palomar, paper, or arXiv work was begun in Stage 4.
