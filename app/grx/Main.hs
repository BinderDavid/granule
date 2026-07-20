module Main where

import System.Environment (getProgName)
import qualified Repl.Main as Repl
import qualified LSP.Main as LSP

main :: IO ()
main = do
    progName <- getProgName
    dispatch progName

dispatch :: String -> IO ()
dispatch "grepl" = Repl.main
dispatch "grls" = LSP.main >> pure ()
dispatch _ = do
    putStrLn "Do not call this multi-call binary directly, use provided symlinks"