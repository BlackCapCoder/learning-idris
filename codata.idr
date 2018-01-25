
codata Lst : Type -> Type where
  Cons : (t : a) -> Lst a -> Lst a
  Empty : Lst a
