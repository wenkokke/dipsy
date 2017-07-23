open import Relation.Binary.PropositionalEquality using (_≡_; refl)

module Dipsy.Polarity where

data Polarity : Set where
  pos : Polarity
  neg : Polarity

open import Algebra.FunctionProperties {A = Polarity} _≡_

flip : Polarity → Polarity
flip pos = neg
flip neg = pos

flip-inv : Involutive flip
flip-inv pos = refl
flip-inv neg = refl
