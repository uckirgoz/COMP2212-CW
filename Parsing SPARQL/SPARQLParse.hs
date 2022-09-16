import SPARQLTokens
import SPARQLGrammar
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do  
           inp1 <- readFile "problem1.txt"
           inp2 <- readFile "problem2.txt"
           inp3 <- readFile "problem3.txt"
           inp4 <- readFile "problem4.txt"
           inp5 <- readFile "problem5.txt"
           putStrLn ("Parsing : "++ "\n" ++ inp1)
           let inp1Parse = parseSPARQL (alexScanTokens inp1)
           putStrLn ("Parsed as : "++ "\n" ++ show inp1Parse )
           putStrLn ("Parsing : " ++ "\n" ++ inp2)
           let inp2Parse = parseSPARQL (alexScanTokens inp2)
           putStrLn ("Parsed as : " ++ "\n" ++ (show inp2Parse))
           putStrLn ("Parsing : " ++ "\n" ++ inp3)
           let inp3Parse = parseSPARQL (alexScanTokens inp3)
           putStrLn ("Parsed as : " ++ "\n" ++ (show inp3Parse))
           putStrLn ("Parsing : " ++ "\n" ++ inp4)
           let inp4Parse = parseSPARQL (alexScanTokens inp4)
           putStrLn ("Parsed as : " ++ "\n" ++ (show inp4Parse))
           putStrLn ("Parsing : " ++ "\n" ++ inp5)
           let inp5Parse = parseSPARQL (alexScanTokens inp5)
           putStrLn ("Parsed as : " ++ "\n" ++ (show inp5Parse))

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()