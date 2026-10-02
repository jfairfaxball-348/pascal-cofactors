module

public import Mathlib

@[expose] public section

/-!
# Pascal Cofactors — Palomar statement surface

This Mathlib-only module records four principal theorem families from the
completed Pascal Cofactors formalisation. The restricted binomial gcd and
least-extremal-row definitions are stated concretely from ordinary Mathlib
primitives so that the statement surface has no project-specific imports.

These are verification targets. Their inclusion here does not assert
historical novelty or priority.
-/

namespace PascalCofactorsPalomar

/-- Positive-block form of the odd alternating cofactor
`(Q^(2*s+1)+1)/(Q+1)`. -/
def cofactor (Q s : ℕ) : ℕ :=
  1 + (Q - 1) * ∑ i ∈ Finset.range s, Q ^ (2 * i + 1)

/-- Alternating cofactor specialized to `Q = p^a`. -/
def C (p a s : ℕ) : ℕ :=
  cofactor (p ^ a) s

/-- Positive multiples of `m` strictly below `N`. -/
def admissibleIndices (N m : ℕ) : Finset ℕ :=
  (Finset.range N).filter fun k ↦ 0 < k ∧ m ∣ k

/-- Restricted gcd of binomial coefficients whose lower index is a positive
multiple of `m` strictly below `N`. -/
def G (N m : ℕ) : ℕ :=
  (admissibleIndices N m).gcd fun k ↦ N.choose k

/-- An admissible row for modulus `m`: a proper larger multiple of `m`. -/
def AdmissibleRow (m N : ℕ) : Prop :=
  m < N ∧ m ∣ N

/-- Exponent parameter used by the predecessor extremal-row framework. -/
def rP (p m : ℕ) : ℕ :=
  Nat.log p m + 1

/-- Rows attaining the predecessor global extremal value. -/
def extremalRows (p m : ℕ) : Set ℕ :=
  {N | AdmissibleRow m N ∧ padicValNat p (G N m) = rP p m}

/-- Least row attaining the predecessor global extremal value. -/
noncomputable def T (p m : ℕ) : ℕ :=
  sInf (extremalRows p m)

/-- Finite-window coefficient scaling for the odd cofactor family. -/
theorem coefficient_scaling
    {p a s q j : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (_hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a)
    (hj1 : 1 ≤ j) (hjq : j < q) :
    padicValNat p ((C p a s * q).choose (C p a s * j)) =
      a * s + padicValNat p (q.choose j) := by
  sorry

local instance classicalPropDecidable (P : Prop) : Decidable P :=
  Classical.propDecidable P

/-- Exact pre-extremal restricted-gcd valuation throughout
`2 ≤ q ≤ p^a`. -/
theorem restricted_gcd_valuation_bounded
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p (G (C p a s * q) (C p a s)) =
      a * s + if (∃ b, 1 ≤ b ∧ b ≤ a ∧ q = p ^ b) then 1 else 0 := by
  sorry

/-- For an explicitly named odd degree `d = 2*s+1 ≥ 5`, the sparse row
`p^(a*d)+1` is the least extremal row for the alternating cofactor. -/
theorem targetA_d
    {p a d s : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (hs : 1 ≤ s) (hd : d = 2 * s + 1) (hd5 : 5 ≤ d) :
    T p (C p a s) = p ^ (a * d) + 1 := by
  sorry

/-- Full cubic classification for the cofactor `p^(2a)-p^a+1`. -/
theorem targetC
    {p a : ℕ} (hp : p.Prime) (ha : 1 ≤ a) :
    T p (p ^ (2 * a) - p ^ a + 1) =
      if a = 1 then
        p * (p ^ (2 * a) - p ^ a + 1)
      else
        p ^ (3 * a) + 1 := by
  sorry

end PascalCofactorsPalomar
