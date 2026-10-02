module

public import PascalExtremes.TargetAAttainment
public import Mathlib.Data.Nat.Digits.Lemmas
public import Mathlib.Tactic

@[expose] public section

namespace PascalCofactors

open Finset

/-- The positive-block form of the odd cofactor
`(Q^(2*s+1)+1)/(Q+1)`.  The quotient identity is proved below. -/
def cofactor (Q s : ℕ) : ℕ :=
  1 + (Q - 1) * ∑ i ∈ Finset.range s, Q ^ (2 * i + 1)

@[simp] theorem cofactor_zero (Q : ℕ) : cofactor Q 0 = 1 := by
  simp [cofactor]

theorem cofactor_succ (Q s : ℕ) :
    cofactor Q (s + 1) = cofactor Q s + (Q - 1) * Q ^ (2 * s + 1) := by
  simp [cofactor, Finset.sum_range_succ]
  ring

/-- The defining product identity for the alternating cofactor. -/
theorem add_one_mul_cofactor
    {Q s : ℕ} (hQ : 1 ≤ Q) :
    (Q + 1) * cofactor Q s = Q ^ (2 * s + 1) + 1 := by
  induction s with
  | zero =>
      simp [cofactor]
  | succ s ih =>
      rw [cofactor_succ]
      apply Nat.cast_injective (R := ℤ)
      have ihZ :
          ((Q : ℤ) + 1) * (cofactor Q s : ℤ) =
            (Q : ℤ) ^ (2 * s + 1) + 1 := by
        exact_mod_cast ih
      simp only [Nat.cast_mul, Nat.cast_add, Nat.cast_one, Nat.cast_pow,
        Nat.cast_sub hQ]
      rw [mul_add, ihZ]
      rw [show 2 * (s + 1) + 1 = (2 * s + 1) + 2 by omega, pow_add]
      ring

/-- The positive-block form is exactly the quotient in the project statement. -/
theorem cofactor_eq_div
    {Q s : ℕ} (hQ : 1 ≤ Q) :
    cofactor Q s = (Q ^ (2 * s + 1) + 1) / (Q + 1) := by
  symm
  apply Nat.div_eq_of_eq_mul_left (by omega : 0 < Q + 1)
  simpa [Nat.mul_comm] using (add_one_mul_cofactor (Q := Q) (s := s) hQ).symm

/-- Specialization to the project prime-power notation. -/
def C (p a s : ℕ) : ℕ :=
  cofactor (p ^ a) s

theorem C_eq_div
    {p a s : ℕ} (hp : p.Prime) :
    C p a s = ((p ^ a) ^ (2 * s + 1) + 1) / (p ^ a + 1) := by
  apply cofactor_eq_div
  exact Nat.one_le_iff_ne_zero.mpr (pow_ne_zero _ hp.ne_zero)

theorem add_one_mul_C
    {p a s : ℕ} (hp : p.Prime) :
    (p ^ a + 1) * C p a s = (p ^ a) ^ (2 * s + 1) + 1 := by
  apply add_one_mul_cofactor
  exact Nat.one_le_iff_ne_zero.mpr (pow_ne_zero _ hp.ne_zero)

end PascalCofactors
