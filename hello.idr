module Main

main : IO () -- Type declarations are mandatory
main = do
  putStrLn "Hello world"

  -- There is no mapM
  -- I also cannot use `nums ` that is defined below, as in C
  sequence_ $ print <$> [1..10]

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


