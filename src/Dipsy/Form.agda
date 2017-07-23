open import Data.Nat using (ℕ)
open import Data.Vec using (Vec; []; _∷_; map)
open import Dipsy.Polarity renaming (pos to +; neg to -)

module Dipsy.Form
  (FOp : {n : ℕ} (as : Vec Polarity n) (b : Polarity) → Set)
  where

data Form : Set where
  op : {n : ℕ} {as : Vec Polarity n} {b : Polarity}
     → FOp as b → Vec Form n → Form
