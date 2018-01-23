{- Idris allows you to make turing complete (not total)
   programs with the use of the partial keyword -}
module BrainFuck
import Zipper

mutual
  Program : Type
  Program = List Op

  data Op = Inc | Dec | Left | Right | Loop Program

Memory : Type
Memory = Zipper Int

mutual
  partial
  evalOp : Memory -> Op -> Memory
  evalOp m Left     = left  m
  evalOp m Right    = right m
  evalOp m Inc      = update succ m
  evalOp m Dec      = update pred m
  evalOp m (Loop p) with (cursor m)
    | 0 = m
    | _ = let m' = evalProgram m p
          in if cursor m' == 0
                then m'
                else evalOp m' (Loop p)

  partial
  evalProgram : Memory -> Program -> Memory
  evalProgram m [] = m
  evalProgram m (x::xs) = evalProgram (evalOp m x) xs

------------

num : Nat -> Program
num n = replicate n Inc

mult : Program -> Op
mult p = Loop $ Dec :: Right :: p ++ [Left]

testProg : Program
testProg = concat
  [ num 10
  , pure . mult $ num 6
  , pure Right
  , num 5
  ]

memory : Memory
memory = Zip [] 0 $ repeat 0

partial
test : Memory
test = evalProgram memory testProg
