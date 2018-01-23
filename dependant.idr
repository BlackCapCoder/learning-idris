import Data.Vect
import Data.Fin

-- This is really cool, you can have the type system force
-- you to use the correct datatype
mkList : (lengthKnown : Bool)
      -> (if lengthKnown then Nat else ())
      -> (Type -> Type)
mkList False _ = List
mkList True  l = Vect l

mkList' : (length : Maybe Nat) -> Type -> Type
mkList' Nothing  = List
mkList' (Just l) = Vect l


ixtst : Nat
ixtst = index (FS (FS FZ)) [1,2,3,4]

isEmpty : Vect n a -> Bool
isEmpty {n = Z} _   = True
isEmpty {n = S k} _ = False

-- div' : (x : Int) -> (y : Int) -> { auto p : y/=0 = True } -> Int
-- div' x y = div x y


test : IO Type
test = do
  putStrLn "lorem"
  pure Nat

test' : test -> Nat
test' _ = 2

main : IO ()
main = do
  putStrLn "hi"
  -- Fortunately it doesn't compile with this
  -- let x = test' (pure Nat)
  pure ()
