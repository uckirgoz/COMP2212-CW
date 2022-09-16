import TurtleLexer
import TurtleGrammar
import System.Environment
import Control.Exception
import System.IO
import FinalisedTriples

main :: IO ()
main = catch main' noParse

main' = do
           args <- getArgs
           let file = head args
           testText <- readFile file
           putStrLn ("Parsing : " ++ testText )
           let parseTest = parseTurtle (alexScanTokens testText)
           let substituted = basePrefixSubst parseTest [] ""
           let expanded = expand substituted
           putStrLn ("As normalised triples: " ++ "\n")
           printByLine expanded

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

printByLine :: FinalTriples -> IO ()
printByLine [] = do print "done"
printByLine (x:xs) = do print x
                        printByLine xs
                        