open import Data.Fin using (Fin)
open import Data.Nat using (ℕ; _+_)
open import Data.Vec using (Vec; []; _∷_; _++_)
open import Dipsy.Polarity

module Dipsy.Base
  (FOp : {n : ℕ} (as : Vec Polarity n) (b : Polarity) → Set)
  (SOp : {n : ℕ} (as : Vec Polarity n) (b : Polarity) → Set)
  where

open import Dipsy.Form FOp public
open import Dipsy.Struct FOp SOp public

Res : Set
Res = {n₁ n₂ : ℕ}
    → {as₁ : Vec Polarity n₁}
    → {as₂ : Vec Polarity n₂}
    → {b : Polarity}
    → SOp (as₁ ++ flip b ∷ as₂) b
    → Context (flip b) b

-- we need contexts with n holes if we want to encode structuralisation properly..
-- those are functions...

