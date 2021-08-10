
fibonacciLt :: Int -> [Int]
fibonacciLt n = 
    [ fibonacci x | x <- [0 .. n]]
    where fibonacci 0 = 0
          fibonacci 1 = 1
          fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main :: IO()
main = do
    print (fibonacciLt 10)