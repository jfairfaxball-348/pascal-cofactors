module

public import PascalCofactors.Endpoint
public import PascalExtremes.TargetAAttainment
public import Mathlib.Tactic

@[expose] public section

namespace PascalCofactors

open PascalExtremes

noncomputable section

/-- Target A in the primary odd-degree parameterization `d = 2*s+1`.
For `s ≥ 2` (equivalently `d ≥ 5`), the sparse endpoint is the
least extremal row. -/
theorem targetA
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 2 ≤ s) :
    PascalExtremes.T p (C p a s) =
      p ^ (a * (2 * s + 1)) + 1 := by
  let m := C p a s
  let N := p ^ (a * (2 * s + 1)) + 1
  have hs1 : 1 ≤ s := by omega
  have hmpos : 0 < m := by
    dsimp [m, C]
    exact cofactor_pos _ _
  have hmLower := C_lower_threshold hp ha hs1
  have hpowPos : 0 < p ^ (2 * a * s - 1) := pow_pos hp.pos _
  have hm2 : 2 ≤ m := by
    omega
  have hpm : ¬ p ∣ m := by
    simpa [m] using prime_not_dvd_C hp ha
  have hrowEq :
      m * (p ^ a + 1) = N := by
    simpa [m, N] using
      endpoint_row_identity (p := p) (a := a) (s := s) hp
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
        (p := p) (a := a) (s := s) hp ha hs1
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
      have hqLt : q < 2 := by omega
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
        padicValNat p (G (T p m) m) ≤ a * s + 1 := by
      rw [hTq]
      simpa [m] using
        restricted_gcd_le_max
          (p := p) (a := a) (s := s) (q := q)
          hp ha hs1 hq2 hqQ
    have hTval :
        padicValNat p (G (T p m) m) = 2 * a * s := by
      calc
        padicValNat p (G (T p m) m) = rP p m := hTmem.2
        _ = 2 * a * s := by
          simpa [m] using rP_C (p := p) (a := a) (s := s) hp ha hs1
    rw [hTval] at hpre
    nlinarith
  have hEq : T p m = N := Nat.le_antisymm hTle hNleT
  simpa [m, N] using hEq

/-- Target A with the odd degree named explicitly. -/
theorem targetA_d
    {p a d s : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (hs : 1 ≤ s) (hd : d = 2 * s + 1) (hd5 : 5 ≤ d) :
    PascalExtremes.T p (C p a s) = p ^ (a * d) + 1 := by
  have hs2 : 2 ≤ s := by omega
  subst d
  exact targetA (p := p) (a := a) (s := s) hp ha hs2

end

end PascalCofactors
