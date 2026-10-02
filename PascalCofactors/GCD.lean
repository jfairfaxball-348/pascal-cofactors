import PascalCofactors.Scaling
import PascalExtremes.Basic
import Mathlib.Data.Nat.Choose.Lucas
import Mathlib.Tactic

namespace PascalCofactors

open PascalExtremes

/-- A positive power of the fixed prime `p`. -/
def IsPositivePPower (p q : ℕ) : Prop :=
  ∃ b, 1 ≤ b ∧ q = p ^ b

private theorem pure_power_choose_lower
    {p b j : ℕ} (hp : p.Prime) (hb : 1 ≤ b)
    (hj1 : 1 ≤ j) (hjq : j < p ^ b) :
    1 ≤ padicValNat p ((p ^ b).choose j) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hchooseNe : (p ^ b).choose j ≠ 0 :=
    Nat.choose_ne_zero_iff.mpr hjq.le
  have hdiv : p ∣ (p ^ b).choose j :=
    hp.dvd_choose_pow (by omega : j ≠ 0) (by omega : j ≠ p ^ b)
  exact one_le_padicValNat_of_dvd hchooseNe hdiv

private theorem pure_power_choose_witness
    {p b : ℕ} (hp : p.Prime) (hb : 1 ≤ b) :
    ∃ j, 1 ≤ j ∧ j < p ^ b ∧
      padicValNat p ((p ^ b).choose j) = 1 := by
  letI : Fact p.Prime := ⟨hp⟩
  let j := p ^ (b - 1)
  have hj1 : 1 ≤ j := by
    dsimp [j]
    exact Nat.one_le_pow _ _ hp.pos
  have hjq : j < p ^ b := by
    dsimp [j]
    exact Nat.pow_lt_pow_right hp.one_lt (by omega)
  have hFormula :=
    sub_one_mul_padicValNat_choose_eq_sub_sum_digits
      (p := p) (n := p ^ b) (k := j) hjq.le
  change
    (p - 1) * padicValNat p ((p ^ b).choose j) =
      digitSum p j + digitSum p (p ^ b - j) - digitSum p (p ^ b) at hFormula
  have hExp : b = (b - 1) + 1 := by omega
  have hdiff : p ^ b - j = p ^ (b - 1) * (p - 1) := by
    dsimp [j]
    rw [hExp, pow_succ]
    rw [Nat.mul_sub_left_distrib, mul_one]
  have hDSj : digitSum p j = 1 := by
    dsimp [j]
    exact digitSum_pow hp
  have hDSdiff : digitSum p (p ^ b - j) = p - 1 := by
    rw [hdiff]
    calc
      digitSum p (p ^ (b - 1) * (p - 1)) = digitSum p (p - 1) :=
        digitSum_pow_mul hp
      _ = p - 1 := digitSum_of_lt hp (by omega)
  have hDSq : digitSum p (p ^ b) = 1 := digitSum_pow hp
  rw [hDSj, hDSdiff, hDSq] at hFormula
  have hpPred : 0 < p - 1 := Nat.sub_pos_of_lt hp.one_lt
  have hMul :
      (p - 1) * padicValNat p ((p ^ b).choose j) =
        (p - 1) * 1 := by
    simpa using hFormula
  refine ⟨j, hj1, hjq, ?_⟩
  exact Nat.mul_left_cancel hpPred hMul

private theorem non_power_choose_witness
    {p q : ℕ} (hp : p.Prime) (hq2 : 2 ≤ q)
    (hnot : ¬ IsPositivePPower p q) :
    ∃ j, 1 ≤ j ∧ j < q ∧ padicValNat p (q.choose j) = 0 := by
  letI : Fact p.Prime := ⟨hp⟩
  classical
  by_contra hnone
  push_neg at hnone
  have hall :
      ∀ j ∈ Finset.Icc 1 (q - 1), q.choose j ≡ 0 [MOD p] := by
    intro j hj
    have hjBounds := Finset.mem_Icc.mp hj
    have hj1 : 1 ≤ j := hjBounds.1
    have hjq : j < q := by omega
    have hchooseNe : q.choose j ≠ 0 :=
      Nat.choose_ne_zero_iff.mpr hjq.le
    have hvne : padicValNat p (q.choose j) ≠ 0 := by
      exact hnone j hj1 hjq
    have hdiv : p ∣ q.choose j :=
      (dvd_iff_padicValNat_ne_zero hchooseNe).2 hvne
    exact hdiv.modEq_zero_nat
  have hpow :=
    Choose.eq_pow_multiplicity_of_choose_modEq_zero_nat
      (p := p) (n := q) (by omega : 0 < q) hall
  have hb : 1 ≤ multiplicity p q := by
    by_contra hbnot
    have hb0 : multiplicity p q = 0 := by omega
    rw [hb0, pow_zero] at hpow
    omega
  exact hnot ⟨multiplicity p q, hb, hpow⟩

