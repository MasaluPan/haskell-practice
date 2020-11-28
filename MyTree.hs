data MyTree a =  MyLeaf a | MyNode (MyTree a) (MyTree a) 
    deriving (Eq, Show)

-- 1. Functor
instance Functor MyTree where
    fmap f (MyLeaf x) = MyLeaf (f x)
    fmap f (MyNode x y) = MyNode (fmap f x) (fmap f y)

-- 2. Applicative 
instance Applicative MyTree where
    pure = MyLeaf
    (MyLeaf f) <*> (MyLeaf x) = MyLeaf (f x)
    (MyLeaf f) <*> (MyNode x y) = MyNode (fmap f x) (fmap f y)

-- 3. Monad
instance Monad MyTree where
    return = MyLeaf
    (MyLeaf x) >>= f = f x
    (MyNode x y) >>= f = MyNode (x >>= f) (y >>= f)