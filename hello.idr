module Main

main : IO () -- Type declarations are mandatory
main = do
  putStrLn "Hello, world!"

  -- I cannot use `nums` defined below, as in C
  traverse_ print [1..9]


-- Idris is not lazy by default, but can still have lazy data structures
nats : Stream Integer
nats = [0..]

nums : List Integer
nums = take 10 nats

-- map works on all functors, there is no fmap!
justTwo : Maybe Integer
justTwo = map succ $ Just 1

-- List comprihensions work
compr : List Integer
compr = [ x*2 | x <- [1..10], x > 5 ]

-- And they generalize for monads, nice!
compr' : Maybe ()
compr' = [ x | x <- Nothing ]

-- Idris have type aliases too- they are first class citizens
Foo : Type
Foo = Integer

-- Named holes instead of undefined
magicNumber : Nat
magicNumber = ?todo

-- You can refer to things defined later in the file with mutual
mutual
  even : Nat -> Bool
  even Z = True
  even (S k) = odd k

  odd : Nat -> Bool
  odd Z = False
  odd (S k) = even k

-- snd (a,b,c,..) = (b,c,..)
tuple : (Nat, Nat)
tuple = snd (1,2,3)

-- Idris has sugar for do notation- sugar²
adds : Monad m => m Nat -> m Nat -> m Nat
adds a b = do
  x <- a
  y <- b
  pure $ x + y

adds' : Monad m => m Nat -> m Nat -> m Nat
adds' a b = pure $ !a + !b

calculator : IO ()
calculator = do
  putStrLn "Input two numbers"
  print $ cast !getLine + cast !getLine
