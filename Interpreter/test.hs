import Data.List

type FinalTriples = [FinalTriple]
data FinalTriple = FTrpl FTerm FTerm FTerm
    deriving (Show, Eq)
data FTerm = FLiteral String | FInt Int | FIRI String | FBool Bool
    deriving (Show, Eq)


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

test = [(FTrpl (FInt 3) (FInt 1) (FInt 2)), (FTrpl (FInt 1) (FInt 1) (FInt 2))]