private theorem scaled_admissible_index
    {m q k : ℕ} (hm : 0 < m)
    (hk : Admissible (m * q) m k) :
    ∃ j, 1 ≤ j ∧ j < q ∧ k = m * j := by
  rcases hk.2.2 with ⟨j, hj⟩
  have hjpos : 0 < j := by
    by_contra h
    have hj0 : j = 0 := Nat.eq_zero_of_not_pos h
    rw [hj, hj0, mul_zero] at hk
    omega
  have hjlt : j < q := by
    have hmul : m * j < m * q := by simpa [hj] using hk.2.1
    exact (Nat.mul_lt_mul_left hm).mp hmul
  exact ⟨j, by omega, hjlt, hj⟩

/-- Exact pre-extremal restricted-GCD valuation in the finite multiplier window,
with the prime-power condition expressed at the fixed prime `p`. -/
theorem restricted_gcd_valuation
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p (G (C p a s * q) (C p a s)) =
      a * s + if IsPositivePPower p q then 1 else 0 := by
  classical
  let m := C p a s
  have hmpos : 0 < m := by
    dsimp [m, C]
    exact cofactor_pos _ _
  have hrow : m < m * q := by
    nlinarith
  by_cases hpow : IsPositivePPower p q
  · simp only [if_pos hpow]
    obtain ⟨b, hb, hqpow⟩ := hpow
    have hlower :
        ∀ k, Admissible (m * q) m k →
          a * s + 1 ≤ padicValNat p ((m * q).choose k) := by
      intro k hk
      obtain ⟨j, hj1, hjq, rfl⟩ := scaled_admissible_index hmpos hk
      have hscale :=
        coefficient_scaling
          (p := p) (a := a) (s := s) (q := q) (j := j)
          hp ha hs hq2 hqQ hj1 hjq
      have hbase : 1 ≤ padicValNat p (q.choose j) := by
        rw [hqpow]
        exact pure_power_choose_lower hp hb hj1 (by simpa [hqpow] using hjq)
      rw [hscale]
      omega
    obtain ⟨j, hj1, hjqPow, hjval⟩ :=
      pure_power_choose_witness hp hb
    have hjq : j < q := by simpa [hqpow] using hjqPow
    let k := m * j
    have hk : Admissible (m * q) m k := by
      refine ⟨Nat.mul_pos hmpos (by omega), ?_, dvd_mul_right m j⟩
      dsimp [k]
      exact (Nat.mul_lt_mul_left hmpos).2 hjq
    have hkval :
        padicValNat p ((m * q).choose k) = a * s + 1 := by
      dsimp [k]
      rw [coefficient_scaling
        (p := p) (a := a) (s := s) (q := q) (j := j)
        hp ha hs hq2 hqQ hj1 hjq]
      rw [hqpow] at hjval
      rw [hjval]
    exact padicVal_G_eq_of_lower_bound_of_witness
      hmpos hrow hp hlower ⟨k, hk, hkval⟩
  · simp only [if_neg hpow, Nat.add_zero]
    have hlower :
        ∀ k, Admissible (m * q) m k →
          a * s ≤ padicValNat p ((m * q).choose k) := by
      intro k hk
      obtain ⟨j, hj1, hjq, rfl⟩ := scaled_admissible_index hmpos hk
      rw [coefficient_scaling
        (p := p) (a := a) (s := s) (q := q) (j := j)
        hp ha hs hq2 hqQ hj1 hjq]
      omega
    obtain ⟨j, hj1, hjq, hjval⟩ :=
      non_power_choose_witness hp hq2 hpow
    let k := m * j
    have hk : Admissible (m * q) m k := by
      refine ⟨Nat.mul_pos hmpos (by omega), ?_, dvd_mul_right m j⟩
      dsimp [k]
      exact (Nat.mul_lt_mul_left hmpos).2 hjq
    have hkval :
        padicValNat p ((m * q).choose k) = a * s := by
      dsimp [k]
      rw [coefficient_scaling
        (p := p) (a := a) (s := s) (q := q) (j := j)
        hp ha hs hq2 hqQ hj1 hjq]
      rw [hjval, Nat.add_zero]
    exact padicVal_G_eq_of_lower_bound_of_witness
      hmpos hrow hp hlower ⟨k, hk, hkval⟩

/-- Within `q ≤ p^a`, positive powers of `p` are exactly those whose
exponent lies in `1,…,a`. -/
theorem isPositivePPower_iff_bounded
    {p a q : ℕ} (hp : p.Prime) (hqQ : q ≤ p ^ a) :
    IsPositivePPower p q ↔
      ∃ b, 1 ≤ b ∧ b ≤ a ∧ q = p ^ b := by
  constructor
  · rintro ⟨b, hb, rfl⟩
    refine ⟨b, hb, ?_, rfl⟩
    exact (Nat.pow_le_pow_iff_right hp.one_lt).mp hqQ
  · rintro ⟨b, hb, _hba, hq⟩
    exact ⟨b, hb, hq⟩

/-- Exact Stage-3 row-by-row formula with the bounded exponent condition
spelled out as `1 ≤ b ≤ a`. -/
theorem restricted_gcd_valuation_bounded
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p (G (C p a s * q) (C p a s)) =
      a * s + if (∃ b, 1 ≤ b ∧ b ≤ a ∧ q = p ^ b) then 1 else 0 := by
  rw [restricted_gcd_valuation hp ha hs hq2 hqQ]
  rw [isPositivePPower_iff_bounded hp hqQ]

end PascalCofactors
