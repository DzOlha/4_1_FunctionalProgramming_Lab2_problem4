module Main where

import GHC.Conc ( numCapabilities, pseq )
import Data.Time.Clock (diffUTCTime, getCurrentTime)
import GraphPath (findPaths)
import Lib

main :: IO ()
main = do    
    putStrLn "Sequential"
    start <- getCurrentTime
    print $ integral (0, 500*3.14159) (\x -> x*sin x) False
    end <- getCurrentTime
    putStrLn $ show (end `diffUTCTime` start) ++ " elapsed."
    putStrLn "number of cores: 1"

    putStrLn "Parallel"
    start <- getCurrentTime
    print $ integral (0, 500*3.14159) (\x -> x*sin x) True
    
    end <- getCurrentTime
    putStrLn $ show (end `diffUTCTime` start) ++ " elapsed."
    putStrLn $ "number of cores: " ++ show numCapabilities
    
-- ---------------------   GraphPth - problem 4 -------------------------------
    let graph = [[1, 3, 4], [0, 2, 3], [1, 3], [0, 1, 2, 4], [0, 3]]
        print $ findPaths graph 0 1