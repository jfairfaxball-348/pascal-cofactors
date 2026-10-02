module

public import PascalCofactors.GCD
public import Mathlib.Data.Nat.Multiplicity
public import Mathlib.NumberTheory.Padics.PadicVal.Basic
public import Mathlib.Tactic

@[expose] public section

namespace PascalCofactors

open PascalExtremes

noncomputable section

/-- The sparse endpoint row is exactly the prime-power-plus-one row. -/
theorem endpoint_row_identity
    {p a s : ℕ} (hp : p.Prime) :
    C p a s * (p ^ a + 1) = p ^ (a * (2 * s + 1)) + 1 := by
  calc
    C p a s * (p ^ a + 1) = (p ^ a + 1) * C p a s := by rw [Nat.mul_comm]
    _ = (p ^ a) ^ (2 * s + 1) + 1 := add_one_mul_C hp
    _ = p ^ (a * (2 * s + 1)) + 1 := by rw [← pow_mul]

private theorem prime_not_dvd_pow_add_one
    {p L : ℕ} (hp : p.Prime) (hL : 1 ≤ L) :
    ¬ p ∣ p ^ L + 1 := by
  intro hsum
  have hpow : p ∣ p ^ L :=
    dvd_pow_self p (by omega : L ≠ 0)
  have hone' : p ∣ (p ^ L + 1) - p ^ L :=
    Nat.dvd_sub hsum hpow
  have hone : p ∣ 1 := by simpa using hone'
  exact hp.not_dvd_one hone

private theorem prime_power_choose_valuation_sum
    {p L k : ℕ} (hp : p.Prime) (hk1 : 1 ≤ k) (hkP : k ≤ p ^ L) :
    padicValNat p ((p ^ L).choose k) + padicValNat p k = L := by
  letI : Fact p.Prime := ⟨hp⟩
  have hk0 : k ≠ 0 := by omega
  have hchoose0 : (p ^ L).choose k ≠ 0 :=
    Nat.choose_ne_zero_iff.mpr hkP
  have h :=
    hp.emultiplicity_choose_prime_pow_add_emultiplicity
      (n := L) (k := k) hkP hk0
  rw [← padicValNat_eq_emultiplicity hchoose0,
      ← padicValNat_eq_emultiplicity hk0] at h
  exact_mod_cast h

/-- Valuation formula for an interior coefficient in a row (p^L+1). -/
private theorem prime_power_succ_choose_valuation
    {p L k : ℕ} (hp : p.Prime) (hL : 1 ≤ L)
    (hk1 : 1 ≤ k) (hkP : k < p ^ L) :
    padicValNat p ((p ^ L + 1).choose k) =
      L - padicValNat p k - padicValNat p (p ^ L + 1 - k) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hkLe : k ≤ p ^ L := hkP.le
  have hbase := prime_power_choose_valuation_sum hp hk1 hkLe
  have hchoose0 : (p ^ L).choose k ≠ 0 :=
    Nat.choose_ne_zero_iff.mpr hkLe
  have hrow0 : p ^ L + 1 ≠ 0 := by omega
  have hchooseSucc0 : (p ^ L + 1).choose k ≠ 0 :=
    Nat.choose_ne_zero_iff.mpr (by omega : k ≤ p ^ L + 1)
  have hdiff0 : p ^ L + 1 - k ≠ 0 := by omega
  have hrel := congrArg (padicValNat p) (Nat.choose_mul_succ_eq (p ^ L) k)
  rw [padicValNat.mul hchoose0 hrow0,
      padicValNat.mul hchooseSucc0 hdiff0] at hrel
  have hrowVal : padicValNat p (p ^ L + 1) = 0 := by
    exact padicValNat.eq_zero_iff.mpr
      (Or.inr (Or.inr (prime_not_dvd_pow_add_one hp hL)))
  rw [hrowVal, Nat.add_zero] at hrel
  omega

private theorem padicValNat_le_exp_of_pos_le_pow
    {p a n : ℕ} (hp : p.Prime) (hn1 : 1 ≤ n) (hnQ : n ≤ p ^ a) :
    padicValNat p n ≤ a := by
  letI : Fact p.Prime := ⟨hp⟩
  by_contra h
  have hv : a + 1 ≤ padicValNat p n := by omega
  have hn0 : n ≠ 0 := by omega
  have hdvd : p ^ (a + 1) ∣ n :=
    (padicValNat_dvd_iff_le hn0).2 hv
  have hpowLe : p ^ (a + 1) ≤ n :=
    Nat.le_of_dvd (by omega : 0 < n) hdvd
  have hpowLt : p ^ a < p ^ (a + 1) := by
    rw [pow_succ]
    have hpa : 0 < p ^ a := pow_pos hp.pos _
    nlinarith [hp.two_le]
  omega

