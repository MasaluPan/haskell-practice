-- Mergesort

divide :: [Int] -> ([Int], [Int])
divide []  = ([], [])
divide [x] = ([x], [])
divide (x:y:xs) = ((x:ys), (y:zs)) 
    where (ys, zs) = divide xs

merge :: [Int] -> [Int] -> [Int]
merge xs [] = xs
merge [] xs = xs
merge (x:xs) (y:ys) | x < y = x:(merge xs (y:ys))
                    | otherwise = y:(merge (x:xs) ys)
    
msort :: [Int] -> [Int]
msort []  = []
msort [x] = [x]
msort xs = merge (msort ys) (msort zs)
    where (ys, zs) = divide xs 
