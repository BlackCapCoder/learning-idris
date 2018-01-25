

implementation Functor (\a => t -> a) where
  map m x = m . x
