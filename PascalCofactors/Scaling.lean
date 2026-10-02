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

end PascalCofactors
