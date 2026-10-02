# Session 03 handoff — Stage 3 rigorous informal proof

Date: **2026-10-02**

## Completed in this session

Stage 3 only was completed. No Stage-4 literature work, Lean development, Palomar work, paper drafting, or arXiv work was started.

Predecessor pins remain exactly:

- jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5
- jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94

The durable proof is notes/stage3-proof.md.

## Main proof mechanism

Let
\[
Q=p^a,\qquad d=2s+1,\qquad
m=C_d(Q)=\frac{Q^d+1}{Q+1}.
\]

The proof first establishes the corrected threshold:
\[
p^{a(d-1)-1}<m<p^{a(d-1)},\qquad p\nmid m,
\]
hence
\[
r_p(m)=a(d-1)=2as.
\]

The key new identity is the exact digit-sum shift
\[
s_p(mt)=s_p(t)+as(p-1)
\qquad(1\le t\le Q).
\]
It comes from the positive block expansion
\[
m=1+(Q-1)(Q+Q^3+\cdots+Q^{d-2})
\]
and a base-\(Q=p^a\) normal form for \(mt\).

Using the Legendre/Kummer digit-sum formula gives the stronger exact finite-window scaling law
\[
\boxed{
v_p\binom{mq}{mj}
=
as+v_p\binom qj
}
\qquad
(2\le q\le Q,\ 1\le j<q).
\]

This single identity proves both stronger Stage-2 observations.

## Target B and stronger coefficient statement

Taking \(j=1\),
\[
v_p\binom{mq}{m}=as+v_p(q).
\]
Therefore
\[
\max_{2\le q\le Q}v_p\binom{mq}{m}
=
as+a
=
\frac{a(d+1)}2,
\]
and the argmax is uniquely
\[
q=Q=p^a.
\]

Thus Target B is proved informally, and the unique-argmax observation is also proved.

## Exact restricted-GCD formula

For ordinary row \(q\),
\[
\min_{1\le j<q}v_p\binom qj
=
\begin{cases}
1,&q\text{ is a power of }p,\\
0,&\text{otherwise}.
\end{cases}
\]
This is proved directly by Kummer:

- if \(q=p^b\), every interior coefficient has at least one carry, and \(j=p^{b-1}\) gives exactly one;
- if \(q\) is not a \(p\)-power and \(b=v_p(q)\), the choice \(j=p^b<q\) subtracts with no borrow.

Therefore, for every odd \(d\ge3\) and \(2\le q\le Q\),
\[
v_p(G(mq;m))
=
as+
\begin{cases}
1,&q=p^b,\ 1\le b\le a,\\
0,&\text{otherwise}.
\end{cases}
\]
Hence
\[
\max_{2\le q\le Q}v_p(G(mq;m))
=
\frac{a(d-1)}2+1
\]
with exact argmax set
\[
\{p,p^2,\ldots,p^a\}.
\]

This is stronger than the Stage-2 conjectural maximum because the complete row-by-row formula is now proved informally.

## Sparse endpoint

For
\[
m(Q+1)=Q^d+1=p^{ad}+1,
\]
a separate \(p^L+1\) calculation gives, for \(1\le j\le Q\),
\[
v_p\binom{m(Q+1)}{mj}
=
ad-v_p(j)-v_p(Q+1-j).
\]
Since \(j+(Q+1-j)=Q+1\equiv1\pmod p\), at most one of the two terms has positive \(p\)-valuation, and each is at most \(a\). Equality \(a\) occurs at \(j=1\) and \(j=Q\). Therefore
\[
v_p(G(m(Q+1);m))
=
ad-a
=
a(d-1)
=
r_p(m).
\]

## Target A

For odd \(d\ge5\), \(s\ge2\). Every pre-endpoint multiplier satisfies
\[
v_p(G(mq;m))\le as+1<2as=r_p(m),
\]
while \(q=Q+1\) attains \(r_p(m)\). Thus
\[
\boxed{
T_p(C_d(p^a))=p^{ad}+1.
}
\]

Both endpoint attainment and strict non-attainment for every \(2\le q\le p^a\) are proved.

## Target C

For \(d=3\), \(s=1\) and \(r_p(m)=2a\).

