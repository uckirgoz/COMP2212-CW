{
module SPARQLGrammar where
import SPARQLTokens
}

%name parseSPARQL 

%tokentype { SPARQLToken }
%error     { parseErrorSPARQL }

%token
  CONSTRUCT                 { TokenConstructQuery _ }
  PREFIX                    { TokenPrefixDecl _ }
  BASE                      { TokenBaseDecl _ }
  ASK                       { TokenAskQuery _ }
  UNION                     { TokenGroupPattern _ }
  WHERE                     { TokenWhere _ }
  FILTER                    { TokenFilter _ }
  IMPORT                    { TokenImport _ }
  AS                        { TokenAs _ }
  SELECT                    { TokenSelectClause _ }
  FROM                      { TokenFrom _ }
  GROUP                     { TokenGroup _ }
  ORDER                     { TokenOrder _ }
  BY                        { TokenDoBy _ }
  regex                     { TokenRegex _ }
  '{'                       { TokenOpenBracket _ }
  '}'                       { TokenCloseBracket _ }
  '('                       { TokenOpenParen _ }
  ')'                       { TokenCloseParen _ }
  Variable                  { TokenVar _ $$ }
  file                      { TokenFileName _ $$ }
  fileVar                   { TokenFileVar _ $$}
  true                      { TokenBoolean _ True }
  false                     { TokenBoolean _ False }
  ','                       { TokenComma _ }
  '.'                       { TokenDot _ }
  ':'                       { TokenColon _ }
  '=='                      { TokenCmpr _ }
  '!='                      { TokenNeq _ }
  '!'                       { TokenNot _ }
  or                        { TokenOr _ }
  and                       { TokenAnd _ }
  '+'                       { TokenPlus _ }
  '*'                       { TokenMulti _ }
  '-'                       { TokenSub _ }
  '//'                      { TokenDiv _ }
  '<'                       { TokenLT _ }
  '>'                       { TokenGT _ }
  '='                       { TokenEq _ }
  Integer                   { TokenInt _ $$ }
  PrefixName                { TokenPrefixName _ $$ }
  Tag                       { TokenTag _ $$ }
  BaseURI1                  { TokenBaseURI _ $$ }
  URIValue                  { TokenURI _ $$ }
  StringValue               { TokenString _ $$ }

%left ',' UNION '>' '<' 
%nonassoc '+' '-' '*' '//'
%%
{-
ImportTriples : IMPORT file AS fileVar           { Import $2 (FileAsVar $4) }
              | ImportTriples  ImportTriples     { ImportCombination $1 $2 }
              | fileVar '.' fileVar              { Conjunction (FileAsVar $1) (FileAsVar $3) }
-}


Decleration : BASE URIValue Prefixes Exp  { BasePrefixDecl $2 $3 $4 }
            | BASE URIValue Exp           { BaseDecl $2 $3}
            | Prefixes Exp                { PrefixDecl $1 $2 }
            | Exp                         { NoDecl $1 }

Prefixes : Prefixes ',' Prefixes           { PrefixCombination $1 $3 }
         | PREFIX PrefixName ':' URIValue  { Prefix $2 $4 }
         
Exp : Exp UNION Exp                                                                    { Union $1 $3 }
    | CONSTRUCT '{' GenerateTriple '}' DataProposition WHERE '{' WhereProposition '}'  { Construct $3 $5 $8 }
    
DataProposition : DataProposition ',' DataProposition { FileCombination $1 $3 }
                | FROM file   { FromFile $2 }

WhereProposition : WhereBracket Filter         { WhereWithFilter $1 $2 }
                 | WhereBracket                { Where $1 }

Filter : FILTER '(' BooleanOperation ')'                                        { BooleanFilter $3 }
       | FILTER ASK '{' DataProposition WHERE '{' WhereProposition '}' '}'      { Ask $4 $7 }
       | FILTER regex '(' Variable ',' BooleanIntExp ')'                          { Regex $4 $6 }

BooleanOperation : Variable '==' BooleanTerm            { IsEq $1 $3 }
                 | Variable '!=' BooleanTerm            { NotEq $1 $3 }


BooleanTerm : URI or BooleanTerm               { OrBoolTerm $1 $3 }
            | URI and BooleanTerm              { AndBoolTerm $1 $3 }
            | URI                              { BoolObj $1 }

GenerateTriple : GenerateTriple ',' GenerateTriple  { TripleCombination $1 $3 } 
               | SubTerm SubTerm ObjExp             { Triple $1 $2 $3 }
               
WhereBracket : WhereTrpls                      { WhereBracket $1 }

