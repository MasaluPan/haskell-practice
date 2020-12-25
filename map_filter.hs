-- map :: (a->b) -> [a] -> [b]
main :: IO ()
main = do 
	putStrLn "Map Function"
	print $ map (\x -> x+1) [1,2,3,4,5]
-- => [2,3,4,5,6]
	print $ map (\(x,y) -> x+y)[(1,2),(3,4),(5,6)]
-- => [3,7,11]
	putStrLn "Filter Function"
	print $ filter (\x -> x > 2)[1,2,3,4,5]
