# Stage 3 rigorous informal proof

Date: **2026-10-02**.

Status: **rigorous informal proof complete** for the Stage-2-surviving statements. No Stage-4 literature work, Lean formalisation, Palomar work, paper drafting, or arXiv work is contained here.

Predecessor pins are preserved exactly:

- jfairfaxball-348/pascal-minus-one@5c0363d43044be94430dff489bd5c64cd153b8d5
- jfairfaxball-348/Pascal-Extremes@f3a4335d17e333128b9ec16f8b0b139396e5bd94

The Pascal Extremes global maximum theorem is predecessor mathematics. At its pinned commit it assumes that \(p\) is prime, \(m\ge2\), and \(p\nmid m\), and proves that
\[
\max_{N>m,\ m\mid N} v_p(G(N;m))=r_p(m),
\qquad
r_p(m)=\min\{r\ge1:m<p^r\},
\]
with constructive non-emptiness before the least extremal row is defined. Those hypotheses are checked below for the present cofactor family. The present proof does not reprove that global theorem.

## 1. Notation

Let \(p\) be prime, \(a\ge1\), and
\[
Q=p^a.
\]
Let \(d=2s+1\) be odd with \(s\ge1\), and put
\[
m=C_d(Q)=\frac{Q^d+1}{Q+1}.
\]
Thus
\[
(Q+1)m=Q^d+1
\]
and
\[
m=Q^{2s}-Q^{2s-1}+\cdots-Q+1.
\]

For an integer \(n\ge0\), let \(s_p(n)\) denote the sum of the base-\(p\) digits of \(n\).

We use the classical digit-sum form of Legendre/Kummer:
\[
v_p\binom nk
=
\frac{s_p(k)+s_p(n-k)-s_p(n)}{p-1}
\qquad(0\le k\le n).
\]
We also use Kummer's equivalent carry/borrow interpretation.

## 2. Corrected threshold prerequisite

### Lemma 2.1 — positive block expansion

For \(d=2s+1\),
\[
m
=
1+(Q-1)\sum_{i=0}^{s-1}Q^{2i+1}.
\]

**Proof.**
For each \(i\),
\[
(Q-1)Q^{2i+1}=Q^{2i+2}-Q^{2i+1}.
\]
Summing these pairs and adding \(1\) gives
\[
Q^{2s}-Q^{2s-1}+\cdots+Q^2-Q+1=m.
\]
\(\square\)

This immediately gives \(m>0\).

### Lemma 2.2 — \(p\nmid m\)

\[
m\equiv1\pmod p.
\]

**Proof.**
Since \(Q=p^a\equiv0\pmod p\), every term of the alternating expansion except the final \(1\) vanishes modulo \(p\). Hence \(m\equiv1\pmod p\). \(\square\)

### Lemma 2.3 — corrected two-sided bounds

For every odd \(d\ge3\),
\[
\boxed{
p^{a(d-1)-1}<m<p^{a(d-1)}.
}
\]

**Proof of the lower bound.**
By Lemma 2.1 the highest positive block is \((Q-1)Q^{d-2}\), and there are additional positive terms, so
\[
m>(Q-1)Q^{d-2}.
\]
Because \(p\ge2\) and \(a\ge1\),
\[
Q-1=p^a-1\ge p^{a-1},
\]
since
\[
p^a-1-p^{a-1}=p^{a-1}(p-1)-1\ge0.
\]
Therefore
\[
m>(Q-1)Q^{d-2}
\ge p^{a-1}p^{a(d-2)}
=p^{a(d-1)-1}.
\]

**Proof of the upper bound.**
Using \((Q+1)m=Q^d+1\), it is enough to compare
\[
Q^d+1
\quad\text{with}\quad
(Q+1)Q^{d-1}=Q^d+Q^{d-1}.
\]
Since \(Q\ge2\) and \(d\ge3\), \(Q^{d-1}>1\). Thus
\[
Q^d+1<Q^d+Q^{d-1},
\]
and division by \(Q+1>0\) gives
\[
m<Q^{d-1}=p^{a(d-1)}.
\]
\(\square\)

The false Stage-1 inequality \(p^{a(d-1)}<m\) is not used.

### Corollary 2.4 — exact threshold

Let
\[
R=a(d-1)=2as.
\]
Then
\[
\boxed{r_p(m)=R.}
\]

**Proof.**
Lemma 2.3 gives
\[
p^{R-1}<m<p^R.
\]
Thus \(R\) satisfies \(m<p^R\), while every \(r<R\) has
\[
p^r\le p^{R-1}<m.
\]
So \(R\) is the least admissible exponent. \(\square\)

