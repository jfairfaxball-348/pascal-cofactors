import PascalCofactors.Threshold
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Tactic

namespace PascalCofactors

/-- Sum of the base-`p` digits. -/
def digitSum (p n : ℕ) : ℕ := (Nat.digits p n).sum

@[simp] theorem digitSum_zero (p : ℕ) : digitSum p 0 = 0 := by simp [digitSum]

/-- Appending a higher block at the `p^a` boundary adds digit sums. -/
theorem digitSum_add_pow_mul
    {p a x y : ℕ} (hp : p.Prime) (hx : x < p ^ a) :
    digitSum p (x + p ^ a * y) = digitSum p x + digitSum p y := by
  by_cases hy : y = 0
  · subst y
    simp [digitSum]
  have hlen : (Nat.digits p x).length ≤ a :=
    (Nat.digits_length_le_iff hp.one_lt x).2 hx
  let k := a - (Nat.digits p x).length
  have hk : (Nat.digits p x).length + k = a := by
    dsimp [k]
    exact Nat.add_sub_of_le hlen
  have hdigits :=
    Nat.digits_append_zeroes_append_digits
      (b := p) (k := k) (m := y) (n := x) hp.one_lt (Nat.pos_of_ne_zero hy)
  rw [hk] at hdigits
  unfold digitSum
  rw [← hdigits]
  simp

theorem digitSum_pow_mul
    {p a y : ℕ} (hp : p.Prime) :
    digitSum p (p ^ a * y) = digitSum p y := by
  have h0 : 0 < p ^ a := pow_pos hp.pos _
  simpa using digitSum_add_pow_mul (p := p) (a := a) (x := 0) (y := y) hp h0

@[simp] theorem digitSum_one {p : ℕ} (hp : p.Prime) : digitSum p 1 = 1 := by
  simp [digitSum, Nat.digits_of_lt p 1 (by decide) hp.one_lt]

@[simp] theorem digitSum_pow {p a : ℕ} (hp : p.Prime) : digitSum p (p ^ a) = 1 := by
  simpa using (digitSum_pow_mul (p := p) (a := a) (y := 1) hp)

private theorem complement_decomp
    {p a u : ℕ} (hp : p.Prime) (hu : u < p ^ (a + 1)) :
    p ^ (a + 1) - 1 - u =
      (p - 1 - u % p) + p * (p ^ a - 1 - u / p) := by
  have hr : u % p < p := Nat.mod_lt _ hp.pos
  have hv : u / p < p ^ a := by
    rw [Nat.div_lt_iff_lt_mul hp.pos]
    simpa [pow_succ, Nat.mul_comm] using hu
  have hdecomp : u % p + p * (u / p) = u := Nat.mod_add_div u p
  rw [pow_succ, Nat.mul_comm (p ^ a) p]
  rw [Nat.mul_sub_left_distrib, Nat.mul_sub_left_distrib]
  omega

/-- Digitwise complement under `p^a-1` (Stage-3 Lemma 3.1). -/
theorem digitSum_complement
    {p a u : ℕ} (hp : p.Prime) (hu : u < p ^ a) :
    digitSum p (p ^ a - 1 - u) + digitSum p u = a * (p - 1) := by
  induction a generalizing u with
  | zero =>
      have hu0 : u = 0 := by simpa using hu
      subst u
      simp [digitSum]
  | succ a ih =>
      have hr : u % p < p := Nat.mod_lt _ hp.pos
      have hv : u / p < p ^ a := by
        rw [Nat.div_lt_iff_lt_mul hp.pos]
        simpa [pow_succ, Nat.mul_comm] using hu
      have hcomp := complement_decomp (p := p) (a := a) (u := u) hp
        (by simpa [Nat.succ_eq_add_one] using hu)
      have huDecomp : u = u % p + p * (u / p) := (Nat.mod_add_div u p).symm
      rw [hcomp, huDecomp]
      rw [digitSum_add_pow_mul (p := p) (a := 1) hp (by simpa using (Nat.sub_lt hp.pos hr))]
      rw [digitSum_add_pow_mul (p := p) (a := 1) hp (by simpa using hr)]
      have hih := ih hp hv
      have hrle : u % p ≤ p - 1 := by omega
      have hlow : (p - 1 - u % p) + u % p = p - 1 := Nat.sub_add_cancel hrle
      simp only [pow_one] at *
      omega

