--this is the main interpreter file
import Evaluator
import SPARQLGrammar
import SPARQLTokens

import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do args <- getArgs
           let sparqlFile = head args
           sparqlText <- readFile sparqlFile
           --putStrLn (show (parseSPARQL (alexScanTokens sparqlText)))
           let parsedSparql = parseSPARQL (alexScanTokens sparqlText) --change name of parseSPARQL to the right function & import it
           evalSparql (parsedSparql)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

                          