In particular \(R\ge2\), so Lemma 2.3 also gives \(m>p^{R-1}\ge2\), hence \(m\ge3\). Together with Lemma 2.2, the exact Pascal Extremes hypotheses \(p\) prime, \(m\ge2\), \(p\nmid m\) are satisfied.

## 3. The finite-window digit-sum identity

The decisive Stage-3 observation is an exact digit-sum formula for multiplying \(m\) by any \(t\) in the complete window \(1\le t\le Q\).

### Lemma 3.1 — block complement identity

If \(0\le u<Q=p^a\), then
\[
s_p((Q-1)-u)=a(p-1)-s_p(u).
\]

**Proof.**
The number \(Q-1\) has exactly \(a\) base-\(p\) digits, all equal to \(p-1\). Subtracting \(u<Q\) from \(Q-1\) is digitwise complement with no borrow, so each digit \(u_i\) is replaced by \(p-1-u_i\). Summing the digits gives the formula. \(\square\)

### Lemma 3.2 — exact digit-sum shift

For every integer \(t\) with \(1\le t\le Q\),
\[
\boxed{
s_p(mt)=s_p(t)+as(p-1).
}
\]

**Proof for \(1\le t<Q\).**
Starting from Lemma 2.1 and normalising in base \(Q\),
\[
mt
=
t
+\sum_{i=0}^{s-1}(Q-t)Q^{2i+1}
+\sum_{i=1}^{s}(t-1)Q^{2i}.
\]
Indeed, for each \(i\),
\[
(Q-t)Q^{2i+1}+(t-1)Q^{2i+2}
=t(Q-1)Q^{2i+1},
\]
and summing recovers \(tm\).

All displayed base-\(Q\) digits lie in \(\{0,\ldots,Q-1\}\). Because \(Q=p^a\), distinct base-\(Q\) digits occupy disjoint blocks of \(a\) base-\(p\) digits. Hence
\[
s_p(mt)
=
s_p(t)
+s\bigl(s_p(Q-t)+s_p(t-1)\bigr).
\]
Now
\[
Q-t=(Q-1)-(t-1),
\]
so Lemma 3.1 gives
\[
s_p(Q-t)+s_p(t-1)=a(p-1).
\]
Therefore
\[
s_p(mt)=s_p(t)+as(p-1).
\]

**Proof for \(t=Q\).**
Multiplying the positive block expansion of \(m\) by \(Q\) gives
\[
Qm
=
Q+(Q-1)(Q^2+Q^4+\cdots+Q^{2s}).
\]
Thus its base-\(p\) digit sum is
\[
1+s\,a(p-1).
\]
Since \(s_p(Q)=1\), the same formula follows. \(\square\)

## 4. Exact pre-extremal coefficient scaling

### Theorem 4.1 — finite-window scaling law

For
\[
2\le q\le Q,\qquad 1\le j<q,
\]
one has
\[
\boxed{
v_p\binom{mq}{mj}
=
as+v_p\binom qj.
}
\]

**Proof.**
Since \(j\), \(q-j\), and \(q\) all lie in \([1,Q]\), Lemma 3.2 applies to all three. Using the digit-sum valuation formula,
\[
\begin{aligned}
v_p\binom{mq}{mj}
&=
\frac{s_p(mj)+s_p(m(q-j))-s_p(mq)}{p-1}\\
&=
\frac{
(s_p(j)+as(p-1))
+(s_p(q-j)+as(p-1))
-(s_p(q)+as(p-1))
}{p-1}\\
&=
as+
\frac{s_p(j)+s_p(q-j)-s_p(q)}{p-1}\\
&=
as+v_p\binom qj.
\end{aligned}
\]
\(\square\)

This theorem is about individual coefficients. The GCD consequences below are taken only after minimising over \(j\).

### Corollary 4.2 — exact selected coefficient formula

For \(2\le q\le Q\),
\[
\boxed{
v_p\binom{mq}{m}=as+v_p(q).
}
\]

**Proof.**
Set \(j=1\) in Theorem 4.1 and use \(\binom q1=q\). \(\square\)

### Corollary 4.3 — Target B and unique argmax

For odd \(d\ge5\) (indeed, for every odd \(d\ge3\)),
\[
\boxed{
\max_{2\le q\le Q}
v_p\binom{mq}{m}
=
a(s+1)
=
\frac{a(d+1)}2.
}
\]
Moreover the maximum is attained **uniquely** at
\[
\boxed{q=Q=p^a.}
\]

