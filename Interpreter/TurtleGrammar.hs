{-# OPTIONS_GHC -w #-}
module TurtleGrammar where
import TurtleLexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (TurtleToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,58) ([27648,24576,3,0,128,512,16384,32768,1,0,108,0,32,0,1,55,48,256,16,0,1024,8192,0,2,32,16384,2048,16384,0,2,7040,0,512,0,55,440,3520,64,28672,3,3,0,0,0,0,49152,13,0,0,0,6144,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTurtle","Expr","File","Lines","Objects","'.'","';'","','","BaseDef","PrefixDef","Select","PrefixSelect","IRIReferance","VariableName","Boolean","Integer","%eof"]
        bit_start = st Prelude.* 19
        bit_end = (st Prelude.+ 1) Prelude.* 19
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..18]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (11) = happyShift action_3
action_0 (12) = happyShift action_4
action_0 (14) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (6) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_3
action_1 (12) = happyShift action_4
action_1 (14) = happyShift action_5
action_1 (15) = happyShift action_6
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_15
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (14) = happyShift action_14
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (16) = happyShift action_13
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (14) = happyShift action_11
action_6 (15) = happyShift action_12
action_6 (5) = happyGoto action_10
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (19) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (11) = happyShift action_3
action_8 (12) = happyShift action_4
action_8 (14) = happyShift action_5
action_8 (15) = happyShift action_6
action_8 (4) = happyGoto action_9
action_8 (6) = happyGoto action_8
action_8 _ = happyReduce_1

action_9 _ = happyReduce_2

action_10 (8) = happyShift action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (16) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (13) = happyShift action_20
action_12 (14) = happyShift action_21
action_12 (15) = happyShift action_22
action_12 (17) = happyShift action_23
action_12 (18) = happyShift action_24
action_12 (7) = happyGoto action_19
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (14) = happyShift action_11
action_13 (15) = happyShift action_12
action_13 (5) = happyGoto action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (15) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (8) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_7

action_17 (8) = happyShift action_35
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (8) = happyShift action_34
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (9) = happyShift action_33
action_19 _ = happyReduce_4

action_20 (10) = happyShift action_32
action_20 _ = happyReduce_11

action_21 (16) = happyShift action_31
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_30
action_22 _ = happyReduce_14

action_23 (10) = happyShift action_29
action_23 _ = happyReduce_17

action_24 (10) = happyShift action_28
action_24 _ = happyReduce_18

action_25 (13) = happyShift action_20
action_25 (14) = happyShift action_21
action_25 (15) = happyShift action_22
action_25 (17) = happyShift action_23
action_25 (18) = happyShift action_24
action_25 (7) = happyGoto action_27
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_8

action_27 (9) = happyShift action_42
action_27 _ = happyReduce_6

action_28 (13) = happyShift action_20
action_28 (14) = happyShift action_21
action_28 (15) = happyShift action_22
action_28 (17) = happyShift action_23
action_28 (18) = happyShift action_24
action_28 (7) = happyGoto action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (13) = happyShift action_20
action_29 (14) = happyShift action_21
action_29 (15) = happyShift action_22
action_29 (17) = happyShift action_23
action_29 (18) = happyShift action_24
action_29 (7) = happyGoto action_40
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (13) = happyShift action_20
action_30 (14) = happyShift action_21
action_30 (15) = happyShift action_22
action_30 (17) = happyShift action_23
action_30 (18) = happyShift action_24
action_30 (7) = happyGoto action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (10) = happyShift action_38
action_31 _ = happyReduce_19

action_32 (13) = happyShift action_20
action_32 (14) = happyShift action_21
action_32 (15) = happyShift action_22
action_32 (17) = happyShift action_23
action_32 (18) = happyShift action_24
action_32 (7) = happyGoto action_37
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (14) = happyShift action_11
action_33 (15) = happyShift action_12
action_33 (5) = happyGoto action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_10

action_35 _ = happyReduce_9

action_36 _ = happyReduce_3

action_37 _ = happyReduce_20

action_38 (13) = happyShift action_20
action_38 (14) = happyShift action_21
action_38 (15) = happyShift action_22
action_38 (17) = happyShift action_23
action_38 (18) = happyShift action_24
action_38 (7) = happyGoto action_44
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_12

action_40 _ = happyReduce_15

action_41 _ = happyReduce_16

action_42 (14) = happyShift action_11
action_42 (15) = happyShift action_12
action_42 (5) = happyGoto action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_5

action_44 _ = happyReduce_13

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 ((happy_var_1 : happy_var_2)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIRI _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (((FromIRI happy_var_1, happy_var_2) : happy_var_4)
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_2)
	(HappyTerminal (TokenIRI _ happy_var_1))
	 =  HappyAbsSyn5
		 ([(FromIRI happy_var_1, happy_var_2)]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 5 5 happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	(HappyTerminal (TokenVarName _ happy_var_2)) `HappyStk`
	(HappyTerminal (TokenPrefixCol _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (((FromPrefix happy_var_1 happy_var_2, happy_var_3) : happy_var_5)
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_3)
	(HappyTerminal (TokenVarName _ happy_var_2))
	(HappyTerminal (TokenPrefixCol _ happy_var_1))
	 =  HappyAbsSyn5
		 ([(FromPrefix happy_var_1 happy_var_2, happy_var_3)]
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 _
	(HappyTerminal (TokenIRI _ happy_var_2))
	_
	 =  HappyAbsSyn6
		 (BaseInitial happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TokenIRI _ happy_var_1))
	 =  HappyAbsSyn6
		 (Triples (FromIRI happy_var_1) happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyTerminal (TokenIRI _ happy_var_3)) `HappyStk`
	(HappyTerminal (TokenPrefixCol _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (PrefixInitial happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyTerminal (TokenVarName _ happy_var_2)) `HappyStk`
	(HappyTerminal (TokenPrefixCol _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Triples (FromPrefix happy_var_1 happy_var_2) happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyTerminal (TokenSelect _ happy_var_1))
	 =  HappyAbsSyn7
		 ([StringValue happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenIRI _ happy_var_1))
	 =  HappyAbsSyn7
		 (((IRIValue happy_var_1) : happy_var_3)
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVarName _ happy_var_2)) `HappyStk`
	(HappyTerminal (TokenPrefixCol _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (((PrefixValue happy_var_1 happy_var_2) : happy_var_4)
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 (HappyTerminal (TokenIRI _ happy_var_1))
	 =  HappyAbsSyn7
		 ([IRIValue happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenBoolean _  happy_var_1))
	 =  HappyAbsSyn7
		 (((BooleanValue happy_var_1) : happy_var_3)
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn7
		 (((IntegerValue happy_var_1) : happy_var_3)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 (HappyTerminal (TokenBoolean _  happy_var_1))
	 =  HappyAbsSyn7
		 ([BooleanValue happy_var_1]
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn7
		 ([IntegerValue happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  7 happyReduction_19
happyReduction_19 (HappyTerminal (TokenVarName _ happy_var_2))
	(HappyTerminal (TokenPrefixCol _ happy_var_1))
	 =  HappyAbsSyn7
		 ([PrefixValue happy_var_1 happy_var_2]
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenSelect _ happy_var_1))
	 =  HappyAbsSyn7
		 (((StringValue happy_var_1) : happy_var_3)
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 19 19 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenDot _ -> cont 8;
	TokenSemicolon _ -> cont 9;
	TokenComma _ -> cont 10;
	TokenBase _ -> cont 11;
	TokenPrefix _ -> cont 12;
	TokenSelect _ happy_dollar_dollar -> cont 13;
	TokenPrefixCol _ happy_dollar_dollar -> cont 14;
	TokenIRI _ happy_dollar_dollar -> cont 15;
	TokenVarName _ happy_dollar_dollar -> cont 16;
	TokenBoolean _  happy_dollar_dollar -> cont 17;
	TokenInt _ happy_dollar_dollar -> cont 18;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 19 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(TurtleToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseErrorTurtle tokens)
parseTurtle tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
