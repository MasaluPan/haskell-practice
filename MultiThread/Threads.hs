import Control.Concurrent
import System.IO

getGreeting :: IO String
getGreeting = do
	tid <- myThreadId
	let greeting = "Hello form " ++ show tid
	return $! greeting

threadHello :: MVar () -> Chan () -> IO ()
threadHello mutex endFlags = do
	greeting <- getGreeting
	
	takeMVar mutex
	putStrLn greeting
	putMVar mutex ()

	-- signal exiting 
	writeChan endFlags ()
main :: IO ()
main = do 
	hSetBuffering stdout NoBuffering
	let n = 10 
	mutex <- newEmptyMVar
	endFlags <- newChan
	mapM_ (const $ forkIO $ threadHello mutex endFlags) [1..n]
	putMVar mutex ()
	-- waiting for threads 
	mapM_ (const $ readChan endFlags) [1..n]
	return ()

	 
