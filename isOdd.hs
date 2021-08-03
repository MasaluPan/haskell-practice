import System.IO


main = do 
    putStr "Please in put an Interger:"
    hFlush stdout 
    input <- getLine 
    let number = read input::Int    -- read function 可以換型別
        result = if number `mod` 2 == 0 then "Even" else "Odd"
    putStrLn (input ++ " is " ++ result ++ "!!")
