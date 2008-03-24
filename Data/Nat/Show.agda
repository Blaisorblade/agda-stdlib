------------------------------------------------------------------------
-- Showing natural numbers
------------------------------------------------------------------------

module Data.Nat.Show where

open import Data.Nat
open import Relation.Nullary
import Data.String as String
open String using (String)
open import Data.Digit
open import Data.Function
open import Data.List

-- showInBase b n is a string containing the representation of n in
-- base b.

showInBase : (base : ℕ)
             {base≥1 : True (1 ≤? base)}
             {base≤16 : True (base ≤? 16)} ->
             ℕ -> String
showInBase base {base≥1} {base≤16} =
  String.fromList ∘
  map (showDigit {base≤16 = base≤16}) ∘
  reverse ∘
  digits base {base≥1 = base≥1}

-- show n is a string containing the decimal expansion of n (starting
-- with the most significant digit).

show : ℕ -> String
show = showInBase 10