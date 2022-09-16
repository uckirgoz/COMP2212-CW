module Evaluator where

import TurtleLexer
import TurtleGrammar
import FinalisedTriples
import FilteringTriples

import SPARQLGrammar

import System.Environment
import Control.Exception
import System.IO
import System.IO.Unsafe
import Data.List

evalSparql :: Decleration -> IO ()
evalSparql input = conversion input

conversion :: Decleration -> IO ()
conversion (NoDecl x) = do writeFile "out.ttl" "["
                           fromNormalisedSPARQL x
                           appendFile "out.ttl" "]"
                           trpls <- readFile "out.ttl"
                           let remDups = removeDuplicates (read trpls)
                           let sorted = sort remDups
                           prettyPrint sorted
--conversion x = fromNormalisedSPARQL (normalise x)

--normalise :: Decleration -> Exp
--who cares atm, is supposed to normalise the AST by filling in the base/prefix stuff


fromNormalisedSPARQL :: Exp -> IO ()
fromNormalisedSPARQL (Union e1 e2) = do fromNormalisedSPARQL e1
                                        appendFile "out.ttl" ", "
                                        fromNormalisedSPARQL e2
fromNormalisedSPARQL (Construct genTrip dataClause whereClause) = do getTriples genTrip dataClause whereClause


--FROM CLAUSE ==> WHOLE IO LOOP
-------------
getTriples :: GenerateTriple -> DataProposition -> WhereProposition -> IO ()
getTriples genTrip (FileCombination f1 f2) whereProp = do getTriples genTrip f1 whereProp
                                                          appendFile "out.ttl" ", "
                                                          getTriples genTrip f2 whereProp
getTriples genTrip (FromFile fileName) whereProp = do filetext <- readFile fileName
                                                      let trips = loadTriples filetext
                                                      let filtedTrips = filterTriples whereProp trips genTrip
                                                      let outTrips = createTriples genTrip filtedTrips
                                                      let sorted = sort outTrips
                                                      let removeDups = removeDuplicates sorted
                                                      appendFile "out.ttl" (uglyPrintTrpls removeDups)


--WHERE CLAUSE
--------------
filterTriples :: WhereProposition -> FinalTriples -> GenerateTriple -> FinalTriples
--filterTriples (WhereWithFilter brac filter) trips = finish this later maybe loser???? oh, i have finished it. oh well, comment stays
filterTriples (WhereWithFilter brac filter) trips genTrip = filterClause (filterTriples (Where brac) trips genTrip) (getVariables brac) filter
filterTriples (Where (WhereBracket whereStates)) trips genTrip = applyWhereStates whereStates trips

filterClause :: FinalTriples -> Whereiables -> Filter -> FinalTriples
filterClause trips vars (Regex var boolIntExp) | not (contains var (map snd vars)) = trips
                                               | var == (snd (head vars)) = makeSureTheyPass trips 0 boolIntExp --subject must pass
                                               | var == (snd (head (tail vars))) = makeSureTheyPass trips 1 boolIntExp  --predicate must pass
                                               | otherwise = makeSureTheyPass trips 2 boolIntExp  --object must pass
filterClause currentTrips currentVars (Ask (FromFile s) (Where wb)) = filterAgainstThese currentTrips currentVars (loadTriples fileText) (getVariables wb)
    where fileText = loadFile s
filterClause trips _ _ = trips

makeSureTheyPass :: FinalTriples -> Int -> BooleanIntExp -> FinalTriples
makeSureTheyPass [] _ _ = []
makeSureTheyPass ((FTrpl subj pred obj):trips) 0 boolInt | compareBoolInt boolInt subj = (FTrpl subj pred obj) : makeSureTheyPass trips 0 boolInt
                                                         | otherwise = makeSureTheyPass trips 0 boolInt
makeSureTheyPass ((FTrpl subj pred obj):trips) 1 boolInt | compareBoolInt boolInt pred = (FTrpl subj pred obj) : makeSureTheyPass trips 1 boolInt
                                                         | otherwise = makeSureTheyPass trips 1 boolInt
makeSureTheyPass ((FTrpl subj pred obj):trips) 2 boolInt | compareBoolInt boolInt obj = (FTrpl subj pred obj) : makeSureTheyPass trips 2 boolInt
                                                         | otherwise = makeSureTheyPass trips 2 boolInt

