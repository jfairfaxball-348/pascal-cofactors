# Stage-2 initial theorem-level prior-art audit

Audit date/cutoff: **2026-10-01**.

Status: **initial theorem-level audit only**. This document records what was actually located and inspected before proof development. It does not establish mathematical novelty or historical priority. A negative search supports only the statement that no equivalent result was located in the documented search.

Predecessor pins are preserved exactly:

- jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5
- jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94

## 1. Exact targets audited

For prime \(p\), \(a\ge1\), \(Q=p^a\), and odd \(d\ge3\), put
\[
C_d(Q)=\frac{Q^d+1}{Q+1},\qquad m=C_d(Q).
\]

The audited statements/questions are:

- **Target A**, odd \(d\ge5\):
  \[
  T_p(C_d(p^a))=p^{ad}+1,
  \]
  equivalently least extremal multiplier \(q=Q+1\).
- **Target B**, odd \(d\ge5\):
  \[
  \max_{2\le q\le Q}v_p\binom{mq}{m}=\frac{a(d+1)}2.
  \]
  This is a selected-coefficient maximum, not a restricted-GCD valuation.
- **Restricted-GCD pre-extremal question**:
  \[
  \max_{2\le q\le Q}v_p(G(mq;m)).
  \]
  Stage-2 computation suggests the separate conjectural value
  \[
  \frac{a(d-1)}2+1.
  \]
- **Target C**, \(d=3\), \(m=p^{2a}-p^a+1=\Phi_6(p^a)\):
  \[
  T_p(m)=
  \begin{cases}
  p(p^2-p+1),&a=1,\\
  p^{3a}+1,&a\ge2.
  \end{cases}
  \]

The translation used throughout for Wu is exact:
\[
g(m,q)=\gcd_{1\le k<q}\binom{mq}{mk}=G(mq;m).
\]

## 2. Same-author predecessor: Pascal Extremes

Source inspected at the pinned commit:

jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94.

Relevant theorem surfaces inspected:

- PascalExtremes/TargetA.lean: targetA_upper_witness and targetA_upper;
- PascalExtremes/TargetAAttainment.lean: constructive attainment feeding the global theorem;
- targetA: for prime \(p\), \(m\ge2\), \(p\nmid m\),
  \[
  \max_{N>m,\ m\mid N}v_p(G(N;m))=r_p(m);
  \]
- extremalRows, T, T_mem_extremalRows, and T_isLeast;
- PascalExtremes/TargetB.lean and PascalExtremes/TargetBMinimality.lean: for prime \(p\), \(a\ge2\),
  \[
  T_p(p^a+1)=p^{3a}+1.
  \]

### Overlap analysis

The global maximum theorem is directly reusable predecessor mathematics once \(p\nmid C_d(p^a)\), \(m\ge2\), and the exact threshold are established. It does **not** determine the least multiplier for the cofactor family and does not state Target B.