If \(a=1\), the only \(p\)-power multiplier in \(2\le q\le p\) is \(q=p\), so it is the first multiplier with valuation \(2\):
\[
T_p(p^2-p+1)=p(p^2-p+1).
\]

If \(a\ge2\), every \(q\le Q\) has
\[
v_p(G(mq;m))\le a+1<2a,
\]
whereas \(q=Q+1\) attains \(2a\). Hence
\[
T_p(p^{2a}-p^a+1)=p^{3a}+1.
\]

The edge
\[
(p,a)=(2,1),\qquad m=3,\qquad N=6
\]
is retained explicitly as a prior-work valuation phenomenon already recorded by McTague and by the pinned Pascal Minus One predecessor.

## Checked predecessor dependency

The pinned Pascal Extremes global theorem assumes exactly:

- \(p\) prime;
- \(m\ge2\);
- \(p\nmid m\).

Stage 3 proves \(m\ge3\) and \(p\nmid m\), so the theorem applies. It is used only as predecessor mathematics identifying \(r_p(m)\) as the global maximum / established extremal framework. The new endpoint and minimality proofs are direct.

The complementary predecessor
\[
T_p(p^a+1)=p^{3a}+1\qquad(a\ge2)
\]
is not used to infer the cofactor theorem.

## Material proof-route cautions

1. Do not restore the false Stage-1 lower bound \(p^{a(d-1)}<C_d(p^a)\).
2. The selected-coefficient Target B does **not** prove cubic minimality when \(d=3\): its maximum equals the threshold \(2a\). The exact restricted-GCD formula is what separates the \(a\ge2\) cubic pre-endpoint rows.
3. The complementary-factor Pascal Extremes theorem cannot be transferred to the cofactor merely from
   \[
   (p^a+1)(p^{2a}-p^a+1)=p^{3a}+1.
   \]
4. Computation remains regression evidence only; none of the Stage-2 finite checks is a proof step.

## Claim status after Stage 3

**Proved informally:**

- corrected threshold and \(p\nmid m\);
- exact finite-window coefficient scaling;
- Target B;
- unique Target-B argmax \(q=p^a\);
- exact pre-extremal restricted-GCD row formula;
- restricted-GCD maximum and exact argmax set;
- sparse endpoint attainment;
- Target A for odd \(d\ge5\);
- Target C.

**Still unresolved:**

- novelty / historical priority;
- the exact comparison with the inaccessible recent Chung--Yang 2026 full text;
- all formalisation and later workflow stages.

## Ready-to-paste Stage-4 prompt

Continue the Pascal Cofactors project at Stage 4 only in jfairfaxball-348/pascal-cofactors.

First read AGENTS.md, STATUS.md, notes/targets.md, notes/provenance.md, notes/prior-art-audit-2.md, notes/stage3-proof.md, and notes/session-03-handoff.md. Preserve the predecessor pins exactly and treat the repository as authoritative.

Perform a deeper theorem-level prior-art / novelty audit against the exact final Stage-3 proved statements, not the earlier conjectural formulations. In particular search for equivalents or specialisations of the exact finite-window scaling law
\[
v_p\binom{C_d(p^a)q}{C_d(p^a)j}
=
\frac{a(d-1)}2+v_p\binom qj
\]
for \(2\le q\le p^a\), the resulting exact restricted-GCD row formula and argmax set, Target B with unique argmax, Target A for odd \(d\ge5\), and the cubic Target C classification.

Revisit all Stage-2 sources at theorem level, especially McTague, Wu, Chung--Yang--Zhou, Chiu--Yuan--Zhou, Siao Hong, Guo--Qiu--Cao--Feng--Gao, the pinned same-author predecessors, and any relevant literature published or revised through the Stage-4 date. Make a renewed effort to obtain and inspect the full theorem text of Chung--Yang, Mediterranean Journal of Mathematics 23, article 209 (2026), which remained unresolved in Stage 2. Search equivalent formulations using digit sums, Kummer carries, scaling identities, row-GCD formulas, cyclotomic/alternating cofactors, and complementary factors. Do not infer novelty from a negative search.

Do not begin Lean, Palomar, paper, or arXiv work. If prior art changes the mathematical scope, record the exact overlap and revise status rather than forcing a novelty claim. At the end of Stage 4, update STATUS.md, preserve a complete final prior-art audit and handoff, commit all Stage-4 work, and stop before Stage 5.
