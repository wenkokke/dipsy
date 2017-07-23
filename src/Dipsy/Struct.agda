open import Data.Fin using (Fin; suc; zero)
open import Data.Nat using (ℕ)
open import Data.Vec using (Vec; []; _∷_; map)
open import Dipsy.Polarity renaming (pos to +; neg to -)

module Dipsy.Struct
  (FOp : {n : ℕ} (as : Vec Polarity n) (b : Polarity) → Set)
  (SOp : {n : ℕ} (as : Vec Polarity n) (b : Polarity) → Set)
  where

open import Dipsy.Form FOp

mutual
  data Struct : (b : Polarity) → Set where
    ·_· : {b : Polarity} → Form → Struct b
    op  : {n : ℕ} {as : Vec Polarity n} {b : Polarity}
        → SOp as b → Structs as → Struct b

  data Structs : {n : ℕ} (as : Vec Polarity n) → Set where
    []  : Structs []
    _∷_ : {n : ℕ} {a : Polarity} {as : Vec Polarity n}
        → Struct a → Structs as → Structs (a ∷ as)

mutual
  data Context : (b c : Polarity) → Set where
    [] : {b : Polarity} → Context b b
    op : {n : ℕ} {as : Vec Polarity n} {b c : Polarity}
       → SOp as c → (i : Fin n) → Contexts as b i → Context b c

  data Contexts : {n : ℕ} (as : Vec Polarity n) (b : Polarity) (i : Fin n) → Set where
    _<∷_ : {n : ℕ} {b c : Polarity} {as : Vec Polarity n}
         → Context b c → Structs as → Contexts (c ∷ as) b zero
    _∷>_ : {n : ℕ} {a b : Polarity} {as : Vec Polarity n} {i : Fin n}
         → Struct a → Contexts as b i → Contexts (a ∷ as) b (suc i)
