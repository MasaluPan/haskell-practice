data MyEither a b = MyLeft a | MyRight b | None
    deriving (Eq, Show)

-- 1. Functor 
instance Functor (MyEither l) where
    fmap _ (MyLeft l) = MyLeft l
    fmap f (MyRight r) = MyRight (f r)
    fmap f (None) = None

-- 2. Applicative
instance Applicative (MyEither l) where
    pure = MyRight
    (MyRight f) <*> x = fmap f x
    (MyLeft l)  <*> _ = MyLeft l
    None        <*> _ = None

-- 3. Monad
instance Monad (MyEither l) where   
    (MyRight r) >>= f = f r
    (MyLeft l)  >>= _ = MyLeft l
    None >>= _ = None 
