import Data.Maybe

data Maybe a = Nothing | Just a

-- 1. Functor
instance Functor Maybe where
	fmap f (Just x) = Just (f x) 
	fmap f Nothing  = Nothing

-- 2. Applicative Functor
instance Applicative Maybe where
	pure x = Just x
	Just f <*> Just x = Just (f x)
	_ <*> _ = Nothing

-- 3. Monad
instance Monad Maybe where
	Nothing >>= f = Nothing
	Just val >>= f  = f val

