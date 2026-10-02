import PascalCofactors.TargetA
import Mathlib.Tactic

namespace PascalCofactors

open PascalExtremes

noncomputable section

/-- The cubic odd cofactor in the explicit polynomial form used by Target C. -/
theorem C_cubic
    {p a : ℕ} (hp : p.Prime) :
    C p a 1 = p ^ (2 * a) - p ^ a + 1 := by
  let Q := p ^ a
  have hQpos : 0 < Q := by
    dsimp [Q]
    exact pow_pos hp.pos _
  have hQ1 : 1 ≤ Q := by omega
  have hsq : Q ≤ Q ^ 2 := by
    rw [pow_two]
    calc
      Q = Q * 1 := by simp
      _ ≤ Q * Q := Nat.mul_le_mul_left Q hQ1
  have hprodC :
      (Q + 1) * C p a 1 = Q ^ 3 + 1 := by
    simpa [Q] using
      add_one_mul_C (p := p) (a := a) (s := 1) hp
  have hprodPoly :
      (Q + 1) * (Q ^ 2 - Q + 1) = Q ^ 3 + 1 := by
    apply Nat.cast_injective (R := ℤ)
    simp only [Nat.cast_mul, Nat.cast_add, Nat.cast_one, Nat.cast_pow,
      Nat.cast_sub hsq]
    ring
  have hCQ : C p a 1 = Q ^ 2 - Q + 1 := by
    apply Nat.mul_left_cancel (by omega : 0 < Q + 1)
    calc
      (Q + 1) * C p a 1 = Q ^ 3 + 1 := hprodC
      _ = (Q + 1) * (Q ^ 2 - Q + 1) := hprodPoly.symm
  have hQsq : Q ^ 2 = p ^ (2 * a) := by
    dsimp [Q]
    rw [show 2 * a = a * 2 by ring, ← pow_mul]
  rw [hQsq] at hCQ
  simpa [Q] using hCQ

/-- Cubic Target C, exceptional exponent-one case, still in cofactor notation.
This is kept separate from the `a ≥ 2` endpoint argument. -/
theorem targetC_a_one_C
    {p : ℕ} (hp : p.Prime) :
    T p (C p 1 1) = C p 1 1 * p := by
  let m := C p 1 1
  let N := m * p
  have hmpos : 0 < m := by
    dsimp [m, C]
    exact cofactor_pos _ _
  have hmLower :=
    C_lower_threshold (p := p) (a := 1) (s := 1) hp (by omega) (by omega)
  have hpowPos : 0 < p ^ (2 * 1 * 1 - 1) := pow_pos hp.pos _
  have hm2 : 2 ≤ m := by
    omega
  have hpm : ¬ p ∣ m := by
    simpa [m] using
      prime_not_dvd_C (p := p) (a := 1) (s := 1) hp (by omega)
  have hr : rP p m = 2 := by
    simpa [m] using
      rP_C (p := p) (a := 1) (s := 1) hp (by omega) (by omega)
  have hrow0 : AdmissibleRow m N := by
    refine ⟨?_, ?_⟩
    · dsimp [N]
      nlinarith [hp.two_le]
    · dsimp [N]
      exact dvd_mul_right m p
  have hval2 : padicValNat p (G N m) = 2 := by
    simpa [m, N] using
      restricted_gcd_maximum_at_p
        (p := p) (a := 1) (s := 1) hp (by omega) (by omega)
  have hval0 : padicValNat p (G N m) = rP p m :=
    hval2.trans hr.symm
  have hmem0 : N ∈ extremalRows p m :=
    ⟨hrow0, hval0⟩
  have hTle : T p m ≤ N :=
    (T_isLeast hp hm2 hpm).2 hmem0
  have hTmem := T_mem_extremalRows hp hm2 hpm
  have hNleT : N ≤ T p m := by
    by_contra hnot
    have hTltN : T p m < N := Nat.lt_of_not_ge hnot
    rcases hTmem.1.2 with ⟨q, hTq⟩
    have hmq : m < m * q := by
      simpa [hTq] using hTmem.1.1
    have hq2 : 2 ≤ q := by
      by_contra hqnot
      have hqLt2 : q < 2 := by omega
      interval_cases q <;> simp_all
    have hmulLt : m * q < m * p := by
      calc
        m * q = T p m := hTq.symm
        _ < N := hTltN
        _ = m * p := by rfl
    have hqLt : q < p :=
      (Nat.mul_lt_mul_left hmpos).mp hmulLt
    have hqQ : q ≤ p ^ 1 := by
      simpa using hqLt.le
    have hTval : padicValNat p (G (T p m) m) = 2 := by
      calc
        padicValNat p (G (T p m) m) = rP p m := hTmem.2
        _ = 2 := hr
    have hqVal :
        padicValNat p (G (C p 1 1 * q) (C p 1 1)) =
          1 * 1 + 1 := by
      rw [hTq] at hTval
      simpa [m] using hTval
    obtain ⟨b, hb1, hbA, hbq⟩ :=
      (restricted_gcd_eq_max_iff
        (p := p) (a := 1) (s := 1) (q := q)
        hp (by omega) (by omega) hq2 hqQ).1 hqVal
    have hbEq : b = 1 := by omega
    rw [hbEq, pow_one] at hbq
    omega
  have hEq : T p m = N := Nat.le_antisymm hTle hNleT
  simpa [m, N] using hEq