compareBoolInt :: BooleanIntExp -> FTerm -> Bool
compareBoolInt (LessThan _ j) (FInt i) = i < j
compareBoolInt (GreaterThan _ j) (FInt i) = i > j
compareBoolInt (Equal _ j) (FInt i) = i == j
compareBoolInt (MultiBoolSttmnt s1 s2) (FInt i) = (compareBoolInt s1 (FInt i)) && (compareBoolInt s2 (FInt i))
compareBoolInt (IsEq _ (BasicObject b)) term = (objToTerm b) == term
compareBoolInt (IsEq _ (IntExp (SingleIntExp i))) term = (FInt i) == term
compareBoolInt (NotEq _ (BasicObject b)) term = (objToTerm b) /= term
compareBoolInt (NotEq _ (IntExp (SingleIntExp i))) term = (FInt i) /= term
compareBoolInt (OrBoolTerm o1 o2) term = compareBoolInt o1 term || compareBoolInt o2 term
compareBoolInt _ _ = False

filterAgainstThese :: FinalTriples -> Whereiables -> FinalTriples -> Whereiables -> FinalTriples
filterAgainstThese currentTrips currentVars matchTrips matchVars = filterbyObj (filterbyPred (filterbySubj currentTrips currentVars matchTrips (snd (head matchVars))) currentVars matchTrips (snd (head (tail matchVars)))) currentVars matchTrips (snd (head (reverse matchVars)))-- fix this line    


{- BTW I KNOW THE BELOW STUFF IS UGLY, 
I SHOULD HAVE MADE THE DATA TYPE AN INSTANCE OF MONAD SO I COULD JUST MAP EVERYTHING OVER, 
BUT I DIDNT WANNA SCREW IT UP AND WASTE MY LIFE ON IT
U FEEL ME
YOURS TRULY
OWEN -}


--SUBJECT VAR MATCHING
--each matchVar
filterbySubj :: FinalTriples -> Whereiables -> FinalTriples -> String -> FinalTriples
filterbySubj currentTrips currentVars matchTrips subVarString | not (contains subVarString (map snd currentVars)) = currentTrips
                                                              | subVarString == (snd (head currentVars)) = matchEachBySubjbySubj currentTrips matchTrips
                                                              | subVarString == (snd (head (tail currentVars))) = matchEachBySubjbyPred currentTrips matchTrips
                                                              | otherwise = matchEachBySubjbyObj currentTrips matchTrips


--eachCurrentVar
matchEachBySubjbySubj ((FTrpl subj pred obj):trips) matchTrips | matchSubject matchTrips subj /= [] = (FTrpl subj pred obj) : matchEachBySubjbySubj trips matchTrips
                                                               | otherwise = matchEachBySubjbySubj trips matchTrips
matchEachBySubjbySubj [] _ = []

matchEachBySubjbyPred ((FTrpl subj pred obj):trips) matchTrips | matchPredicate matchTrips subj /= [] = (FTrpl subj pred obj) : matchEachBySubjbyPred trips matchTrips
                                                               | otherwise = matchEachBySubjbyPred trips matchTrips
matchEachBySubjbyPred [] _ = []

matchEachBySubjbyObj ((FTrpl subj pred obj):trips) matchTrips | matchObject matchTrips subj /= [] = (FTrpl subj pred obj) : matchEachBySubjbyObj trips matchTrips
                                                              | otherwise = matchEachBySubjbyObj trips matchTrips
matchEachBySubjbyObj [] _ = []

--PREDICATE VAR MATCHING
--each matchVar
filterbyPred currentTrips currentVars matchTrips predVarString | not (contains predVarString (map snd currentVars)) = currentTrips
                                                               | predVarString == (snd (head currentVars)) = matchEachByPredbySubj currentTrips matchTrips
                                                               | predVarString == (snd (head (tail currentVars))) = matchEachByPredbyPred currentTrips matchTrips
                                                               | otherwise = matchEachByPredbyObj currentTrips matchTrips
--eachCurrentVar
matchEachByPredbySubj ((FTrpl subj pred obj):trips) matchTrips | matchSubject matchTrips pred /= [] = (FTrpl subj pred obj) : matchEachByPredbySubj trips matchTrips
                                                               | otherwise = matchEachByPredbySubj trips matchTrips
matchEachByPredbySubj [] _ = []

matchEachByPredbyPred ((FTrpl subj pred obj):trips) matchTrips | matchPredicate matchTrips pred /= [] = (FTrpl subj pred obj) : matchEachByPredbyPred trips matchTrips
                                                               | otherwise = matchEachByPredbyPred trips matchTrips
matchEachByPredbyPred [] _ = []