**Proof.**
By Corollary 4.2,
\[
v_p\binom{mq}{m}=as+v_p(q).
\]
For \(1\le q\le p^a\), \(v_p(q)\le a\), with equality if and only if \(p^a\mid q\). Since \(0<q\le p^a\), equality occurs exactly when \(q=p^a\). Thus the maximum is
\[
as+a=a(s+1)=\frac{a(d+1)}2.
\]
\(\square\)

This proves the stronger Stage-2 unique-argmax observation.

## 5. Exact pre-extremal restricted-GCD formula

For \(q\ge2\), define
\[
\mu_p(q)=\min_{1\le j<q}v_p\binom qj.
\]

### Lemma 5.1 — interior row minimum

For \(q\ge2\),
\[
\boxed{
\mu_p(q)=
\begin{cases}
1,&q=p^b\text{ for some }b\ge1,\\
0,&q\text{ is not a power of }p.
\end{cases}
}
\]

**Proof when \(q=p^b\).**
The base-\(p\) expansion of \(q\) is \(1\) followed by \(b\) zeros. For every \(1\le j<q\), subtracting \(j\) from \(q\) requires at least one borrow, so Kummer gives
\[
v_p\binom qj\ge1.
\]
For the witness \(j=p^{b-1}\),
\[
q-j=(p-1)p^{b-1},
\]
and adding \(j\) and \(q-j\) produces exactly one carry, at the \(p^{b-1}\) place. Hence
\[
v_p\binom{p^b}{p^{b-1}}=1.
\]
So \(\mu_p(q)=1\).

**Proof when \(q\) is not a power of \(p\).**
Let \(b=v_p(q)\). The base-\(p\) digit of \(q\) at position \(b\) is nonzero, and because \(q\ne p^b\), we have \(p^b<q\). Take \(j=p^b\). Subtracting \(j\) from \(q\) requires no borrow, because the digit at position \(b\) is already positive. Kummer therefore gives
\[
v_p\binom q{p^b}=0.
\]
Thus \(\mu_p(q)=0\). \(\square\)

### Theorem 5.2 — exact pre-extremal GCD valuation

For every odd \(d\ge3\) and every \(2\le q\le Q\),
\[
\boxed{
v_p(G(mq;m))
=
as+
\begin{cases}
1,&q=p^b\text{ for some }1\le b\le a,\\
0,&\text{otherwise}.
\end{cases}
}
\]

**Proof.**
The multiples of \(m\) strictly between \(0\) and \(mq\) are exactly
\[
m,2m,\ldots,(q-1)m.
\]
Therefore
\[
v_p(G(mq;m))
=
\min_{1\le j<q}v_p\binom{mq}{mj}.
\]
Theorem 4.1 gives
\[
v_p(G(mq;m))
=
as+\min_{1\le j<q}v_p\binom qj
=
as+\mu_p(q).
\]
Apply Lemma 5.1. Since \(q\le Q=p^a\), the \(p\)-powers in the interval are exactly
\[
p,p^2,\ldots,p^a.
\]
\(\square\)

### Corollary 5.3 — stronger Stage-2 GCD maximum and argmax

For every odd \(d\ge3\),
\[
\boxed{
\max_{2\le q\le Q}v_p(G(mq;m))
=
as+1
=
\frac{a(d-1)}2+1.
}
\]
The complete argmax set is
\[
\boxed{
\{p,p^2,\ldots,p^a\}.
}
\]

This proves the stronger Stage-2 restricted-GCD observation, and in fact proves the more precise row-by-row formula from Theorem 5.2.

## 6. Sparse endpoint \(q=Q+1\)

The finite-window scaling law stops at \(q=Q\). The endpoint \(q=Q+1\) is handled separately using the special upper row
\[
m(Q+1)=Q^d+1=p^{ad}+1.
\]

### Lemma 6.1 — binomial valuation at \(p^L+1\)

Let \(P=p^L\) with \(L\ge1\), and let \(1\le k<P\). Then
\[
\boxed{
v_p\binom{P+1}{k}
=
L-v_p(k)-v_p(P+1-k).
}
\]

**Proof.**
First,
\[
k\binom Pk=P\binom{P-1}{k-1}.
\]
The number \(P-1\) has \(L\) base-\(p\) digits all equal to \(p-1\). In the subtraction of \(k-1\) from \(P-1\), no borrow occurs; equivalently Kummer gives
\[
v_p\binom{P-1}{k-1}=0.
\]
Taking \(p\)-adic valuations in the displayed identity gives
\[
v_p\binom Pk=L-v_p(k).
\]

Next,
\[
(P+1-k)\binom{P+1}{k}=(P+1)\binom Pk.
\]
Because \(p\nmid P+1\), valuation gives
\[
v_p(P+1-k)+v_p\binom{P+1}{k}
=
v_p\binom Pk.
\]
Substitute the previous formula. \(\square\)

