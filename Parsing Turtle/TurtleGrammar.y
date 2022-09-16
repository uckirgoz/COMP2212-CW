{
module TurtleGrammar where
import TurtleLexer
}

%name parseTurtle 

%tokentype { TurtleToken }
%error     { parseErrorTurtle }

%token 
    '.'                    { TokenDot _ } 
    ';'                    { TokenSemicolon _ } 
    ','                    { TokenComma _ } 
    BaseDef                { TokenBase _ }
    PrefixDef              { TokenPrefix _ }
    Select                 { TokenSelect _ $$ } 
    PrefixSelect           { TokenPrefixCol _ $$ }
    IRIReferance           { TokenIRI _ $$ }
    VariableName           { TokenVarName _ $$ }
    Boolean                { TokenBoolean _  $$ } 
    Integer                { TokenInt _ $$ }

%%
Expr : Lines        {  [$1] }
     | Lines Expr   { ($1 : $2) }

File : IRIReferance Objects ';' File                { ((FromIRI $1, $2) : $4)}
     | IRIReferance Objects                         { [(FromIRI $1, $2)] }
     | PrefixSelect VariableName Objects ';' File   { ((FromPrefix $1 $2, $3) : $5) }
     | PrefixSelect VariableName Objects            { [(FromPrefix $1 $2, $3)] }

Lines : BaseDef IRIReferance '.'                 { BaseInitial $2 }
               | IRIReferance File '.'                    { Triples (FromIRI $1) $2 }
               | PrefixDef PrefixSelect IRIReferance '.'  { PrefixInitial $2 $3 }   
               | PrefixSelect VariableName File '.'       { Fields (FromPrefix $1 $2) $3 }

Objects : Select                                   { [StringValue $1] }
        | IRIReferance ',' Objects                 { ((IRIValue $1) : $3) }
        | PrefixSelect VariableName ',' Objects    { ((PrefixValue $1 $2) : $4) }
        | IRIReferance                             { [IRIValue $1] }
        | Boolean ',' Objects                      { ((BooleanValue $1) : $3) }
        | Integer ',' Objects                      { ((IntegerValue $1) : $3) }
        | Boolean                                  { [BooleanValue $1] }
        | Integer                                  { [IntegerValue $1] }
        | PrefixSelect VariableName                { [PrefixValue $1 $2] }
        | Select ',' Objects                       { ((StringValue $1) : $3) }
               

{
parseErrorTurtle :: [TurtleToken] -> a
parseErrorTurtle [] = error "Unknown Parse Error" 
parseErrorTurtle (t:ts) = error ("Parse error at (line,column) " ++ show(tokenPosn t))

data Field =
  FromIRI String |
  FromPrefix String String 
  deriving (Eq,Show)

data TripleValue =
  StringValue String   |
  BooleanValue Bool    |
  IntegerValue Int     |
  IRIValue String      |
  PrefixValue String String
  deriving(Eq,Show)

data Lines = 
  Triples Field [(Field, [TripleValue])]   | --todo I think this might be causing the problem. yes it certainly is.
  BaseInitial String                                     |
  PrefixInitial String String
  deriving(Eq,Show)

type StorePrefix = [(String,String)]
type StoreTriple = [(Field, [TripleValue])]
type TurtleTuple = (String, String, TripleValue)
type ListTurtleTuple = [[TurtleTuple]]
type Expr = [Lines]

--objBase iri obj = [(FromIRI iri, obj)]
--fileBase iri obj file = ((FromIRI iri, obj) : file)
--valueBase iri obj = ((IRIValue iri) : obj)

--objPrefix sl name obj = [(FromPrefix sl name, obj)]
--filePrefix sl name obj file = ((FromPrefix sl, obj) : file) --this function was wrong fuck
--valuePrefix sl name obj = ((PrefixValue sl name) : obj)

--valueBool bl obj = ((BooleanValue bl) : obj) 
--valueInt x obj = ((IntegerValue x) : obj)
--valueString s obj = ((StringValue s) : obj)

--tripleBase iri file = (Triples ((FromIRI iri) file))
--triplePrefix iri obj file = (Triples (FromPrefix iri obj) file)

--expr1 x y = (x:y)
--expr2 x = [x]


}