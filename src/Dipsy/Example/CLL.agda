module Dipsy.Example.CLL where

open import Data.Nat using (ℕ)
open import Data.Vec using (Vec; _∷_; [])
open import Dipsy.Polarity using (Polarity; flip) renaming (pos to +; neg to -)

mutual
  Op₀ : (r : Polarity) → Set
  Op₀ r = Op [] r
  Op₁ : (a r : Polarity) → Set
  Op₁ a r = Op (a ∷ []) r
  Op₂ : (a₁ a₂ r : Polarity) → Set
  Op₂ a₁ a₂ r = Op (a₁ ∷ a₂ ∷ []) r

  data Op : {n : ℕ} → Vec Polarity n → Polarity → Set where
    ″⊥″ : Op₀ -
    ″𝟏″ : Op₀ +
    ″⊤″ : Op₀ -
    ″𝟎″ : Op₀ +
    ″¬″ : {p : Polarity} → Op₁ (flip p) p
    ″⅋″ : Op₂ - - -
    ″⊗″ : Op₂ + + +
    ″&″ : Op₂ - - -
    ″⊕″ : Op₂ + + +

open import Dipsy.Base Op Op

pattern ⊥ = op ″⊥″ []
pattern 𝟏 = op ″𝟏″ []
pattern ⊤ = op ″⊤″ []
pattern 𝟎 = op ″𝟎″ []
pattern ¬_ A = op ″¬″ (A ∷ [])
pattern _⅋_ A B = op ″⅋″ (A ∷ B ∷ [])
pattern _⊗_ A B = op ″⊗″ (A ∷ B ∷ [])
pattern _&_ A B = op ″&″ (A ∷ B ∷ [])
pattern _⊕_ A B = op ″⊕″ (A ∷ B ∷ [])

