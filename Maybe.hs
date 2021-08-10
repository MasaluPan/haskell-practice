import System.IO ( stdout, hFlush )
import Data.Maybe ( fromMaybe )

password :: String -> Maybe String
password person = lookupUsers [("Justin", "1234"), ("Monica", "4321")]
    where
        lookupUsers [] = Nothing
        lookupUsers ((name, passwd):xs) =
            if name == person then Just passwd
                              else lookupUsers xs

main = do
    putStr "Input your name: "
    hFlush stdout
    person <- getLine
    putStrLn $ Data.Maybe.fromMaybe "Cannot find" (password person)