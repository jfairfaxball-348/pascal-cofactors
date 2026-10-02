import PascalCofactors.Basic
import PascalExtremes.Powers
import Mathlib.Tactic

namespace PascalCofactors

theorem cofactor_pos (Q s : ℕ) : 0 < cofactor Q s := by
  simp [cofactor]

theorem cofactor_lower_block
    {Q s : ℕ} (hs : 1 ≤ s) :
    (Q - 1) * Q ^ (2 * s - 1) < cofactor Q s := by
  obtain ⟨t, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : s ≠ 0)
  rw [show Nat.succ t = t + 1 by omega, cofactor_succ]
  have hExp : 2 * (t + 1) - 1 = 2 * t + 1 := by omega
  rw [hExp]
  have hpos := cofactor_pos Q t
  omega

theorem cofactor_upper
    {Q s : ℕ} (hQ : 2 ≤ Q) (hs : 1 ≤ s) :
    cofactor Q s < Q ^ (2 * s) := by
  have hpow : 1 < Q ^ (2 * s) := by
    exact Nat.one_lt_pow (by omega) (by omega)
  have hprod :
      (Q + 1) * cofactor Q s < (Q + 1) * Q ^ (2 * s) := by
    rw [add_one_mul_cofactor (by omega : 1 ≤ Q)]
    calc
      Q ^ (2 * s + 1) + 1
          < Q ^ (2 * s + 1) + Q ^ (2 * s) := Nat.add_lt_add_left hpow _
      _ = (Q + 1) * Q ^ (2 * s) := by
        rw [pow_succ]
        ring
  exact (Nat.mul_lt_mul_left (by omega : 0 < Q + 1)).mp hprod

private theorem pow_pred_le_pow_sub_one
    {p a : ℕ} (hp : p.Prime) (ha : 1 ≤ a) :
    p ^ (a - 1) ≤ p ^ a - 1 := by
  have haEq : a = (a - 1) + 1 := by omega
  have hx : 0 < p ^ (a - 1) := pow_pos hp.pos _
  have hx1 : 1 ≤ p ^ (a - 1) := by omega
  have hpa : p ^ a = p ^ (a - 1) * p := by
    calc
      p ^ a = p ^ ((a - 1) + 1) := by rw [← haEq]
      _ = p ^ (a - 1) * p := by rw [pow_succ]
  have hstep : p ^ (a - 1) + 1 ≤ p ^ a := by
    calc
      p ^ (a - 1) + 1 ≤ p ^ (a - 1) + p ^ (a - 1) :=
        Nat.add_le_add_left hx1 _
      _ = p ^ (a - 1) * 2 := by ring
      _ ≤ p ^ (a - 1) * p := Nat.mul_le_mul_left _ hp.two_le
      _ = p ^ a := hpa.symm
  omega

private theorem exponent_lower_identity
    {a s : ℕ} (ha : 1 ≤ a) (hs : 1 ≤ s) :
    (a - 1) + a * (2 * s - 1) = 2 * a * s - 1 := by
  obtain ⟨a0, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : a ≠ 0)
  obtain ⟨s0, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : s ≠ 0)
  simp only [Nat.succ_sub_one]
  have hExp : 2 * (s0 + 1) - 1 = 2 * s0 + 1 := by omega
  rw [hExp]
  have hRing :
      a0 + (a0 + 1) * (2 * s0 + 1) + 1 =
        2 * (a0 + 1) * (s0 + 1) := by
    ring
  have hpos : 0 < 2 * (a0 + 1) * (s0 + 1) := by
    exact Nat.mul_pos (Nat.mul_pos (by decide) (Nat.succ_pos _)) (Nat.succ_pos _)
  omega

/-- Corrected lower threshold bound. -/
theorem C_lower_threshold
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    p ^ (2 * a * s - 1) < C p a s := by
  let Q := p ^ a
  have hQm1 : p ^ (a - 1) ≤ Q - 1 := by
    simpa [Q] using pow_pred_le_pow_sub_one hp ha
  have hblock := cofactor_lower_block (Q := Q) hs
  have hmul :
      p ^ (a - 1) * Q ^ (2 * s - 1) ≤
        (Q - 1) * Q ^ (2 * s - 1) :=
    Nat.mul_le_mul_right _ hQm1
  have hpow :
      p ^ (2 * a * s - 1) =
        p ^ (a - 1) * Q ^ (2 * s - 1) := by
    dsimp [Q]
    rw [← pow_mul, ← pow_add, exponent_lower_identity ha hs]
  rw [hpow]
  exact hmul.trans_lt hblock

/-- Corrected upper threshold bound. -/
theorem C_upper_threshold
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    C p a s < p ^ (2 * a * s) := by
  have hQ2 : 2 ≤ p ^ a := by
    calc
      2 ≤ p := hp.two_le
      _ ≤ p ^ a := by
        simpa [pow_one] using Nat.pow_le_pow_right hp.pos ha
  have h := cofactor_upper (Q := p ^ a) (s := s) hQ2 hs
  simpa [C, ← pow_mul, show a * (2 * s) = 2 * a * s by ring] using h

/-- The cofactor is prime to the base prime. -/
theorem prime_not_dvd_C
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) :
    ¬ p ∣ C p a s := by
  intro hC
  have hQ : p ∣ p ^ a := dvd_pow_self p (by omega : a ≠ 0)
  have hPow : p ∣ (p ^ a) ^ (2 * s + 1) := by
    exact hQ.trans (dvd_pow_self (p ^ a) (by omega))
  have hSum : p ∣ (p ^ a) ^ (2 * s + 1) + 1 := by
    rw [← add_one_mul_C hp]
    exact dvd_mul_of_dvd_right hC (p ^ a + 1)
  have hOne' : p ∣ ((p ^ a) ^ (2 * s + 1) + 1) - (p ^ a) ^ (2 * s + 1) :=
    Nat.dvd_sub hSum hPow
  have hOne : p ∣ 1 := by simpa using hOne'
  exact hp.not_dvd_one hOne

/-- Exact Pascal-Extremes threshold for the odd cofactor. -/
theorem rP_C
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    PascalExtremes.rP p (C p a s) = 2 * a * s := by
  have hlo := C_lower_threshold hp ha hs
  have hup := C_upper_threshold hp ha hs
  have hR : 1 ≤ 2 * a * s := by nlinarith
  have hstep : 2 * a * s - 1 + 1 = 2 * a * s := by omega
  have hup' : C p a s < p ^ (2 * a * s - 1 + 1) := by
    simpa [hstep] using hup
  have hlog :
      Nat.log p (C p a s) = 2 * a * s - 1 :=
    Nat.log_eq_of_pow_le_of_lt_pow hlo.le hup'
  simp [PascalExtremes.rP, hlog]
  omega

/-- Wrapper in the project notation `d = 2*s+1`. -/
theorem C_threshold_d
    {p a d s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hd : d = 2 * s + 1) :
    p ^ (a * (d - 1) - 1) < C p a s ∧
      C p a s < p ^ (a * (d - 1)) ∧
      ¬ p ∣ C p a s ∧
      PascalExtremes.rP p (C p a s) = a * (d - 1) := by
  subst d
  have hExp : a * (2 * s + 1 - 1) = 2 * a * s := by
    simp
    ring
  rw [hExp]
  exact ⟨C_lower_threshold hp ha hs, C_upper_threshold hp ha hs,
    prime_not_dvd_C hp ha, rP_C hp ha hs⟩

end PascalCofactors