/-- Cubic Target C for `a ≥ 2`, in cofactor notation. -/
theorem targetC_ge_two_C
    {p a : ℕ} (hp : p.Prime) (ha : 2 ≤ a) :
    T p (C p a 1) = p ^ (a * 3) + 1 := by
  let m := C p a 1
  let N := p ^ (a * 3) + 1
  have ha1 : 1 ≤ a := by omega
  have hmpos : 0 < m := by
    dsimp [m, C]
    exact cofactor_pos _ _
  have hmLower :=
    C_lower_threshold (p := p) (a := a) (s := 1) hp ha1 (by omega)
  have hpowPos : 0 < p ^ (2 * a * 1 - 1) := pow_pos hp.pos _
  have hm2 : 2 ≤ m := by
    omega
  have hpm : ¬ p ∣ m := by
    simpa [m] using
      prime_not_dvd_C (p := p) (a := a) (s := 1) hp ha1
  have hrowEq : m * (p ^ a + 1) = N := by
    simpa [m, N] using
      endpoint_row_identity (p := p) (a := a) (s := 1) hp
  have hQpos : 0 < p ^ a := pow_pos hp.pos _
  have hrow0 : AdmissibleRow m N := by
    refine ⟨?_, ?_⟩
    · calc
        m < m * (p ^ a + 1) := by nlinarith
        _ = N := hrowEq
    · exact ⟨p ^ a + 1, hrowEq.symm⟩
  have hval0 :
      padicValNat p (G N m) = rP p m := by
    simpa [m, N] using
      endpoint_gcd_valuation_eq_rP
        (p := p) (a := a) (s := 1) hp ha1 (by omega)
  have hmem0 : N ∈ extremalRows p m :=
    ⟨hrow0, hval0⟩
  have hTle : T p m ≤ N :=
    (T_isLeast hp hm2 hpm).2 hmem0
  have hTmem := T_mem_extremalRows hp hm2 hpm
  have hNleT : N ≤ T p m := by
    by_contra hnot
    have hTltN : T p m < N := Nat.lt_of_not_ge hnot
    rcases hTmem.1.2 with ⟨q, hTq⟩
    have hmq : m < m * q := by
      simpa [hTq] using hTmem.1.1
    have hq2 : 2 ≤ q := by
      by_contra hqnot
      have hqLt2 : q < 2 := by omega
      interval_cases q <;> simp_all
    have hmulLt :
        m * q < m * (p ^ a + 1) := by
      calc
        m * q = T p m := hTq.symm
        _ < N := hTltN
        _ = m * (p ^ a + 1) := hrowEq.symm
    have hqLt : q < p ^ a + 1 :=
      (Nat.mul_lt_mul_left hmpos).mp hmulLt
    have hqQ : q ≤ p ^ a := by omega
    have hpre :
        padicValNat p (G (T p m) m) ≤ a + 1 := by
      rw [hTq]
      simpa [m] using
        restricted_gcd_le_max
          (p := p) (a := a) (s := 1) (q := q)
          hp ha1 (by omega) hq2 hqQ
    have hTval :
        padicValNat p (G (T p m) m) = 2 * a := by
      calc
        padicValNat p (G (T p m) m) = rP p m := hTmem.2
        _ = 2 * a := by
          have hr :=
            rP_C (p := p) (a := a) (s := 1) hp ha1 (by omega)
          simpa [m] using hr
    rw [hTval] at hpre
    omega
  have hEq : T p m = N := Nat.le_antisymm hTle hNleT
  simpa [m, N] using hEq

/-- Target C, exceptional exponent-one case in the explicit cubic notation. -/
theorem targetC_a_one
    {p : ℕ} (hp : p.Prime) :
    T p (p ^ 2 - p + 1) = p * (p ^ 2 - p + 1) := by
  have hC := C_cubic (p := p) (a := 1) hp
  have hT := targetC_a_one_C (p := p) hp
  simp at hC
  rw [hC] at hT
  simpa [Nat.mul_comm] using hT

/-- Target C for `a ≥ 2` in the explicit cubic notation. -/
theorem targetC_ge_two
    {p a : ℕ} (hp : p.Prime) (ha : 2 ≤ a) :
    T p (p ^ (2 * a) - p ^ a + 1) = p ^ (3 * a) + 1 := by
  have hC := C_cubic (p := p) (a := a) hp
  have hT := targetC_ge_two_C (p := p) (a := a) hp ha
  rw [hC] at hT
  simpa [Nat.mul_comm] using hT

/-- Full cubic Target C classification. -/
theorem targetC
    {p a : ℕ} (hp : p.Prime) (ha : 1 ≤ a) :
    T p (p ^ (2 * a) - p ^ a + 1) =
      if a = 1 then
        p * (p ^ (2 * a) - p ^ a + 1)
      else
        p ^ (3 * a) + 1 := by
  by_cases h : a = 1
  · subst a
    simpa using targetC_a_one (p := p) hp
  · have ha2 : 2 ≤ a := by omega
    rw [if_neg h]
    exact targetC_ge_two (p := p) (a := a) hp ha2

end

end PascalCofactors