### Theorem 6.2 — exact endpoint coefficients and GCD

Let \(L=ad\), \(P=Q^d=p^L\), and \(1\le j\le Q\). Then
\[
\boxed{
v_p\binom{m(Q+1)}{mj}
=
ad-v_p(j)-v_p(Q+1-j).
}
\]
Consequently,
\[
\boxed{
v_p(G(m(Q+1);m))
=
ad-a
=
a(d-1).
}
\]

**Proof.**
By Lemma 2.3,
\[
m<Q^{d-1},
\]
so for \(1\le j\le Q\),
\[
1\le mj\le mQ<Q^d=P.
\]
Lemma 6.1 applies with \(k=mj\). Since \(p\nmid m\),
\[
v_p(mj)=v_p(j).
\]
Also
\[
P+1-mj
=
m(Q+1)-mj
=
m(Q+1-j),
\]
so
\[
v_p(P+1-mj)=v_p(Q+1-j).
\]
This proves the coefficient formula.

Now
\[
j+(Q+1-j)=Q+1\equiv1\pmod p,
\]
so \(j\) and \(Q+1-j\) cannot both be divisible by \(p\). Each lies in \([1,Q]\), hence each has \(p\)-adic valuation at most \(a\). Therefore
\[
v_p(j)+v_p(Q+1-j)\le a,
\]
and every selected endpoint coefficient has valuation at least
\[
ad-a=a(d-1).
\]
Equality occurs at \(j=1\), because \(Q+1-j=Q\), and also at \(j=Q\). Hence the minimum over \(1\le j\le Q\), which is the restricted-GCD valuation, is exactly
\[
a(d-1).
\]
\(\square\)

Combining Corollary 2.4 with Theorem 6.2, the sparse row \(Q^d+1\) attains exactly the predecessor global extremal threshold \(r_p(m)\).

## 7. Target A for odd \(d\ge5\)

### Theorem 7.1 — Target A

For every prime \(p\), every \(a\ge1\), and every odd \(d\ge5\),
\[
\boxed{
T_p(C_d(p^a))=p^{ad}+1.
}
\]

Equivalently, the least extremal multiplier is
\[
\boxed{q=Q+1.}
\]

**Proof.**
Write \(d=2s+1\). Since \(d\ge5\), \(s\ge2\). By Corollary 2.4,
\[
r_p(m)=2as.
\]

**Endpoint attainment.**
Theorem 6.2 gives
\[
v_p(G(m(Q+1);m))=a(d-1)=2as=r_p(m).
\]

**Strict non-attainment for \(2\le q\le Q\).**
By Theorem 5.2,
\[
v_p(G(mq;m))\le as+1.
\]
Because \(a\ge1\) and \(s\ge2\),
\[
as+1<2as,
\]
since \(2as-(as+1)=as-1\ge1\). Hence
\[
v_p(G(mq;m))<r_p(m)
\qquad(2\le q\le Q).
\]

Every admissible row \(N>m\) with \(m\mid N\) has the form \(N=mq\) with integer \(q\ge2\). Therefore no row preceding \(m(Q+1)\) is extremal, while \(m(Q+1)\) is extremal. Finally
\[
m(Q+1)=Q^d+1=p^{ad}+1.
\]
Thus this is the least extremal row. \(\square\)

The Pascal Extremes global theorem is used only as predecessor mathematics establishing that \(r_p(m)\) is the global maximum under the checked hypotheses. The exact endpoint and minimality statements above are the new Stage-3 proof work.

## 8. Cubic Target C

Now take \(d=3\), so \(s=1\) and
\[
m=C_3(Q)=Q^2-Q+1=p^{2a}-p^a+1.
\]
Corollary 2.4 gives
\[
r_p(m)=2a.
\]

### Theorem 8.1 — cubic classification

For every prime \(p\) and every \(a\ge1\),
\[
\boxed{
T_p(p^{2a}-p^a+1)
=
\begin{cases}
p(p^2-p+1),&a=1,\\
p^{3a}+1,&a\ge2.
\end{cases}
}
\]

**Case \(a=1\).**
Here \(Q=p\) and \(r_p(m)=2\). Theorem 5.2 becomes
\[
v_p(G(mq;m))
=
1+
\begin{cases}
1,&q\text{ is a positive power of }p,\\
0,&\text{otherwise}
\end{cases}
\qquad(2\le q\le p).
\]
The only positive power of \(p\) in \([2,p]\) is \(q=p\). Therefore every
\[
2\le q<p
\]
has GCD valuation \(1<2\), while
\[
v_p(G(mp;m))=2=r_p(m).
\]
Thus the least extremal multiplier is \(q=p\), and
\[
T_p(m)=mp=p(p^2-p+1).
\]

