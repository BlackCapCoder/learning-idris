module Zipper

%access export

public export
record Zipper a where
  constructor Zip
  lefts  : List a
  cursor : a
  rights : Stream a

left : Zipper a -> Zipper a
left (Zip (l::ls) c r) = Zip ls l (c::r)
left x = x

right : Zipper a -> Zipper a
right (Zip l c (r::rs)) = Zip (c::l) r rs
right x = x

update : (a -> a) -> Zipper a -> Zipper a
update f (Zip l c r) = Zip l (f c) r
