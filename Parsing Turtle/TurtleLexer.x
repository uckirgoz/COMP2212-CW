{
module TurtleLexer where
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+        ; 
  "--".*         ; 
  \@ base                                  { tok ( \p s -> TokenBase p )}
  \@ prefix                                { tok ( \p s -> TokenPrefix p )} 
  true                                     { tok ( \p s -> TokenBoolean p True )}
  false                                    { tok ( \p s -> TokenBoolean p False )}
  $alpha \:                                { tok ( \p s -> TokenPrefixCol p (init s) )}
  $digit+                                  { tok ( \p s -> TokenInt p (read s) )}
  \+ $digit+                               { tok ( \p s -> TokenInt p (read (tail s)))}
  \- $digit+                               { tok ( \p s -> TokenInt p (negate'(read (tail s))) )}
  \.                                       { tok ( \p s -> TokenDot p )}
  \,                                       { tok ( \p s -> TokenComma p )}
  \;                                       { tok ( \p s -> TokenSemicolon p )}
  [$alpha $digit \_]+                      { tok ( \p s -> TokenVarName p s )}
  \" [$alpha $digit \# \/ \: \_ \. \-]+ \"    { tok ( \p s -> TokenSelect p (removeFirstLast s) )}
  \< [$alpha $digit \# \/ \: \_ \. \-]+ \>    { tok ( \p s -> TokenIRI p (removeFirstLast s) )}



{

tok f p s = f p s 

removeFirstLast :: String -> String
removeFirstLast s = init (tail s)

negate' :: Int -> Int
negate' x = (-1) * x


data TurtleToken = 
  TokenBase AlexPosn                 |
  TokenPrefix AlexPosn               |
  TokenBoolean AlexPosn Bool         |
  TokenPrefixCol AlexPosn String     |
  TokenInt AlexPosn Int              |
  TokenDot AlexPosn                  |
  TokenComma AlexPosn                |
  TokenSemicolon AlexPosn            |
  TokenVarName AlexPosn String       |
  TokenIRI AlexPosn String           |
  TokenSelect AlexPosn String
  deriving (Eq, Show)




tokenPosn :: TurtleToken -> (Int, Int)
tokenPosn (TokenInt (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenBoolean (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenVarName (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenIRI (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenBase (AlexPn _ x y)) = (x,y)
tokenPosn (TokenPrefix (AlexPn _ x y)) = (x,y)
tokenPosn (TokenPrefixCol (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenDot (AlexPn _ x y)) = (x,y)
tokenPosn (TokenComma (AlexPn _ x y)) = (x,y)
tokenPosn (TokenSemicolon (AlexPn _ x y)) = (x,y)
tokenPosn (TokenSelect (AlexPn _ x y) _ ) = (x,y)


}