matchEachByPredbyObj ((FTrpl subj pred obj):trips) matchTrips | matchObject matchTrips pred /= [] = (FTrpl subj pred obj) : matchEachByPredbyObj trips matchTrips
                                                              | otherwise = matchEachByPredbyObj trips matchTrips
matchEachByPredbyObj [] _ = []

--OBJECT VAR MATCHING
filterbyObj currentTrips currentVars matchTrips objVarString  | not (contains objVarString (map snd currentVars)) = currentTrips
                                                              | objVarString == (snd (head currentVars)) = matchEachByObjbySubj currentTrips matchTrips
                                                              | objVarString == (snd (head (tail currentVars))) = matchEachByObjbyPred currentTrips matchTrips
                                                              | otherwise = matchEachByObjbyObj currentTrips matchTrips
--eachCurrentVar
matchEachByObjbySubj ((FTrpl subj pred obj):trips) matchTrips | matchSubject matchTrips obj /= [] = (FTrpl subj pred obj) : matchEachByObjbySubj trips matchTrips
                                                              | otherwise = matchEachByObjbySubj trips matchTrips
matchEachByObjbySubj [] _ = []

matchEachByObjbyPred ((FTrpl subj pred obj):trips) matchTrips | matchPredicate matchTrips obj /= [] = (FTrpl subj pred obj) : matchEachByObjbyPred trips matchTrips
                                                              | otherwise = matchEachByObjbyPred trips matchTrips
matchEachByObjbyPred [] _ = []

matchEachByObjbyObj ((FTrpl subj pred obj):trips) matchTrips | matchObject matchTrips obj /= [] = (FTrpl subj pred obj) : matchEachByObjbyObj trips matchTrips
                                                             | otherwise = matchEachByObjbyObj trips matchTrips
matchEachByObjbyObj [] _ = []

--VARIABLES
---------------------------------
getVariables (WhereBracket []) = []
getVariables (WhereBracket ((WTrpl subj pred obj):xs)) = (convSubj subj) ++ (convPred pred) ++ (convObj obj) ++ getVariables (WhereBracket xs)

convSubj (PredVar s) = [(1,s)]
convSubj _ = []

convPred (PredVar s) = [(2,s)]
convPred _ = []

convObj (ObjVar s) = [(3,s)]
convObj _ = []

type Whereiables = [(Int, String)]
-- (1, subjvar) : (2, predvar) etc.
-------------------------------

applyWhereStates :: [WhereTrpl] -> FinalTriples -> FinalTriples
applyWhereStates [] _ = []
applyWhereStates ((WTrpl subjMatch predMatch objMatch) :wheres) trips = (applyWhereObj objMatch (applyWherePred predMatch (applyWhereSubj subjMatch trips))) ++ applyWhereStates wheres trips

applyWhereSubj :: SubTerm -> FinalTriples -> FinalTriples
applyWhereSubj (PredVar _) trips = trips
applyWhereSubj (PredURI uri) trips = matchSubject trips (uriToTerm uri)

applyWherePred :: SubTerm -> FinalTriples -> FinalTriples
applyWherePred (PredVar _) trips = trips
applyWherePred (PredURI uri) trips = matchPredicate trips (uriToTerm uri)

applyWhereObj :: Obj -> FinalTriples -> FinalTriples
applyWhereObj (ObjVar _) trips = trips
applyWhereObj object trips = matchObject trips (objToTerm object)

objToTerm :: Obj -> FTerm
objToTerm (ObjURI u) = uriToTerm u
objToTerm (ObjStr s) = FLiteral s
objToTerm BooleanTrue = FBool True
objToTerm BooleanFalse = FBool False

uriToTerm :: URI -> FTerm
uriToTerm (BasicURI s) = FIRI s
--make it work on baseURIs aswell


--CONSTRUCT CLAUSE
------------------
createTriples :: GenerateTriple -> FinalTriples -> FinalTriples
createTriples (TripleCombination genTrp1 genTrp2) trips = createTriples genTrp1 trips ++ createTriples genTrp2 trips
createTriples (Triple subjMatch predMatch objMatch) ((FTrpl subj pred obj):trps) = (FTrpl (createFTerm subjMatch subj) (createFTerm predMatch pred) (createFObj objMatch obj)) : createTriples (Triple subjMatch predMatch objMatch) trps
createTriples _ [] = []

createFTerm :: SubTerm -> FTerm -> FTerm
createFTerm (PredVar _) term = term
createFTerm (PredURI uri) _ = uriToTerm uri 

