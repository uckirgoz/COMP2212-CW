{
module SPARQLTokens where
}

%wrapper "posn"
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :- 
    $white+       ; 
    "--".*        ; 
    CONSTRUCT                { \p s -> TokenConstructQuery p }
    PREFIX                   { \p s -> TokenPrefixDecl p }
    BASE                     { \p s -> TokenBaseDecl p }
    ASK                      { \p s -> TokenAskQuery p }
    UNION                    { \p s -> TokenGroupPattern p }
    WHERE                    { \p s -> TokenWhere p }
    FILTER                   { \p s -> TokenFilter p }
    IMPORT                   { \p s -> TokenImport p }
    AS                       { \p s -> TokenAs p }
    SELECT                   { \p s -> TokenSelectClause p }
    FROM                     { \p s -> TokenFrom p }
    GROUP                    { \p s -> TokenGroup p }
    ORDER                    { \p s -> TokenOrder p }
    BY                       { \p s -> TokenDoBy p }
    regex                    { \p s -> TokenRegex p }
    \{                       { \p s -> TokenOpenBracket p }
    \}                       { \p s -> TokenCloseBracket p }
    \(                       { \p s -> TokenOpenParen p }
    \)                       { \p s -> TokenCloseParen p }
    \?[$alpha $digit]+       { \p s -> TokenVar p (tail s) }
    $alpha+.ttl          { \p s -> TokenFileName p s}
    [A-Z]                    { \p s -> TokenFileVar p s}
    true                     { \p s -> TokenBoolean p True }
    false                    { \p s -> TokenBoolean p False }
    \,                       { \p s -> TokenComma p }
    \.                       { \p s -> TokenDot p }
    \:                       { \p s -> TokenColon p }
    \=\=                     { \p s -> TokenCmpr p }
    \!\=                     { \p s -> TokenNeq p }
    \!                       { \p s -> TokenNot p }
    or                       { \p s -> TokenOr p }
    and                      { \p s -> TokenAnd p }
    \+                       { \p s -> TokenPlus p }
    \*                       { \p s -> TokenMulti p }
    \-                       { \p s -> TokenSub p }
    \/\/                     { \p s -> TokenDiv p }
    \<                       { \p s -> TokenLT p }
    \>                       { \p s -> TokenGT p }
    \=                       { \p s -> TokenEq p }
    $digit                   { \p s -> TokenInt p (read s)}
    \+ $digit+               { \p s -> TokenInt p (read (tail s))}
    \- $digit+               { \p s -> TokenInt p (negate'(read (tail s))) }
    $alpha                   { \p s -> TokenPrefixName p s }
    [a-z1-9\#]+              { \p s -> TokenTag p s}
    \"[$alpha $white $digit \# \/ \: \_ \.]+\"       { \p s -> TokenString p s }
    ($digit | $alpha)($digit | $alpha)               { \p s -> TokenBaseURI p s }
     \< [$alpha $digit \# \/ \: \_ \.]+ \>           { \p s -> TokenURI p (removeFirstLast s) }

{
removeFirstLast :: String -> String
removeFirstLast s = init (tail s)

negate' :: Int -> Int
negate' x = (-1) * x

data SPARQLToken = 
   TokenConstructQuery AlexPosn    | 
   TokenPrefixDecl AlexPosn        | 
   TokenBaseDecl AlexPosn          |
   TokenAskQuery AlexPosn          |
   TokenGroupPattern AlexPosn      |
   TokenWhere AlexPosn             |
   TokenFilter AlexPosn            |
   TokenImport AlexPosn            |
   TokenAs AlexPosn                |
   TokenSelectClause AlexPosn      |
   TokenFrom AlexPosn              |
   TokenGroup AlexPosn             |
   TokenOrder AlexPosn             |
   TokenDoBy AlexPosn              |
   TokenRegex AlexPosn             |
   TokenOpenBracket AlexPosn       | 
   TokenCloseBracket AlexPosn      |
   TokenOpenParen AlexPosn         |
   TokenCloseParen AlexPosn        |
   TokenVar AlexPosn String        |
   TokenFileName AlexPosn String   |
   TokenFileVar AlexPosn String    |
   TokenBoolean AlexPosn Bool      |
   TokenComma AlexPosn             |
   TokenDot AlexPosn               |
   TokenColon AlexPosn             |
   TokenCmpr AlexPosn              |
   TokenNeq AlexPosn               |
   TokenNot AlexPosn               |
   TokenOr AlexPosn                |
   TokenAnd AlexPosn               |
   TokenPlus AlexPosn              |
   TokenMulti AlexPosn             |
   TokenSub AlexPosn               |
   TokenDiv AlexPosn               |
   TokenLT AlexPosn                |
   TokenGT AlexPosn                |
   TokenEq AlexPosn                |
   TokenInt AlexPosn Int           |
   TokenPrefixName AlexPosn String |
   TokenString AlexPosn String     |
   TokenTag AlexPosn String        |
   TokenBaseURI AlexPosn String    |
   TokenURI AlexPosn String        
   deriving(Eq,Show)

tokenPosn :: SPARQLToken -> (Int,Int)
tokenPosn (TokenInt (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenBoolean (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenVar (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenFileName (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenPrefixName (AlexPn _ x y) _ ) = (x,y)
tokenPosn (TokenTag (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenBaseURI (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenURI (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenFileVar (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenString (AlexPn _ x y) _) = (x,y)
tokenPosn (TokenConstructQuery (AlexPn _ x y)) = (x,y)
tokenPosn (TokenPrefixDecl (AlexPn _ x y)) = (x,y)
tokenPosn (TokenBaseDecl (AlexPn _ x y)) = (x,y)
tokenPosn (TokenAskQuery (AlexPn _ x y)) = (x,y)
tokenPosn (TokenGroupPattern (AlexPn _ x y)) = (x,y)
tokenPosn (TokenWhere (AlexPn _ x y)) = (x,y)
tokenPosn (TokenFilter (AlexPn _ x y)) = (x,y)
tokenPosn (TokenImport (AlexPn _ x y)) = (x,y)
tokenPosn (TokenAs (AlexPn _ x y)) = (x,y)
tokenPosn (TokenSelectClause (AlexPn _ x y)) = (x,y)
tokenPosn (TokenFrom (AlexPn _ x y)) = (x,y)
tokenPosn (TokenGroup (AlexPn _ x y)) = (x,y)
tokenPosn (TokenOrder (AlexPn _ x y)) = (x,y)
tokenPosn (TokenDoBy (AlexPn _ x y)) = (x,y)
tokenPosn (TokenRegex (AlexPn _ x y)) = (x,y)
tokenPosn (TokenOpenBracket (AlexPn _ x y)) = (x,y)
tokenPosn (TokenCloseBracket (AlexPn _ x y)) = (x,y)
tokenPosn (TokenOpenParen (AlexPn _ x y)) = (x,y)
tokenPosn (TokenCloseParen (AlexPn _ x y)) = (x,y)
tokenPosn (TokenComma (AlexPn _ x y)) = (x,y)
tokenPosn (TokenDot (AlexPn _ x y)) = (x,y)
tokenPosn (TokenColon (AlexPn _ x y)) = (x,y)
tokenPosn (TokenCmpr (AlexPn _ x y)) = (x,y)
tokenPosn (TokenNeq (AlexPn _ x y)) = (x,y)
tokenPosn (TokenNot (AlexPn _ x y)) = (x,y)
tokenPosn (TokenOr (AlexPn _ x y)) = (x,y)
tokenPosn (TokenAnd (AlexPn _ x y)) = (x,y)
tokenPosn (TokenPlus (AlexPn _ x y)) = (x,y)
tokenPosn (TokenMulti (AlexPn _ x y)) = (x,y)
tokenPosn (TokenSub (AlexPn _ x y)) = (x,y)
tokenPosn (TokenDiv (AlexPn _ x y)) = (x,y)
tokenPosn (TokenLT (AlexPn _ x y)) = (x,y)
tokenPosn (TokenGT (AlexPn _ x y)) = (x,y)
tokenPosn (TokenEq (AlexPn _ x y)) = (x,y)
  
   
}