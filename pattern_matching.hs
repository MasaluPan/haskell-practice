

lucky :: (Integral a) => a -> String
lucky 7 = "This is the lucky number: 7"
lucky _ = "Sorry, you're out of luck pal"

-- pattern matching 次序很重要
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- tuples 
addVector :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x1, y1) (x2, y2) = ( x1 + x2, y1 + y2)

-- implement own head
head' :: [a] -> a
head' [] = error "Can't call head on empty list, dummy"
head' (x:_) = x 

-- length 
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- sum
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- try @
capital :: String -> String
capital "" = "Empty string"
capital all@(x:xs) = "The first letter of " ++ all ++  " is " ++ [x]

-- guards! 
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're weight"
    | bmi <= 25.0 = "You're supposedly normal."
    | bmi <= 30.0 = "You're fat! Loose some weight!"
    | otherwise = "You're a whale."

-- where
bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal."
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / (height ^ 2)
          skinny = 18.5
          normal = 25.0
          fat = 30.0
          -- (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- guards for comprare
myCompare :: (Ord a) => a -> a -> Ordering
myCompare a b
    | a > b = GT
    | a == b = EQ
    | a < b = LT


{-
case expression of pattern -> result
    pattern -> result
    pattern -> result  
-}

-- pattern matching 只能被使用在函數定義， case expressions 可被使用所有地方
describleList :: [a] -> String
describleList xs = "list: " ++ case xs of [] -> "empty list."
                                          [a] -> "single item list."
                                          xs -> "a longer list."

