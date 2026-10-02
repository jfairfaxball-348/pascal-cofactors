import PascalCofactors.Digits
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Tactic

namespace PascalCofactors

/-- Base-`p` digit sum is subadditive.  We derive this from Legendre's
factorial valuation formula so that the later coefficient theorem can use
Mathlib's digit-sum form of Kummer without hidden truncated-subtraction
assumptions. -/
private theorem digitSum_add_le
    {p x y : ℕ} (hp : p.Prime) :
    digitSum p (x + y) ≤ digitSum p x + digitSum p y := by
  letI : Fact p.Prime := ⟨hp⟩
  have hdiv : x.factorial * y.factorial ∣ (x + y).factorial :=
    Nat.factorial_mul_factorial_dvd_factorial_add x y
  have hpow :
      p ^ padicValNat p (x.factorial * y.factorial) ∣ x.factorial * y.factorial :=
    pow_padicValNat_dvd
  have hval :
      padicValNat p (x.factorial * y.factorial) ≤ padicValNat p ((x + y).factorial) := by
    exact
      (padicValNat_dvd_iff_le (Nat.factorial_ne_zero (x + y))).1
        (hpow.trans hdiv)
  have hmul :
      padicValNat p (x.factorial * y.factorial) =
        padicValNat p (x.factorial) + padicValNat p (y.factorial) :=
    padicValNat.mul (Nat.factorial_ne_zero x) (Nat.factorial_ne_zero y)
  rw [hmul] at hval
  have hscaled := Nat.mul_le_mul_left (p - 1) hval
  rw [Nat.mul_add,
    sub_one_mul_padicValNat_factorial (p := p) x,
    sub_one_mul_padicValNat_factorial (p := p) y,
    sub_one_mul_padicValNat_factorial (p := p) (x + y)] at hscaled
  change (p.digits (x + y)).sum ≤ (p.digits x).sum + (p.digits y).sum
  have hx := Nat.digit_sum_le p x
  have hy := Nat.digit_sum_le p y
  have hxy := Nat.digit_sum_le p (x + y)
  omega

/-- Exact Stage-3 finite-window additive coefficient scaling.

