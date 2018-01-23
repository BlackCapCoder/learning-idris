-- The compiler told me that return is only there for people comming from
-- Haskell, and that pure == return. I like that
main : IO ()
main = pure () -- return ()

-- Church numerals are the hello world of logical programming languages
-- Nat is in the Prelude
data Nat' = Z' | S' Nat'

succ' : Nat' -> Nat'
succ' = S'

plus' : Nat' -> Nat' -> Nat'
plus' Z'     y = y
plus' (S' x) y = plus' x $ S' y

-- This would simply be dot in lambda calculus
mult' : Nat' -> Nat' -> Nat'
mult' Z'     y = Z'
mult' (S' x) y = plus' y $ mult' x y

pred' : Nat' -> Nat'
pred' Z'     = Z' -- We cannot go any lower
pred' (S' x) = x

minus' : Nat' -> Nat' -> Nat'
minus' Z'   _  = Z'
minus' x    Z' = x
minus' x (S' y) = pred' x `minus'` y

-- The compiler complained that it cannot prove this is total
-- I know about the halting problem, but this trivially total!
-- minus' x y = minus' (pred' x) (pred' y)


-- Some numbers to play with in the repl
zero : Nat'
one  : Nat'
two  : Nat'
four : Nat'
five : Nat'

zero = Z'
one  = succ' zero
two  = plus' one one
four = mult' two two
five = plus' one four


-- Nat is apparently optimized to actual numbers
fact : Nat' -> Nat'
fact Z' = S' Z'
fact x@(S' y) = mult' x $ fact y

even : Nat' -> Bool
even Z'          = True
even (S' Z')     = False
even (S' (S' x)) = even x

toInt : Nat' -> Integer
toInt Z' = 0
toInt (S' x) = 1 + toInt x

-- Not sure how to tell idris that x>=0
-- fact' : (x : Integer) -> Integer
-- fact' 0 = 1
-- fact' n = n * fact' (n-1)
