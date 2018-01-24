
partial
forever : Monad m => m a -> m a
forever m = do m; forever m

partial
main : IO ()
main = do
  putStrLn "Input two numbers"
  let answ = cast !getLine + cast !getLine
  putStrLn $ "=" ++ show answ ++ "\n"
