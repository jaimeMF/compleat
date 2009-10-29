import Completer (run)
import Numeric (readDec)
import System (getArgs)
import System.Environment (getEnv)
import Tokenize (tokenize)
import Usage (fromFile)

main = do
    line <- getInput
    args <- getArgs
    let command = args !! 1
    completer <- fromFile (head args) command
    suggestions <- run completer (tokenize line)
    mapM_ putStrLn suggestions

getInput :: IO String
getInput = do
    line  <- getEnv "COMP_LINE"
    point <- getEnv "COMP_POINT"
    let [(n,[])] = readDec point
    return (take n line)
