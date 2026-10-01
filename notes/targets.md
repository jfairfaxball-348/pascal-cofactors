# Definitions and conjectural targets

Status date: **2026-10-01**.

Everything labelled Target A/B/C below is **conjectural at Stage 1**. This file defines the research questions; it does not prove them.

## 1. Restricted binomial GCD

For integers (m\ge2) and (N>m) with (m\mid N), define
[
G(N;m)=\gcd\left\{\binom Nk:0<k<N, m\mid k\right\}.
]

For a prime (p\nmid m), define
[
r_p(m)=\min\{r\ge1:m<p^r\}.
]

The predecessor project `Pascal-Extremes` proves that this is the global maximum of (v_p(G(N;m))) over admissible rows. That theorem is prior work and is not silently reproved here.

Once existence has been established for the pair ((p,m)), define
[
T_p(m)=\min\left\{N>m:m\mid N, v_p(G(N;m))=r_p(m)\right\}.
]

## 2. Alternating cofactor family

Let (p) be prime, (a\ge1), and
[
Q=p^a.
]

For odd (d\ge3), define
[
C_d(Q)=\frac{Q^d+1}{Q+1}
      =Q^{d-1}-Q^{d-2}+Q^{d-3}-\cdots-Q+1.
]

The exact factorisation
[
(Q+1)C_d(Q)=Q^d+1
]
is elementary.

The kickoff notes observe (C_d(Q)\equiv1\pmod p), so (p\nmid C_d(Q)). The intended threshold is
[
r_p(C_d(p^a))=a(d-1),
]
which would follow from the proposed bounds
[
p^{a(d-1)}<C_d(p^a)<p^{a(d-1)+1}.
]

**Stage-1 status:** the threshold equality and the displayed bounds are not treated as proved here. Stage 2 must test them across edge cases, and Stage 3 must prove every prerequisite used in the final theorem.

## 3. Target A — odd cofactor least-extremal-row theorem

For every prime (p), every (a\ge1), and every odd (d\ge5), conjecture
[
\boxed{T_p(C_d(p^a))=p^{ad}+1.}
]

With (Q=p^a), (m=C_d(Q)), this is equivalent to the assertion that the least multiplier (q\ge2) attaining the extremal valuation is
[
\boxed{q=Q+1},
]
because
[
m(Q+1)=Q^d+1.
]

A complete proof must contain both logically distinct parts:

**Attainment**
[
v_p(G(Q^d+1;C_d(Q)))=a(d-1).
]

**Strict minimality**
[
v_p(G(C_d(Q)q;C_d(Q)))<a(d-1)
qquad(2\le q\le Q).
]

The least-row conclusion is not complete without strict lower-multiplier non-attainment.

## 4. Target B — candidate sharp pre-extremal coefficient bound

For every prime (p), every (a\ge1), and odd (d\ge5), test the conjecture
[
\boxed{
\max_{2\le q\le p^a}
v_p\binom{C_d(p^a)q}{C_d(p^a)}
=\frac{a(d+1)}2.
}
]

This concerns **one selected coefficient** (k=C_d(p^a)) in each row. It must not be conflated with the restricted GCD valuation.

Separately determine the exact value, if any, of
[
\max_{2\le q\le p^a}
v_p(G(C_d(p^a)q;C_d(p^a))).
]

If the displayed sharp formula is false, Stage 2 or Stage 3 should replace it with the correct statement rather than force the conjecture.

For odd (d\ge5),
[
\frac{a(d+1)}2<a(d-1),
]
so a valid uniform pre-extremal upper bound of this strength would imply strict non-attainment for Target A.

## 5. Target C — cubic boundary classification

For
[
C_3(Q)=Q^2-Q+1=\Phi_6(Q),
]
determine exactly
[
T_p(p^{2a}-p^a+1).
]

The kickoff conjecture is
[
T_p(p^{2a}-p^a+1)=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
]

This must be tested independently before proof development.

The boundary is structurally significant because the Target-B candidate value becomes
[
\frac{a(3+1)}2=2a=a(3-1),
]
so it no longer separates pre-extremal rows from the proposed extremal valuation.

## 6. Exact predecessor relationship

`Pascal-Extremes` proves, for every prime (p) and (a\ge2),
[
T_p(p^a+1)=p^{3a}+1.
]

Since
[
(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1,
]
Target C for (a\ge2) asks for the reciprocal-looking complementary factor:
[
T_p(p^{2a}-p^a+1)=p^{3a}+1.
]

Thus the same sparse row would be least extremal for both complementary factors if Target C survives. This relationship is a research question, not a novelty claim.

## 7. Naming conventions

- (p): prime.
- (a\ge1): prime-power exponent.
- (Q=p^a): block base.
- odd (d\ge3): cofactor degree parameter.
- (m=C_d(Q)): restriction modulus.
- (q\ge2): row multiplier, so (N=mq).
- (G(N;m)): restricted row GCD.
- (r_p(m)): extremal valuation threshold from the predecessor theorem.
- (T_p(m)): least extremal row, used only after existence is justified.
- “coefficient bound” means a statement about (v_p\binom{mq}{m}).
- “GCD bound” means a statement about (v_p(G(mq;m))).

Keep these two valuation objects distinct in code, notes, and theorem names.