The predecessor least-row theorem is structurally adjacent to Target C because
\[
(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1.
\]
It proves that the sparse row \(p^{3a}+1\) is least extremal for the first factor \(p^a+1\), not for the complementary factor \(p^{2a}-p^a+1\). Thus it is prior work that must be cited in any Target-C argument, but it is not an equivalent statement.

Classification: **verified strict overlap in infrastructure/global maximum; verified non-equivalence to Targets A/B and the cofactor side of C**.

## 3. McTague

Carl McTague, *On the Greatest Common Divisor of Binomial Coefficients C(n,q), C(n,2q), C(n,3q), ...*, American Mathematical Monthly **124**(4) (2017), 353--356, DOI 10.4169/amer.math.monthly.124.4.353. Corrected preprint: **arXiv:1510.06696v5, 25 July 2018**.

Exact locations checked against the primary source and the pinned predecessor source audit:

- **Theorem Q, page 1**: for \(n>q>0\) and prime \(p\equiv1\pmod q\),
  \[
  v_p\!\left(\gcd_{0<k<n/q}\binom n{qk}\right)
  =
  \begin{cases}
  1,&\alpha_p(n)\le q,\\
  0,&\text{otherwise}.
  \end{cases}
  \]
- **first remark, page 2, corrected v5**: a same-residue weakening requiring, in the form relevant here, \(p>q\), \(\gcd(p,q)=1\), and all powers in a minimal power-sum expansion having the same residue modulo \(q\).
- **page 2 example**:
  \[
  v_2\!\left(\gcd_{0<k<2}\binom6{3k}\right)=2.
  \]

McTague studies exactly the same fixed-row arithmetic-progression GCD after \(n=N\), \(q=m\).

### Comparison with A/B/C

For the cofactor targets, the valuation prime \(p\) is smaller than \(m=C_d(p^a)\) outside the tiny cubic edge. Hence \(p\equiv1\pmod m\) cannot apply, and the corrected same-residue weakening's \(p>m\) hypothesis also fails. These results therefore do not imply Target A or Target B, nor the general Target C classification.

There is, however, a **direct prior-work overlap at Target C's \((p,a)=(2,1)\) edge**:
\[
m=C_3(2)=3,\qquad N=6.
\]
McTague explicitly records the valuation-2 row. Any eventual Target-C theorem must attribute this isolated instance rather than presenting the phenomenon as new.

Classification: **verified non-equivalence for A/B/general C; verified direct overlap for the \((2,1,3)\) Target-C instance**.

## 4. Pascal Minus One

Pinned source:

jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5.

Relevant theorem: PascalMinusOne.minus_one_valuation in PascalMinusOne/MinusOne.lean, for \(m\ge3\), \(m\mid N\), \(m<N\), prime \(p\), and \(p\bmod m=m-1\).

The pinned notes/literature.md and notes/novelty-audit-2026-09.md record the same McTague \(m=3,p=2,N=6\) exception and the exact corrected-v5 boundary.

The public paper is John Fairfax-Ball, *Restricted Binomial GCDs at Primes Congruent to -1*, **arXiv:2609.37754v1 [math.NT], submitted 29 September 2026**.

For the new cofactor family, \(p\equiv-1\pmod m\) occurs at the cubic edge \(p=2,a=1,m=3\); the predecessor theorem does not supply the general odd-cofactor targets. It nevertheless makes that edge same-author prior mathematics in addition to McTague's earlier example.

Classification: **verified strict special-case overlap only**.

## 5. Wu 2026

Chai Wah Wu, *Computing the Greatest Common Divisor of Binomial Coefficients C(mn,mk)*, **arXiv:2606.20940v2 [math.NT]**, first submitted 18 June 2026, v2 revised 4 August 2026.

Page/section locations:

- definition on page 1 / Section 1:
  \[
  g(m,n)=\gcd\left\{\binom{mn}{mk}:1\le k<n\right\};
  \]
- **Theorem 1, page 2**: when \(m=p^t\), \(v_p(g(m,n))=1\) if \(n\) is a power of \(p\), and \(0\) otherwise;
- **Theorem 2, page 2**: an explicit product formula under the hypotheses that \(m=p^t\) and every relevant non-\(p\) prime is congruent to \(1\pmod m\).

### Equivalence and comparison

With Wu's second argument renamed \(q\),
\[
g(m,q)=G(mq;m)
\]
exactly. This is a direct prior-art match for the **object**, not for the new theorem statements.

Wu's main theorems assume a prime-power restriction modulus \(m\) at the valuation prime or strong \(1\bmod m\) conditions. The cofactor modulus \(C_d(p^a)\) is coprime to the target prime \(p\) and is not under Wu's prime-power-modulus hypothesis. No least-extremal multiplier theorem, cofactor specialization, or selected-coefficient maximum equivalent to A/B/C was located in v2.

Classification: **verified same object; verified non-equivalent theorem hypotheses/statements**.

## 6. Chung--Yang--Zhou 2025

Chan-Liang Chung, Tse-Chung Yang, Kanglun Zhou, *The Greatest Common Divisor of Sets of Binomial Coefficients with Restrictions*, Contemporary Mathematics **6**(1) (2025), 971--985, DOI 10.37256/cm.6120255017. Received 23 May 2024, revised 12 August 2024, accepted 15 August 2024, published 10 February 2025.

Accessible theorem-level text inspected:

- page 973 definitions:
  \[
  A_d(n)=\left\{\binom nk:1\le k\le n-1,\ \gcd(n,k)=d\right\},
  \]
  together with a central-band variant;
- **Theorem 4, page 973**, concerning \(\nu_p(\gcd A_2(n))\) for a sparse four-term \(p\)-power shape;
- **Theorem 5, page 973**, concerning \(\nu_p(\gcd A_2(n))\) for an alternating/geometric \(p\)-power sum with even length;
- **Proposition 1, page 974**, an even-\(n\) result when \(n-1\) is an odd-prime power;
- open questions summarized on page 984.

### Comparison

Their selector is \(\gcd(n,k)=d\), not “\(m\mid k\)” for a fixed external modulus \(m\). Their sparse \(p\)-power upper-row shapes make the paper genuinely adjacent, but neither Theorem 4 nor Theorem 5 is equivalent to Targets A/B/C after the selector is translated. Their results cannot be substituted for the fixed-multiple restricted GCD.

Classification: **verified adjacent but different selector; no equivalent A/B/C theorem located in the inspected text**.

## 7. Chiu--Yuan--Zhou 2023

Sunben Chiu, Pingzhi Yuan, Tao Zhou, *On the Greatest Common Divisor of Binomial Coefficients*, Bulletin of the Korean Mathematical Society **60**(4) (2023), 863--872, DOI 10.4134/BKMS.b220166.

The accessible abstract states a central-band result for composite \(n\), a prime \(p\mid n\), and indices with \(\gcd(n,k)>1\), with a valuation criterion in terms of the leading base-\(p\) representation \(n=a_m p^m+r\).

### Comparison and access limitation

This is a different selector and has \(p\mid n\) built into the visible setup, whereas the project fixes a step modulus and asks for all multiples of it. During this Stage-2 audit an authoritative exact theorem-number/page pinpoint inside the article was not recovered from an openly inspectable full source.

Classification: **probable non-overlap by the accessible statement, but exact theorem-level comparison remains partially unresolved because full text/theorem numbering was not inspected**.

## 8. Chung--Yang 2026

Chan-Liang Chung, Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, Mediterranean Journal of Mathematics **23**, article 209 (2026), DOI 10.1007/s00009-026-03202-3.

Publisher version history:

- received 6 April 2026;
- revised 21 August 2026;
- accepted 8 September 2026;
- version of record published 27 September 2026.

The publisher abstract describes:

- a full-range GCD over non-coprime indices;
- a complete characterization for even upper index \(n\), with values \(2,p,2p,1\) in certain power-of-two / \(p^t+1\) shapes;
- central-band variants and further \(p\)-adic criteria.

### Comparison and unresolved status

The visible selector is “indices non-coprime to the upper index”, not the project's fixed multiples of \(m\). That strongly suggests a different object. However, this source is only days old at the audit cutoff, and its full theorem text was subscription-inaccessible in the available source path. Therefore no theorem-level non-overlap claim is made.

Classification: **UNRESOLVED comparison**. The accessible metadata/abstract does not display an A/B/C equivalent, but the inaccessible full text must be revisited in Stage 4 or earlier if access becomes available.

## 9. Siao Hong 2016

Siao Hong, *The greatest common divisor of certain binomial coefficients*, Comptes Rendus Mathématique **354**(8) (2016), 756--761, DOI 10.1016/j.crma.2016.06.001. Received 15 March 2016, accepted 8 June 2016, online 12 July 2016.

The main result concerns a set of coefficients selected by a coprimality condition on the lower index and gives an explicit product formula of the form
\[
\gcd\left\{\binom{mn}{k}:\gcd(k,m)=1\right\}
=
m\prod_{p\mid\gcd(m,n)}p^{v_p(n)}
\]
under the source's notation/hypotheses.

### Comparison

Coprime lower indices are complementary in flavor to the present “lower index divisible by \(m\)” selector. No least multiplier, alternating-cofactor specialization, or Target-B maximum is present in the located result.

Classification: **verified different selector/non-equivalent result**.

## 10. Guo--Qiu--Cao--Feng--Gao 2026

Dakai Guo, Ruichen Qiu, Yichuan Cao, Ruyong Feng, Xiao-Shan Gao, *A Greatest Common Divisor Criterion of Certain Binomial Coefficients*, **arXiv:2606.22997v1**, submitted 22 June 2026.

**Theorem 1, page 2** defines/characterizes
\[
D(k)=\gcd_{2\le q\le k+1}\binom{qk}{k}
\]
via the largest exact prime-power component of \(k+1\). Section 3 contains a Lean formalization of that different criterion.

### Comparison

This source is especially important for keeping operations distinct:

- Target B studies the **maximum**
  \[
  \max_q v_p\binom{qm}{m};
  \]
- Guo et al. take a **GCD over \(q\)**, whose \(p\)-adic valuation is the **minimum** of those coefficient valuations.

It is neither the per-row restricted GCD \(G(mq;m)\) nor the Target-B maximum. No equivalent A/B/C statement follows by changing notation.

Classification: **verified adjacent but mathematically different aggregation**.

## 11. Kummer

E. E. Kummer, *Über die Ergänzungssätze zu den allgemeinen Reciprocitätsgesetzen*, Journal für die reine und angewandte Mathematik **44** (1852), 93--146, DOI 10.1515/crll.1852.44.93.

The classical theorem used here is:
\[
v_p\binom nk
\]
equals the number of carries when adding \(k\) and \(n-k\) in base \(p\), equivalently the number of borrows in base-\(p\) subtraction of \(k\) from \(n\).

This is a known tool, not prior art for the specific A/B/C conclusions. The Stage-2 Kummer implementation is independently cross-checked against Legendre's factorial valuation formula.

Classification: **classical method/infrastructure; no target-level overlap**.

## 12. Other relevant 2026 literature and same-year checks

The search also screened:

- recent work mentioning restricted binomial GCDs and Kummer/carry methods;
- cyclotomic-polynomial/coefficient papers returned by the \(\Phi_6\), alternating-quotient and \((x^d+1)/(x+1)\) queries;
- same-author public predecessor arXiv material through 1 October 2026.

False positives concerning coefficients of cyclotomic polynomials, rather than GCDs/valuations of binomial coefficients, were not treated as target overlap.

No additional 2026 source displaying an exact least multiplier \(Q+1\), the coefficient maximum \(a(d+1)/2\), the experimentally suggested restricted-GCD maximum \(a(d-1)/2+1\), or the full cubic classification was located in the documented search. This is **negative search evidence only**.

## 13. Meaningful search formulations used

The Stage-2 search used author/title queries plus the following formulation families, with punctuation/notation variants:

- "least multiplier" "binomial coefficients" gcd Kummer
- "least extremal row" binomial gcd
- "least row" restricted binomial gcd
- "p^{ad}+1" binomial gcd Kummer
- "p^{2a}-p^a+1" binomial coefficient gcd
- "Phi_6" binomial gcd p-adic
- "(x^d+1)/(x+1)" binomial gcd
- "alternating quotient" binomial gcd cyclotomic
- cyclotomic "greatest common divisor" binomial coefficients Kummer
- "complementary factor" binomial gcd p-adic
- "restricted binomial" gcd 2026 Kummer
- "greatest common divisor" binomial coefficients 2026 restrictions Kummer
- "least" "g(m,n)" binomial coefficients Wu McTague
- exact searches for C(mn,mk), C(n,qk), \(G(N;m)\), and arithmetic-progression lower indices
- author combinations: McTague; Wu; Chung Yang; Chung Yang Zhou; Chiu Yuan Zhou; Siao Hong; Guo Qiu Cao Feng Gao
- forward/backward citation and title searches around those sources

Searches were also run for reciprocal/complementary formulations of
\[
(Q+1)C_d(Q)=Q^d+1
\]
rather than only for the notation \(C_d\).

## 14. Audit matrix

| Source | Same object/selector? | Target A | Target B | Target C | Stage-2 disposition |
| --- | --- | --- | --- | --- | --- |
| Pascal Extremes pin | same \(G\); global maximum | does not determine least cofactor row | no selected-coefficient maximum | complementary-factor predecessor | verified strict prior overlap, not equivalent |
| McTague v5 | same fixed-multiple \(G\) | hypotheses fail | no | direct \((2,1)\) edge example | verified boundary |
| Pascal Minus One pin / arXiv:2609.37754v1 | same \(G\), minus-one primes | no general overlap | no | \((2,1)\) edge covered | verified special-case prior work |
| Wu v2 | exactly same \(G(mq;m)\) | no under stated hypotheses | no | no | same object, different theorem |
| Chung--Yang--Zhou 2025 | \(\gcd(n,k)=d\) selector | no equivalent located | no | no equivalent located | verified adjacent/different selector |
| Chiu--Yuan--Zhou 2023 | non-coprime/central-band selector | no equivalent visible | no | no equivalent visible | partially unresolved full-text pinpoint |
| Chung--Yang 2026 | non-coprime selector | unknown full theorem text | unknown | unknown | **unresolved inaccessible recent source** |
| Siao Hong 2016 | coprime-index selector | no | no | no | verified different selector |
| Guo et al. 2026 | GCD across row multipliers | no | min-over-\(q\), not max | no | verified different aggregation |
| Kummer 1852 | valuation tool | method only | method only | method only | classical tool |

## 15. Stage-2 literature conclusion

The audit confirms substantial prior art around the exact restricted-GCD object, especially McTague, Wu, and the same-author predecessors. It also identifies a direct prior-work carveout for the cubic \((p,a)=(2,1)\) instance.

For the exact cofactor statements A/B/C, **no mathematically equivalent theorem was located in the documented search**. That statement is not a novelty proof. The recent Chung--Yang 2026 full text remains a concrete unresolved comparison, and Stage 4 must perform a deeper final-statement audit after the Stage-3 theorem statements are fixed.

No literature finding in this initial audit requires abandoning Targets A/B/C before proof development, provided predecessor attribution and the \((2,1)\) Target-C carveout are retained.