WhereTrpls : SubTerm SubTerm Obj WhereTrpls    { WTrpl $1 $2 $3 : $4 }
           | SubTerm SubTerm Obj               { [WTrpl $1 $2 $3] }

Obj : URI          { ObjURI $1 }
    | StringValue  { ObjStr $1 }
    | Variable     { ObjVar $1 }
    | true         { BooleanTrue }
    | false        { BooleanFalse }

ObjExp : IntExps      { IntExp $1 }
       | '!' Variable { Not $2 }
       | Obj          { BasicObject $1 }

SubTerm : Variable { PredVar $1 }
        | URI      { PredURI $1 }

IntExps : Variable '+' Integer   { Addition $1 $3 }
        | Variable '*' Integer   { Multiplication $1 $3 }
        | Variable '//' Integer  { Division $1 $3 }
        | Variable '-' Integer   { Subtraction $1 $3 }
        | Integer                { SingleIntExp $1 }


BooleanIntExp : BooleanIntExp ',' BooleanIntExp   { MultiBoolSttmnt $1 $3 }
              | Variable '<' Integer               { LessThan $1 $3 }
              | Variable '>' Integer               { GreaterThan $1 $3 }
              | Variable '=' Integer               { Equal $1 $3 }

URI : PrefixName ':' Tag { Select $1 $3 } 
    | URIValue           { BasicURI $1 }
    | BaseURI1           { BaseURI $1 } 


{
parseErrorSPARQL :: [SPARQLToken] -> a
parseErrorSPARQL [] = error "Unknown Parse Error" 
parseErrorSPARQL (t:ts) = error ("Parse error at (line,column) " ++ show(tokenPosn t))

{-
data ImportTriples =
     Import String FileVar  |
     ImportCombination ImportTriples ImportTriples |
     Conjunction FileVar FileVar
     deriving(Eq,Show)

data FileVar = FileAsVar String deriving(Eq,Show)
-}


data Decleration =
     BasePrefixDecl String Prefixes Exp |
     BaseDecl String Exp                |
     PrefixDecl Prefixes Exp            |
     NoDecl Exp
     deriving(Eq,Show)

data Prefixes =
     PrefixCombination Prefixes Prefixes |
     Prefix String String
     deriving(Eq,Show)

data Exp = 
     Union Exp Exp |
     Construct GenerateTriple DataProposition WhereProposition                                      
     deriving(Eq,Show)

data DataProposition =
     FileCombination DataProposition DataProposition  |
     FromFile String 
     deriving(Eq,Show)

data WhereProposition =
     WhereWithFilter WhereBracket Filter | 
     Where WhereBracket                  
     deriving(Eq,Show)

data Filter = 
     BooleanFilter BooleanOperation       |
     Ask DataProposition WhereProposition |
     Regex String BooleanIntExp
     deriving(Eq,Show)

data BooleanOperation =
     IsEq String BooleanTerm         |
     NotEq String BooleanTerm        
     deriving(Eq,Show)
     
data BooleanTerm =
     OrBoolTerm URI BooleanTerm       |
     AndBoolTerm URI BooleanTerm      |
     BoolObj URI                      
     deriving(Eq,Show)

data GenerateTriple = 
     TripleCombination GenerateTriple GenerateTriple |
     Triple SubTerm SubTerm ObjExp                  
     deriving(Eq,Show)

data WhereBracket = WhereBracket [WhereTrpl] deriving(Eq,Show)

data WhereTrpl = WTrpl SubTerm SubTerm Obj deriving(Eq,Show)

data Obj =
     ObjURI URI    |
     ObjStr String |
     ObjVar String |
     BooleanTrue   |
     BooleanFalse 
     deriving(Eq, Show)

data ObjExp = 
     IntExp IntExps |
     Not String    |
     BasicObject Obj      
     deriving(Eq,Show)

data SubTerm = 
     PredVar String |
     PredURI URI    
     deriving(Eq,Show)

data IntExps =
      Addition String Int       |
      Multiplication String Int |
      Division String Int       |
      Subtraction String Int    |
      SingleIntExp Int         
      deriving(Eq,Show)

data BooleanIntExp =
     LessThan String Int    |
     GreaterThan String Int |
     Equal String Int       |
     MultiBoolSttmnt BooleanIntExp BooleanIntExp
     deriving(Eq,Show)

--intExp = SingleIntExp | LT SingleIntExp SingleIntExp | GT SingleIntExp SingleIntExp | EQ SingleIntExp SingleIntExp

data URI =
      Select String String |
      BasicURI String  |
      BaseURI String   
      deriving(Eq,Show)


}