createFObj :: ObjExp -> FTerm -> FTerm
createFObj (BasicObject (ObjVar _)) term = term
createFObj obj term = objExpToTerm obj term


objExpToTerm :: ObjExp -> FTerm -> FTerm 
objExpToTerm (BasicObject o) _ = objToTerm o
--DO THIS LOL
objExpToTerm (IntExp exps) term = intExpToTerm exps term
--objExpToTerm (NOT s), confused ab this one

intExpToTerm exp (FInt j) = validintExpTerm exp j
intExpToTerm _ term = term

validintExpTerm (Addition _ i) j = (FInt (i + j))
validintExpTerm (Multiplication _ i) j = (FInt (i * j))
validintExpTerm (Division _ i) j = (FInt (j `div` i))
validintExpTerm (Subtraction _ i) j = (FInt (j - i))
validintExpTerm (SingleIntExp i) j = (FInt i)






-- USEFUL FUNCTIONS
--PRINTING & FILE SHIT


removeDuplicates :: FinalTriples -> FinalTriples
removeDuplicates = nub



loadFile :: String -> String
loadFile s = unsafePerformIO (readFile s)
--HEY LECTURERS, IF U SEE THIS, I AM SO SORRY
--I WANTED TO NOT USE IT I REALLY DID
--BUT HAVING THE ENTIRE ALGORITHM IN THE IO WORLD WAS JUST A FAFF



prettyPrintString :: FinalTriples -> String
prettyPrintString [] = []
prettyPrintString (x:xs) = prettyPrintTrplString x ++ "\n" ++ prettyPrintString xs


prettyPrintTrplString :: FinalTriple -> String
prettyPrintTrplString (FTrpl x y z) = (prettyPrintTerm x ++ prettyPrintTerm y ++ prettyPrintTerm z) ++ " ."


prettyPrint :: FinalTriples -> IO ()
prettyPrint [] = return ()
prettyPrint xs = prettyPrint2 (sort xs)

prettyPrint2 :: FinalTriples -> IO()
prettyPrint2 [] = return ()
prettyPrint2 (x:xs) = do prettyPrintTrpl x
                         prettyPrint2 xs

prettyPrintTerm (FLiteral s) = "\""++ s ++"\""
prettyPrintTerm (FIRI s) = "<" ++ s ++ ">"
prettyPrintTerm (FInt i) =" " ++ show  i ++ " "
prettyPrintTerm (FBool False) = " false "
prettyPrintTerm (FBool True) = " true "

prettyPrintTrpl (FTrpl x y z) = putStrLn ( (prettyPrintTerm x ++ prettyPrintTerm y ++ prettyPrintTerm z) ++ " .")



uglyPrintTrpls :: FinalTriples -> String
uglyPrintTrpls [] = []
uglyPrintTrpls (x:[]) = uglyPrintTrpl x
uglyPrintTrpls (x:xs) = uglyPrintTrpl x ++ ", " ++ uglyPrintTrpls xs

uglyPrintTrpl :: FinalTriple -> String
uglyPrintTrpl (FTrpl x y z) = "FTrpl (" ++ show x ++ ") (" ++ show y ++ ") (" ++ show z ++ ")"

loadTriples :: String -> FinalTriples
loadTriples turtleFileText = expand (basePrefixSubst(parseTurtle (alexScanTokens turtleFileText)) [] "")


{- sortTrips :: FinalTriples -> FinalTriples
sortTrips trips = (sortBySubj (sortByPred (sortByObjj trips))

quicksortSubj :: FinalTriples -> FinalTriples
quicksort [] = []
quicksort ((FTrpl a b c):xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

sortBySubj [] = []
sortBySubj ((FTrpl x y z):(FTrpl a b c):trips) | x < a =  -}

instance Ord FinalTriple where
    compare (FTrpl a b c) (FTrpl d e f) = if a /= d
                                            then compare a d
                                            else if b /= e
                                                 then compare b e
                                                 else compare c f
{- 
superCompare a d b e c f | a < d = LT
                         | a > d = GT
                         | b < e = LT
                         | b > e = GT
                         | c < f = LT
                         | c > f = GT
                         | otherwise = EQ -}

instance Ord FTerm where
    compare (FLiteral s) (FLiteral s2) = compare s s2
    compare (FInt s) (FInt s2) = compare s s2
    compare (FIRI s) (FIRI s2) = compare s s2
    compare (FBool s) (FBool s2) = compare s s2
    compare s s2 = LT
