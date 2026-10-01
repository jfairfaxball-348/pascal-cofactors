# Definitions and conjectural targets

Status date: **2026-10-01**.

Targets A/B/C remain **conjectural after Stage 2**. Stage-2 computation gives finite evidence only; no infinite theorem is proved here.

## 1. Restricted binomial GCD

For integers (mge2) and (N>m) with (mmid N), define
[
G(N;m)=gcdleft{inom Nk:0<k<N, mmid kight}.
]

For a prime (p
mid m), define
[
r_p(m)=min{rge1:m<p^r}.
]

The predecessor project `Pascal-Extremes` proves that this is the global maximum of (v_p(G(N;m))) over admissible rows. That theorem is prior work and is not silently reproved here.

Once existence has been established for the pair ((p,m)), define
[
T_p(m)=minleft{N>m:mmid N, v_p(G(N;m))=r_p(m)ight}.
]

## 2. Alternating cofactor family and corrected threshold prerequisite

Let (p) be prime, (age1), and
[
Q=p^a.
]

For odd (dge3), define
[
C_d(Q)=rac{Q^d+1}{Q+1}
      =Q^{d-1}-Q^{d-2}+Q^{d-3}-cdots-Q+1.
]

The exact factorisation
[
(Q+1)C_d(Q)=Q^d+1
]
is elementary, and (C_d(Q)equiv1pmod p), so (p
mid C_d(Q)).

The intended threshold is
[
r_p(C_d(p^a))=a(d-1).
]

### Stage-2 correction to the Stage-1 displayed bounds

Stage 1 recorded, but did not prove, the proposed inequalities
[
p^{a(d-1)}<C_d(p^a)<p^{a(d-1)+1}.
]
The **lower inequality is false**. It was false in every one of the 168 Stage-2 parameter cases, and it is also directionally incompatible with the alternating expansion whose leading term is (Q^{d-1}).

The corrected prerequisite to prove in Stage 3 is
[
oxed{
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}.
}
]
These corrected inequalities held in all 168 Stage-2 parameter cases and imply
[
r_p(C_d(p^a))=a(d-1).
]

This edit does not erase the Stage-1 provenance error: the original formulation remains in Git history and in the Stage-1 handoff. The corrected bounds are **experimentally checked, not proved**.

## 3. Target A — odd cofactor least-extremal-row theorem

For every prime (p), every (age1), and every odd (dge5), conjecture
[
oxed{T_p(C_d(p^a))=p^{ad}+1.}
]

With (Q=p^a), (m=C_d(Q)), this is equivalent to the assertion that the least multiplier (qge2) attaining the extremal valuation is
[
oxed{q=Q+1},
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
qquad(2le qle Q).
]

Stage 2 checked both finite analogues with zero failures in 144 cases ((din{5,7,9,11,13,15}) on the recorded grid). The least-row conclusion is not complete without strict lower-multiplier non-attainment.

## 4. Target B — sharp pre-extremal selected-coefficient bound

For every prime (p), every (age1), and odd (dge5), conjecture
[
oxed{
max_{2le qle p^a}
v_pinom{C_d(p^a)q}{C_d(p^a)}
=rac{a(d+1)}2.
}
]

This concerns **one selected coefficient** (k=C_d(p^a)) in each row. It must not be conflated with the restricted GCD valuation.

Stage 2 found zero failures in 144 cases and, more strongly, observed that the maximum was attained **uniquely at (q=Q=p^a)** throughout the grid. That uniqueness is an experimental pattern, not yet part of the required theorem unless Stage 3 can prove it cleanly.

For odd (dge5),
[
rac{a(d+1)}2<a(d-1),
]
so a valid uniform pre-extremal upper bound of this strength would imply strict non-attainment for Target A.

## 5. Restricted-GCD pre-extremal candidate

Stage 2 separately investigated
[
max_{2le qle p^a}
v_p(G(C_d(p^a)q;C_d(p^a))).
]

The new conjectural candidate, observed with zero failures in all 168 Stage-2 cases including (d=3), is
[
oxed{
max_{2le qle p^a}
v_p(G(C_d(p^a)q;C_d(p^a)))
=
rac{a(d-1)}2+1.
}
]

The observed argmax set was exactly
[
oxed{qin{p,p^2,ldots,p^a}.}
]

Both formulas are **conjectural experimental patterns**. Stage 3 should determine whether they admit a rigorous proof worth including, or whether only the weaker bound needed for Target A should be retained.

## 6. Target C — cubic boundary classification

For
[
C_3(Q)=Q^2-Q+1=Phi_6(Q),
]
determine exactly
[
T_p(p^{2a}-p^a+1).
]

The conjecture is
[
T_p(p^{2a}-p^a+1)=
egin{cases}
p(p^2-p+1),&a=1,\
p^{3a}+1,&age2.
end{cases}
]

Stage 2 checked this with zero failures across all 24 ((p,a)) pairs in the recorded grid.

The boundary is structurally significant because the Target-B candidate value becomes
[
rac{a(3+1)}2=2a=a(3-1),
]
so the selected coefficient no longer separates pre-extremal rows from the proposed extremal valuation.

### Prior-work carveout

For ((p,a)=(2,1)),
[
m=3,qquad T	ext{-candidate row }N=6.
]
McTague's corrected v5 preprint explicitly records
[
v_2!left(gcd_{0<k<2}inom6{3k}ight)=2,
]
and the pinned `pascal-minus-one` predecessor also covers the corresponding (p=m-1) valuation regime. Thus the (m=3,p=2,N=6) valuation phenomenon is prior work and must be attributed as such. The family-level Target C classification remains conjectural.

## 7. Exact predecessor relationship

`Pascal-Extremes` proves, for every prime (p) and (age2),
[
T_p(p^a+1)=p^{3a}+1.
]

Since
[
(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1,
]
Target C for (age2) asks for the reciprocal-looking complementary factor:
[
T_p(p^{2a}-p^a+1)=p^{3a}+1.
]

Thus the same sparse row would be least extremal for both complementary factors if Target C survives. This relationship is a research question, not a novelty claim.

## 8. Naming conventions

- (p): prime.
- (age1): prime-power exponent.
- (Q=p^a): block base.
- odd (dge3): cofactor degree parameter.
- (m=C_d(Q)): restriction modulus.
- (qge2): row multiplier, so (N=mq).
- (G(N;m)): restricted row GCD.
- (r_p(m)): extremal valuation threshold from the predecessor theorem.
- (T_p(m)): least extremal row, used only after existence is justified.
- “coefficient bound” means a statement about (v_pinom{mq}{m}).
- “GCD bound” means a statement about (v_p(G(mq;m))).

Keep these two valuation objects distinct in code, notes, and theorem names.