private theorem endpoint_valuation_sum_le
    {p a j : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (hj1 : 1 ≤ j) (hjQ : j ≤ p ^ a) :
    padicValNat p j + padicValNat p (p ^ a + 1 - j) ≤ a := by
  letI : Fact p.Prime := ⟨hp⟩
  have hdiff1 : 1 ≤ p ^ a + 1 - j := by omega
  have hdiffQ : p ^ a + 1 - j ≤ p ^ a := by omega
  have hjBound := padicValNat_le_exp_of_pos_le_pow hp hj1 hjQ
  have hdiffBound :=
    padicValNat_le_exp_of_pos_le_pow hp hdiff1 hdiffQ
  by_cases hj0 : padicValNat p j = 0
  · rw [hj0, Nat.zero_add]
    exact hdiffBound
  · have hjDvd : p ∣ j :=
      (dvd_iff_padicValNat_ne_zero (by omega : j ≠ 0)).2 hj0
    have hsumNot : ¬ p ∣ p ^ a + 1 :=
      prime_not_dvd_pow_add_one hp ha
    have hdiffVal0 : padicValNat p (p ^ a + 1 - j) = 0 := by
      by_contra hdiff0
      have hdiffDvd : p ∣ p ^ a + 1 - j :=
        (dvd_iff_padicValNat_ne_zero (by omega : p ^ a + 1 - j ≠ 0)).2 hdiff0
      have hsumEq : j + (p ^ a + 1 - j) = p ^ a + 1 := by omega
      have hsumDvd : p ∣ p ^ a + 1 := by
        rw [← hsumEq]
        exact Nat.dvd_add hjDvd hdiffDvd
      exact hsumNot hsumDvd
    rw [hdiffVal0, Nat.add_zero]
    exact hjBound

/-- Exact selected-coefficient valuation at the sparse endpoint.

For (1 ≤ j ≤ p^a), the selected coefficient in the row
(p^{a(2s+1)}+1) has the Stage-3 valuation formula. -/
theorem endpoint_coefficient
    {p a s j : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hj1 : 1 ≤ j) (hjQ : j ≤ p ^ a) :
    padicValNat p
        ((p ^ (a * (2 * s + 1)) + 1).choose (C p a s * j)) =
      a * (2 * s + 1) -
        padicValNat p j -
        padicValNat p (p ^ a + 1 - j) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hL : 1 ≤ a * (2 * s + 1) := by
    nlinarith
  have hmpos : 0 < C p a s := by
    dsimp [C]
    exact cofactor_pos _ _
  have hjpos : 0 < j := by omega
  have hQpos : 0 < p ^ a := pow_pos hp.pos _
  have hk1 : 1 ≤ C p a s * j :=
    Nat.one_le_iff_ne_zero.mpr (Nat.mul_ne_zero (by omega) (by omega))
  have hkP :
      C p a s * j < p ^ (a * (2 * s + 1)) := by
    calc
      C p a s * j ≤ C p a s * p ^ a :=
        Nat.mul_le_mul_left _ hjQ
      _ < p ^ (2 * a * s) * p ^ a :=
        (Nat.mul_lt_mul_right hQpos).2 (C_upper_threshold hp ha hs)
      _ = p ^ (a * (2 * s + 1)) := by
        rw [← pow_add]
        congr 1
        ring
  have hmain :=
    prime_power_succ_choose_valuation hp hL hk1 hkP
  have hm0 : C p a s ≠ 0 := by omega
  have hj0 : j ≠ 0 := by omega
  have hdiff1 : 1 ≤ p ^ a + 1 - j := by omega
  have hdiff0 : p ^ a + 1 - j ≠ 0 := by omega
  have hmVal : padicValNat p (C p a s) = 0 := by
    exact padicValNat.eq_zero_iff.mpr
      (Or.inr (Or.inr (prime_not_dvd_C hp ha)))
  have hkVal :
      padicValNat p (C p a s * j) = padicValNat p j := by
    rw [padicValNat.mul hm0 hj0, hmVal, Nat.zero_add]
  have hdiff :
      p ^ (a * (2 * s + 1)) + 1 - C p a s * j =
        C p a s * (p ^ a + 1 - j) := by
    rw [← endpoint_row_identity (p := p) (a := a) (s := s) hp]
    exact (Nat.mul_sub_left_distrib _ _ _).symm
  have hdiffVal :
      padicValNat p
          (p ^ (a * (2 * s + 1)) + 1 - C p a s * j) =
        padicValNat p (p ^ a + 1 - j) := by
    rw [hdiff, padicValNat.mul hm0 hdiff0, hmVal, Nat.zero_add]
  rw [hkVal, hdiffVal] at hmain
  exact hmain

private theorem endpoint_admissible_index
    {p a s k : ℕ} (hp : p.Prime)
    (hk : Admissible (p ^ (a * (2 * s + 1)) + 1) (C p a s) k) :
    ∃ j, 1 ≤ j ∧ j ≤ p ^ a ∧ k = C p a s * j := by
  have hmpos : 0 < C p a s := by
    dsimp [C]
    exact cofactor_pos _ _
  rcases hk.2.2 with ⟨j, hj⟩
  have hjpos : 0 < j := by
    by_contra h
    have hj0 : j = 0 := Nat.eq_zero_of_not_pos h
    have hk0 : k = 0 := by simpa [hj0] using hj
    exact (Nat.ne_of_gt hk.1) hk0
  have hjlt : j < p ^ a + 1 := by
    have hrow :=
      endpoint_row_identity (p := p) (a := a) (s := s) hp
    have hmul :
        C p a s * j < C p a s * (p ^ a + 1) := by
      calc
        C p a s * j = k := hj.symm
        _ < p ^ (a * (2 * s + 1)) + 1 := hk.2.1
        _ = C p a s * (p ^ a + 1) := hrow.symm
    exact (Nat.mul_lt_mul_left hmpos).mp hmul
  exact ⟨j, by omega, by omega, hj⟩

/-- Exact restricted-GCD valuation at the sparse endpoint. -/
theorem endpoint_gcd_valuation
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    padicValNat p
        (G (p ^ (a * (2 * s + 1)) + 1) (C p a s)) =
      2 * a * s := by
  letI : Fact p.Prime := ⟨hp⟩
  let m := C p a s
  let N := p ^ (a * (2 * s + 1)) + 1
  have hmpos : 0 < m := by
    dsimp [m, C]
    exact cofactor_pos _ _
  have hQ2 : 2 ≤ p ^ a + 1 := by
    have hQpos : 0 < p ^ a := pow_pos hp.pos _
    omega
  have hNm : m < N := by
    dsimp [m, N]
    rw [← endpoint_row_identity (p := p) (a := a) (s := s) hp]
    nlinarith
  have hlower :
      ∀ k, Admissible N m k →
        2 * a * s ≤ padicValNat p (N.choose k) := by
    intro k hk
    have hk' :
        Admissible
          (p ^ (a * (2 * s + 1)) + 1) (C p a s) k := by
      simpa [N, m] using hk
    obtain ⟨j, hj1, hjQ, rfl⟩ :=
      endpoint_admissible_index hp hk'
    have hcoeff :=
      endpoint_coefficient
        (p := p) (a := a) (s := s) (j := j)
        hp ha hs hj1 hjQ
    have hsum := endpoint_valuation_sum_le hp ha hj1 hjQ
    have hExp : a * (2 * s + 1) = 2 * a * s + a := by ring
    dsimp [N, m]
    rw [hcoeff, hExp]
    omega
  have hwitness :
      ∃ k, Admissible N m k ∧
        padicValNat p (N.choose k) = 2 * a * s := by
    refine ⟨m, ?_, ?_⟩
    · exact ⟨hmpos, hNm, dvd_refl m⟩
    · have hcoeff :=
        endpoint_coefficient
          (p := p) (a := a) (s := s) (j := 1)
          hp ha hs (by omega) (by
            exact Nat.one_le_pow _ _ hp.pos)
      have hQVal : padicValNat p (p ^ a) = a :=
        padicValNat.prime_pow a
      have hExp : a * (2 * s + 1) = 2 * a * s + a := by ring
      dsimp [N, m]
      simpa [hExp, hQVal] using hcoeff
  exact padicVal_G_eq_of_lower_bound_of_witness
    hmpos hNm hp hlower hwitness

/-- The sparse endpoint reaches exactly the Pascal-Extremes threshold. -/
theorem endpoint_gcd_valuation_eq_rP
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    padicValNat p
        (G (p ^ (a * (2 * s + 1)) + 1) (C p a s)) =
      PascalExtremes.rP p (C p a s) := by
  rw [endpoint_gcd_valuation hp ha hs, rP_C hp ha hs]

end

end PascalCofactors
