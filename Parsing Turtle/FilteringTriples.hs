{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module FilteringTriples where
import FinalisedTriples

--get Indivdual terms from each triple
getSubjects :: FinalTriples -> [FTerm]
getSubjects [] = []
getSubjects ((FTrpl subj _ _):trpls) = subj : getSubjects trpls

getPredicates :: FinalTriples -> [FTerm]
getPredicates [] = []
getPredicates ((FTrpl _ pred _):trpls) = pred : getPredicates trpls

getObjects :: FinalTriples -> [FTerm]
getObjects [] = []
getObjects ((FTrpl _ _ obj):trpls) = obj : getObjects trpls


--Filter triples by matching certain terms
matchTriple :: FinalTriples -> FinalTriple -> FinalTriples
matchTriple [] _ = []
matchTriple (trp:trps) term | term == trp = trp : matchTriple trps term
                            | otherwise = matchTriple trps term

matchSubject :: FinalTriples -> FTerm -> FinalTriples
matchSubject [] _ = []
matchSubject ((FTrpl subj pred obj):trpls) searchTerm | subj == searchTerm = FTrpl subj pred obj : matchSubject trpls searchTerm
                                                      | otherwise = matchSubject trpls searchTerm

matchPredicate :: FinalTriples -> FTerm -> FinalTriples
matchPredicate [] _ = []
matchPredicate ((FTrpl subj pred obj):trpls) searchTerm | pred == searchTerm = FTrpl subj pred obj : matchPredicate trpls searchTerm
                                                        | otherwise = matchPredicate trpls searchTerm

matchObject :: FinalTriples -> FTerm -> FinalTriples
matchObject [] _ = []
matchObject ((FTrpl subj pred obj):trpls) searchTerm | obj == searchTerm = FTrpl subj pred obj : matchObject trpls searchTerm
                                                     | otherwise = matchObject trpls searchTerm



--map functions across terms/triples
mapTriple :: (FTerm -> FTerm) -> FinalTriples -> FinalTriples
mapTriple f [] = []
mapTriple f ((FTrpl subj pred obj):trpls) = FTrpl (f subj) (f pred) (f obj) : mapTriple f trpls

--across the subjs of the triples, then preds, etc.
mapSubj :: (FTerm -> FTerm) -> FinalTriples -> FinalTriples
mapSubj f [] = []
mapSubj f ((FTrpl subj pred obj):trpls) = FTrpl (f subj) pred obj : mapSubj f trpls

mapPreds :: (FTerm -> FTerm) -> FinalTriples -> FinalTriples
mapPreds f [] = []
mapPreds f ((FTrpl subj pred obj):trpls) = FTrpl subj (f pred) obj : mapPreds f trpls

mapObjs :: (FTerm -> FTerm) -> FinalTriples -> FinalTriples
mapObjs f [] = []
mapObjs f ((FTrpl subj pred obj):trpls) = FTrpl subj pred (f obj) : mapObjs f trpls
