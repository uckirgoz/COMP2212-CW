module FinalisedTriples where
import TurtleGrammar
import TurtleLexer

type FinalTriples = [FinalTriple]
data FinalTriple = FTrpl FTerm FTerm FTerm
    deriving (Show, Eq)
data FTerm = FLiteral String | FInt Int | FIRI String | FBool Bool
    deriving (Show, Eq)


--start w (basePrefixSubst lines [] "")
basePrefixSubst :: [Lines] -> StorePrefix -> String -> [Lines]
basePrefixSubst [] _ _ = []
basePrefixSubst ((BaseInitial b) : xs) prefixes currentBase = basePrefixSubst xs prefixes b
basePrefixSubst ((PrefixInitial from to) : xs) prefixes currentBase = basePrefixSubst xs ((from,to) : prefixes) currentBase
basePrefixSubst ((Triples subj preds) : xs) prefixes currentBase = subst (Triples subj preds) prefixes currentBase : basePrefixSubst xs prefixes currentBase

--subst (Triples subj preds) prefixes currentBase
subst :: Lines -> StorePrefix -> String -> Lines
subst (Triples (FromIRI s) preds) prefixes currentBase | take (length currentBase) s /= currentBase = Triples (FromIRI (currentBase ++ s)) (map (substPredLevel prefixes currentBase) preds) --just add base
                                                       | otherwise = Triples (FromIRI s) (map (substPredLevel prefixes currentBase) preds) --dont add cos already has base
subst (Triples (FromPrefix prefTag remainder) preds) prefixes currentBase | take (length currentBase) (getPref prefTag prefixes) /= currentBase = Triples (FromIRI (currentBase ++ getPref prefTag prefixes ++ remainder)) (map (substPredLevel prefixes currentBase) preds) --add pref and base 
                                                                          | otherwise = Triples (FromIRI (getPref prefTag prefixes ++ remainder)) (map (substPredLevel prefixes currentBase) preds)
subst _ _ _ = error "Non substitutatble triple"

substPredLevel :: StorePrefix -> String -> (Field, [TripleValue]) ->  (Field, [TripleValue])
substPredLevel prefixes currentBase (FromIRI s, objs) | take (length currentBase) s /= currentBase = (FromIRI (currentBase ++ s), map (substObjLevel prefixes currentBase) objs)
                                                      | otherwise = (FromIRI s, map (substObjLevel prefixes currentBase) objs)
substPredLevel prefixes currentBase (FromPrefix prefTag remainder, objs) | take (length currentBase) (getPref prefTag prefixes) /= currentBase = (FromIRI (currentBase ++ getPref prefTag prefixes ++ remainder), map (substObjLevel prefixes currentBase) objs)
                                                                         | otherwise = (FromIRI (getPref prefTag prefixes ++ remainder), map (substObjLevel prefixes currentBase) objs)
substObjLevel :: StorePrefix -> String -> TripleValue -> TripleValue
substObjLevel _ _ (StringValue s) = StringValue s
substObjLevel _ _ (BooleanValue b) = BooleanValue b
substObjLevel _ _ (IntegerValue i) = IntegerValue i
substObjLevel _ currentBase (IRIValue s) | take (length currentBase) s /= currentBase = IRIValue (currentBase ++ s)
                                         | otherwise = IRIValue s
substObjLevel prefixes currentBase (PrefixValue prefTag remainder) | take (length currentBase) (getPref prefTag prefixes) /= currentBase = IRIValue (currentBase ++ getPref prefTag prefixes ++ remainder)
                                                                   | otherwise = IRIValue (getPref prefTag prefixes ++ remainder)



--continue here

getPref tag prefixes | contains tag (map fst prefixes) = demaybe (lookup tag prefixes)
demaybe (Just x) = x

contains _ [] = False
contains n (x:xs)
  | x == n = True
  | otherwise = contains n xs


expand :: [Lines] -> FinalTriples
--object / predicate lists -> expanded & converted triples
expand [] = []
expand ((Triples _ []):xs) = expand xs --no more triples
expand ((Triples subj ((_,[]):preds)):xs) = expand (Triples subj preds:xs) ++ expand xs --no more objects, move onto next pred
expand ((Triples subj ((pred,obj:objs):preds)):xs) = [FTrpl (normField subj) (normField pred) (normValue obj)] ++ expand [Triples subj ((pred,objs):preds)] ++ expand xs
expand _ = []

normValue :: TripleValue -> FTerm
normValue (StringValue s) = FLiteral s
normValue (BooleanValue b) = FBool b
normValue (IntegerValue i) = FInt i
normValue (IRIValue s) = FIRI s

normField :: Field -> FTerm
normField (TurtleGrammar.FromIRI s) = FIRI s