theorem cofactor_le_pow_even
    {Q s : ℕ} (hQ : 2 ≤ Q) :
    cofactor Q s ≤ Q ^ (2 * s) := by
  by_cases hs : s = 0
  · subst s
    simp
  exact (cofactor_upper hQ (Nat.one_le_iff_ne_zero.mpr hs)).le

private theorem high_block_eq
    {Q t : ℕ} (ht1 : 1 ≤ t) (htQ : t ≤ Q) :
    t * (Q - 1) = (Q - t) + Q * (t - 1) := by
  rw [Nat.mul_sub_left_distrib, Nat.mul_sub_left_distrib]
  omega

private theorem digitSum_high_block
    {p a t : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (ht1 : 1 ≤ t) (htQ : t < p ^ a) :
    digitSum p (t * (p ^ a - 1)) = a * (p - 1) := by
  let Q := p ^ a
  have hQpos : 0 < Q := pow_pos hp.pos _
  have htQle : t ≤ Q := htQ.le
  have hQt : Q - t < Q := Nat.sub_lt hQpos (by omega)
  have htPred : t - 1 < Q := by omega
  rw [high_block_eq ht1 htQle]
  have hsplit :
      digitSum p ((Q - t) + Q * (t - 1)) =
        digitSum p (Q - t) + digitSum p (t - 1) := by
    dsimp [Q]
    exact digitSum_add_pow_mul hp hQt
  rw [hsplit]
  have hcomp : Q - t = Q - 1 - (t - 1) := by omega
  rw [hcomp]
  dsimp [Q]
  exact digitSum_complement hp htPred

/-- Stage-3 digit-sum shift for `1 ≤ t < Q`. -/
theorem digitSum_C_mul_lt
    {p a s t : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (ht1 : 1 ≤ t) (htQ : t < p ^ a) :
    digitSum p (C p a s * t) =
      digitSum p t + a * s * (p - 1) := by
  induction s with
  | zero =>
      simp [C, cofactor]
  | succ s ih =>
      let Q := p ^ a
      have hQ2 : 2 ≤ Q := by
        calc
          2 ≤ p := hp.two_le
          _ ≤ p ^ a := by
            simpa [Q, pow_one] using Nat.pow_le_pow_right hp.pos ha
      have hlow : C p a s * t < Q ^ (2 * s + 1) := by
        have hC := cofactor_le_pow_even (Q := Q) (s := s) hQ2
        have hmul := Nat.mul_lt_mul_of_le_of_lt hC htQ
        simpa [C, Q, pow_succ, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] using hmul
      have hExp : Q ^ (2 * s + 1) = p ^ (a * (2 * s + 1)) := by
        simp [Q, ← pow_mul]
      have hRec :
          C p a (s + 1) * t =
            C p a s * t + Q ^ (2 * s + 1) * (t * (Q - 1)) := by
        simp only [C, cofactor_succ]
        ring
      rw [show Nat.succ s = s + 1 by omega, hRec, hExp]
      rw [digitSum_add_pow_mul hp (by simpa [hExp] using hlow)]
      rw [ih]
      have hhigh := digitSum_high_block hp ha ht1 htQ
      dsimp [Q]
      rw [hhigh]
      ring

/-- Full Stage-3 finite-window digit-sum mechanism, including `t=Q`. -/
theorem digitSum_C_mul
    {p a s t : ℕ} (hp : p.Prime) (ha : 1 ≤ a)
    (ht1 : 1 ≤ t) (htQ : t ≤ p ^ a) :
    digitSum p (C p a s * t) =
      digitSum p t + a * s * (p - 1) := by
  by_cases hlt : t < p ^ a
  · exact digitSum_C_mul_lt hp ha ht1 hlt
  have htEq : t = p ^ a := by omega
  subst t
  rw [digitSum_pow_mul hp]
  have hQ2 : 2 ≤ p ^ a := by
    calc
      2 ≤ p := hp.two_le
      _ ≤ p ^ a := by
        simpa [pow_one] using Nat.pow_le_pow_right hp.pos ha
  have hOneLt : (1 : ℕ) < p ^ a := by omega
  have hOne := digitSum_C_mul_lt (p := p) (a := a) (s := s) (t := 1)
    hp ha (by omega) hOneLt
  simpa [digitSum_one hp] using hOne

end PascalCofactors
