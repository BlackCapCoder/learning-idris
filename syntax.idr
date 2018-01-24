
partial
takeWhile' : (a -> Bool) -> Stream a -> List a
takeWhile' f (x::xs) = if not (f x) then [] else x :: takeWhile' f xs

syntax for "("{x}"="[initial]";"[cond]";"[step]")" "{"[body]"}"
  = traverse_  (\x => body)
  . takeWhile' (\x => cond)
  $ iterate    (\x => step) initial

syntax [n]"++" = n+1

partial
main : IO ()
main = for (x=0; x<3; x++) {
         for (y=0; y<3; y++) {
           putStrLn $ show (x, y)
         }
       }

