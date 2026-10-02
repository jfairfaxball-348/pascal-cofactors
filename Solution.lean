module

public import PascalCofactors

@[expose] public section

/-!
# Pascal Cofactors — Palomar proved surface

This module repeats the Challenge declarations with the same types and bridges
them transparently to the completed project theorem layer.
-/

namespace PascalCofactorsPalomar

def cofactor (Q s : ℕ) : ℕ :=
  1 + (Q - 1) * ∑ i ∈ Finset.range s, Q ^ (2 * i + 1)

def C (p a s : ℕ) : ℕ :=
  cofactor (p ^ a) s

def admissibleIndices (N m : ℕ) : Finset ℕ :=
  (Finset.range N).filter fun k ↦ 0 < k ∧ m ∣ k

def G (N m : ℕ) : ℕ :=
  (admissibleIndices N m).gcd fun k ↦ N.choose k

def AdmissibleRow (m N : ℕ) : Prop :=
  m < N ∧ m ∣ N

def rP (p m : ℕ) : ℕ :=
  Nat.log p m + 1

def extremalRows (p m : ℕ) : Set ℕ :=
  {N | AdmissibleRow m N ∧ padicValNat p (G N m) = rP p m}

noncomputable def T (p m : ℕ) : ℕ :=
  sInf (extremalRows p m)

theorem coefficient_scaling
    {p a s q j : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a)
    (hj1 : 1 ≤ j) (hjq : j < q) :
    padicValNat p ((C p a s * q).choose (C p a s * j)) =
      a * s + padicValNat p (q.choose j) := by
  simpa only [C, cofactor, PascalCofactors.C, PascalCofactors.cofactor] using
    (PascalCofactors.coefficient_scaling
      (p := p) (a := a) (s := s) (q := q) (j := j)
      hp ha hs hq2 hqQ hj1 hjq)

theorem restricted_gcd_valuation_bounded
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p (G (C p a s * q) (C p a s)) =
      a * s + if (∃ b, 1 ≤ b ∧ b ≤ a ∧ q = p ^ b) then 1 else 0 := by
  simpa only [
    G, admissibleIndices, C, cofactor,
    PascalExtremes.G, PascalExtremes.admissibleIndices,
    PascalCofactors.C, PascalCofactors.cofactor
  ] using
    (PascalCofactors.restricted_gcd_valuation_bounded
      (p := p) (a := a) (s := s) (q := q) hp ha hs hq2 hqQ)

theorem targetA_d
    {p a d s : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (hs : 1 ≤ s) (hd : d = 2 * s + 1) (hd5 : 5 ≤ d) :
    T p (C p a s) = p ^ (a * d) + 1 := by
  simpa only [
    T, extremalRows, AdmissibleRow, G, admissibleIndices, rP, C, cofactor,
    PascalExtremes.T, PascalExtremes.extremalRows,
    PascalExtremes.AdmissibleRow, PascalExtremes.G,
    PascalExtremes.admissibleIndices, PascalExtremes.rP,
    PascalCofactors.C, PascalCofactors.cofactor
  ] using
    (PascalCofactors.targetA_d
      (p := p) (a := a) (d := d) (s := s) hp ha hs hd hd5)

theorem targetC
    {p a : ℕ} (hp : p.Prime) (ha : 1 ≤ a) :
    T p (p ^ (2 * a) - p ^ a + 1) =
      if a = 1 then
        p * (p ^ (2 * a) - p ^ a + 1)
      else
        p ^ (3 * a) + 1 := by
  simpa only [
    T, extremalRows, AdmissibleRow, G, admissibleIndices, rP,
    PascalExtremes.T, PascalExtremes.extremalRows,
    PascalExtremes.AdmissibleRow, PascalExtremes.G,
    PascalExtremes.admissibleIndices, PascalExtremes.rP
  ] using
    (PascalCofactors.targetC (p := p) (a := a) hp ha)

end PascalCofactorsPalomar