For `m = C p a s`, `2 ≤ q ≤ p^a`, and `1 ≤ j < q`,
the individual selected binomial coefficient gains exactly `a*s`
in `p`-adic valuation.  This is deliberately kept separate from
all restricted-GCD statements. -/
theorem coefficient_scaling
    {p a s q j : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (_hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a)
    (hj1 : 1 ≤ j) (hjq : j < q) :
    padicValNat p ((C p a s * q).choose (C p a s * j)) =
      a * s + padicValNat p (q.choose j) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hjqLe : j ≤ q := hjq.le
  have hjQ : j ≤ p ^ a := hjqLe.trans hqQ
  have hdiff1 : 1 ≤ q - j := by omega
  have hdiffQ : q - j ≤ p ^ a := by omega
  have hq1 : 1 ≤ q := by omega
  have hscaledLe : C p a s * j ≤ C p a s * q :=
    Nat.mul_le_mul_left (C p a s) hjqLe
  have hdiff :
      C p a s * q - C p a s * j = C p a s * (q - j) := by
    rw [Nat.mul_sub_left_distrib]
  have hScaled :=
    sub_one_mul_padicValNat_choose_eq_sub_sum_digits
      (p := p) (n := C p a s * q) (k := C p a s * j) hscaledLe
  change
    (p - 1) * padicValNat p ((C p a s * q).choose (C p a s * j)) =
      digitSum p (C p a s * j) +
        digitSum p (C p a s * q - C p a s * j) -
          digitSum p (C p a s * q) at hScaled
  rw [hdiff] at hScaled
  have hJ := digitSum_C_mul (p := p) (a := a) (s := s) (t := j)
    hp ha hj1 hjQ
  have hDiff := digitSum_C_mul (p := p) (a := a) (s := s) (t := q - j)
    hp ha hdiff1 hdiffQ
  have hQ := digitSum_C_mul (p := p) (a := a) (s := s) (t := q)
    hp ha hq1 hqQ
  rw [hJ, hDiff, hQ] at hScaled
  have hBase :=
    sub_one_mul_padicValNat_choose_eq_sub_sum_digits
      (p := p) (n := q) (k := j) hjqLe
  change
    (p - 1) * padicValNat p (q.choose j) =
      digitSum p j + digitSum p (q - j) - digitSum p q at hBase
  have hds := digitSum_add_le (p := p) (x := j) (y := q - j) hp
  have hjadd : j + (q - j) = q := Nat.add_sub_of_le hjqLe
  rw [hjadd] at hds
  have hMul :
      (p - 1) * padicValNat p ((C p a s * q).choose (C p a s * j)) =
        (p - 1) * (a * s + padicValNat p (q.choose j)) := by
    calc
      (p - 1) * padicValNat p ((C p a s * q).choose (C p a s * j)) =
          (digitSum p j + a * s * (p - 1)) +
            (digitSum p (q - j) + a * s * (p - 1)) -
              (digitSum p q + a * s * (p - 1)) := hScaled
      _ = a * s * (p - 1) +
          (digitSum p j + digitSum p (q - j) - digitSum p q) := by
            omega
      _ = a * s * (p - 1) +
          (p - 1) * padicValNat p (q.choose j) := by
            rw [← hBase]
      _ = (p - 1) * (a * s + padicValNat p (q.choose j)) := by
            ring
  have hpPred : 0 < p - 1 := Nat.sub_pos_of_lt hp.one_lt
  exact Nat.mul_left_cancel hpPred hMul

/-- Stage-3 selected coefficient, obtained from `coefficient_scaling` at `j = 1`. -/
theorem selected_coefficient
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p ((C p a s * q).choose (C p a s)) =
      a * s + padicValNat p q := by
  have h := coefficient_scaling
    (p := p) (a := a) (s := s) (q := q) (j := 1)
    hp ha hs hq2 hqQ (by omega) (by omega)
  simpa using h

private theorem padicValNat_le_exp_of_le_pow
    {p a q : ℕ} (hp : p.Prime) (hq1 : 1 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p q ≤ a := by
  letI : Fact p.Prime := ⟨hp⟩
  by_contra h
  have hv : a + 1 ≤ padicValNat p q := by omega
  have hq0 : q ≠ 0 := by omega
  have hdvd : p ^ (a + 1) ∣ q :=
    (padicValNat_dvd_iff_le hq0).2 hv
  have hpowLe : p ^ (a + 1) ≤ q :=
    Nat.le_of_dvd (by omega : 0 < q) hdvd
  have hpowLt : p ^ a < p ^ (a + 1) := by
    rw [pow_succ]
    have hpa : 0 < p ^ a := pow_pos hp.pos _
    nlinarith [hp.two_le]
  omega

private theorem padicValNat_eq_exp_iff
    {p a q : ℕ} (hp : p.Prime) (hq1 : 1 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p q = a ↔ q = p ^ a := by
  letI : Fact p.Prime := ⟨hp⟩
  constructor
  · intro hv
    have hq0 : q ≠ 0 := by omega
    have hdvd : p ^ a ∣ q :=
      (padicValNat_dvd_iff_le hq0).2 (by omega)
    apply Nat.le_antisymm hqQ
    exact Nat.le_of_dvd (by omega : 0 < q) hdvd
  · rintro rfl
    exact padicValNat.prime_pow a

/-- Every selected coefficient in the finite window is bounded by the
Stage-3 maximum `a * (s + 1)`. -/
theorem selected_coefficient_le_max
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p ((C p a s * q).choose (C p a s)) ≤
      a * (s + 1) := by
  rw [selected_coefficient (p := p) (a := a) (s := s) (q := q)
    hp ha hs hq2 hqQ]
  have hv := padicValNat_le_exp_of_le_pow hp (by omega : 1 ≤ q) hqQ
  have hExpand : a * (s + 1) = a * s + a := by ring
  rw [hExpand]
  omega

/-- Equality in the selected-coefficient bound occurs exactly at `q = p^a`. -/
theorem selected_coefficient_eq_max_iff
    {p a s q : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s)
    (hq2 : 2 ≤ q) (hqQ : q ≤ p ^ a) :
    padicValNat p ((C p a s * q).choose (C p a s)) =
        a * (s + 1) ↔
      q = p ^ a := by
  rw [selected_coefficient (p := p) (a := a) (s := s) (q := q)
    hp ha hs hq2 hqQ]
  have hExpand : a * (s + 1) = a * s + a := by ring
  rw [hExpand]
  constructor
  · intro h
    have hv : padicValNat p q = a := by omega
    exact (padicValNat_eq_exp_iff hp (by omega : 1 ≤ q) hqQ).1 hv
  · intro hq
    have hv : padicValNat p q = a :=
      (padicValNat_eq_exp_iff hp (by omega : 1 ≤ q) hqQ).2 hq
    omega

/-- Exact selected-coefficient maximum and unique argmax on
`2 ≤ q ≤ p^a`, in a pointwise form that records both the witness and
the complete equality characterization. -/
theorem selected_coefficient_maximum_unique
    {p a s : ℕ} (hp : p.Prime) (ha : 1 ≤ a) (hs : 1 ≤ s) :
    (∀ q, 2 ≤ q → q ≤ p ^ a →
      padicValNat p ((C p a s * q).choose (C p a s)) ≤ a * (s + 1)) ∧
    padicValNat p ((C p a s * p ^ a).choose (C p a s)) = a * (s + 1) ∧
    (∀ q, 2 ≤ q → q ≤ p ^ a →
      (padicValNat p ((C p a s * q).choose (C p a s)) = a * (s + 1) ↔
        q = p ^ a)) := by
  have hQ2 : 2 ≤ p ^ a := by
    calc
      2 ≤ p := hp.two_le
      _ ≤ p ^ a := by
        simpa [pow_one] using Nat.pow_le_pow_right hp.pos ha
  refine ⟨?_, ?_, ?_⟩
  · intro q hq2 hqQ
    exact selected_coefficient_le_max hp ha hs hq2 hqQ
  · exact (selected_coefficient_eq_max_iff hp ha hs hQ2 le_rfl).2 rfl
  · intro q hq2 hqQ
    exact selected_coefficient_eq_max_iff hp ha hs hq2 hqQ

end PascalCofactors