For the edge \((p,a)=(2,1)\), this is
\[
m=3,\qquad N=6,\qquad v_2(G(6;3))=2.
\]
This valuation phenomenon is **prior work**, explicitly recorded by McTague in the corrected v5 preprint and also covered by the pinned Pascal Minus One predecessor. Its appearance here is an attributed boundary case of the family proof, not a new isolated observation.

**Case \(a\ge2\).**
For every \(2\le q\le Q\), Theorem 5.2 gives
\[
v_p(G(mq;m))\le a+1.
\]
Since \(a\ge2\),
\[
a+1<2a=r_p(m).
\]
Thus no multiplier \(q\le Q\) is extremal. By Theorem 6.2, the endpoint \(q=Q+1\) has valuation
\[
2a=r_p(m).
\]
Hence it is the least extremal multiplier, and
\[
T_p(m)=m(Q+1)=Q^3+1=p^{3a}+1.
\]
\(\square\)

The pinned Pascal Extremes theorem
\[
T_p(p^a+1)=p^{3a}+1\qquad(a\ge2)
\]
is complementary predecessor mathematics because
\[
(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1.
\]
It is not used to infer the cofactor-side least row; the cofactor-side minimality is proved above.

## 9. Dependency summary

The proof dependencies are:

1. elementary alternating/cofactor identity and the positive block expansion;
2. classical Legendre/Kummer digit-sum valuation formula and carry interpretation;
3. the checked Pascal Extremes global maximum theorem only for the statement that \(r_p(m)\) is the global extremal value and for the established least-row framework;
4. no Stage-2 computation as a proof step.

The logical flow is:
\[
\text{threshold}
\longrightarrow
\text{digit-sum shift}
\longrightarrow
\text{finite-window coefficient scaling}
\longrightarrow
\text{exact pre-extremal GCD}
\]
together with the separate sparse-endpoint calculation, then Targets A and C.

## 10. Material failed or insufficient approaches

### 10.1 The Stage-1 threshold lower bound was false

The discarded claim
\[
p^{a(d-1)}<C_d(p^a)
\]
has the wrong direction and is nowhere used. The proof begins from the corrected bounds
\[
p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)}.
\]

### 10.2 Target B alone cannot prove the cubic \(a\ge2\) case

For \(d=3\), Corollary 4.3 gives
\[
\max_{2\le q\le Q}v_p\binom{mq}{m}=2a,
\]
which equals the extremal threshold. Thus the selected coefficient does not separate all pre-endpoint rows from extremality. The exact restricted-GCD formula of Theorem 5.2 is essential: it gives only \(a+1<2a\) for \(a\ge2\).

### 10.3 The complementary predecessor theorem does not transfer by factorisation

The identity
\[
(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1
\]
does not by itself imply that a row least extremal for one factor is least extremal for the complementary factor. Target C therefore requires its own lower-row non-attainment proof, supplied by Theorem 5.2.

### 10.4 The global maximum theorem does not identify the sparse endpoint

Pascal Extremes guarantees the global maximum and existence under its hypotheses, but it does not state that \(Q^d+1\) attains that maximum for the cofactor modulus. Theorem 6.2 is therefore a necessary direct endpoint calculation.

## 11. Stage-3 theorem status

The following are now **proved informally**:

- corrected threshold:
  \[
  p^{a(d-1)-1}<C_d(p^a)<p^{a(d-1)},
  \qquad p\nmid C_d(p^a),
  \qquad r_p(C_d(p^a))=a(d-1);
  \]
- exact finite-window scaling:
  \[
  v_p\binom{C_d(Q)q}{C_d(Q)j}
  =
  \frac{a(d-1)}2+v_p\binom qj
  \quad(2\le q\le Q,\ 1\le j<q);
  \]
- Target B, with unique coefficient argmax \(q=Q\);
- exact pre-extremal restricted-GCD formula, hence maximum
  \[
  \frac{a(d-1)}2+1
  \]
  with exact argmax set \(\{p,p^2,\ldots,p^a\}\);
- exact sparse-endpoint attainment at \(q=Q+1\);
- Target A for every odd \(d\ge5\);
- Target C for \(d=3\), with the \((2,1)\), \(m=3,N=6\) valuation phenomenon explicitly retained as prior work.

No novelty conclusion follows from these proofs. The unresolved Stage-2 literature comparisons remain for Stage 4.
