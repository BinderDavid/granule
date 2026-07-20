module Main where

import System.Environment (getProgName)
import qualified Repl.Main as Repl
import qualified LSP.Main as LSP
import qualified Interpreter.Main as Interpreter
import qualified Compiler.Main as Compiler

-- | The "grx" is a so-called multi-call binary, similar to busybox or uutils.
-- This means that the various utilities such as "grepl", "grls" and "gr" are symlinked to a
-- single binary "grx" which dispatches on the program name that was used to invoke it.
--
-- This relies on the fact that `getProgName` will 
main :: IO ()
main = do
    progName <- getProgName
    dispatch progName

dispatch :: String -> IO ()
dispatch "gr" = Interpreter.main
dispatch "grc" = Compiler.main
dispatch "grepl" = Repl.main
dispatch "grls" = LSP.main >> pure ()
dispatch _ = do
    putStrLn "Do not call this multi-call binary directly, use provided symlinks"