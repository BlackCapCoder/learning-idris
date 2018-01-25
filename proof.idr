append : List a -> List a -> List a
append [] ys = ys
append (x :: xs) ys = x :: append xs ys

test1 : (x : List a) -> append x [] = x
test1 []        = Refl
test1 (x :: xs) = rewrite test1 xs in Refl


test2 : (x : Nat) -> (y : Nat) -> (plus x y > y) = True
test2 x y = ?test2_rhs
