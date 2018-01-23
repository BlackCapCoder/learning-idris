module Main

main : IO () -- Type declarations are mandatory
main = do
  putStrLn "Hello world"

  -- I cannot use `nums` defined below, as in C
  traverse_ print [1..9]

-- Idris is not lazy by default, but can still have lazy data structures
nats : Stream Integer
nats = [0..]

nums : List Integer
nums = take 10 nats

-- Apparently it is also total (and consiquently not turing complete)
-- So this will not compile
-- infinity : Integer
-- infinity = last nats

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
