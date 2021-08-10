class Comp a where
    comp :: a -> a -> Integer 

instance Comp Integer where
    comp x y = x - y

instance (Comp a) => Comp (Maybe a) where
    comp (Just x) (Just y) = comp x y
    comp (Just _) Nothing = 1
    comp Nothing (Just _) = -1
    comp Nothing Nothing = 0

quicksort :: Comp a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort small ++ [x] ++ quicksort large
    where small = [y | y <- xs, comp x y >= 0]
          large = [y | y <- xs, comp x y < 0 ]
