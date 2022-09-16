{-# OPTIONS_GHC -w #-}
module SPARQLGrammar where
import SPARQLTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
	= HappyTerminal (SPARQLToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,179) ([0,56,0,0,0,64,0,0,0,0,0,0,1,0,0,0,0,128,32768,0,0,4096,0,0,0,0,256,0,0,0,0,0,4,0,0,0,64,12288,0,0,0,0,0,128,0,0,0,2,832,32768,0,0,0,0,16,0,0,0,4,0,0,0,8,0,0,0,8,2048,0,0,0,0,0,0,0,0,0,0,0,16448,0,0,0,1024,32768,6,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,256,0,4,0,0,0,0,0,0,0,0,0,512,0,0,16784,14848,0,4096,0,0,0,0,64,26624,0,256,0,0,0,0,0,0,0,2048,16384,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,2048,0,0,0,4096,0,0,0,8192,0,0,0,0,0,0,128,0,0,0,8,0,0,0,0,0,0,0,16384,0,104,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,128,0,0,0,0,0,0,0,0,64,26624,0,0,3200,53248,1,0,0,0,0,512,144,0,0,0,0,0,0,0,128,0,0,0,1024,0,0,0,8192,0,0,0,16384,0,104,0,0,0,0,0,0,0,0,0,0,1,0,0,0,3072,0,0,0,8,0,0,2048,0,0,0,128,1024,0,0,0,2048,0,0,0,0,53248,0,0,0,40960,1,0,0,0,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,64,0,1024,0,0,0,32768,0,208,0,32768,0,0,0,0,0,832,0,0,0,1664,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,16,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseSPARQL","Decleration","Prefixes","Exp","DataProposition","WhereProposition","Filter","BooleanOperation","BooleanTerm","GenerateTriple","WhereBracket","WhereTrpls","Obj","ObjExp","SubTerm","IntExps","URI","CONSTRUCT","PREFIX","BASE","ASK","UNION","WHERE","FILTER","IMPORT","AS","SELECT","FROM","GROUP","ORDER","BY","regex","'{'","'}'","'('","')'","Variable","file","fileVar","true","false","','","'.'","':'","'=='","'!='","'!'","or","and","'+'","'*'","'-'","'//'","'<'","'>'","'='","Integer","PrefixName","Tag","BaseURI1","URIValue","StringValue","%eof"]
        bit_start = st Prelude.* 65
        bit_end = (st Prelude.+ 1) Prelude.* 65
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..64]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (20) = happyShift action_6
action_0 (21) = happyShift action_7
action_0 (22) = happyShift action_8
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 (6) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (63) = happyShift action_15
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (65) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (20) = happyShift action_6
action_4 (44) = happyShift action_14
action_4 (6) = happyGoto action_13
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (24) = happyShift action_12
action_5 _ = happyReduce_4

action_6 (35) = happyShift action_11
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (60) = happyShift action_10
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (63) = happyShift action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (20) = happyShift action_6
action_9 (21) = happyShift action_7
action_9 (5) = happyGoto action_16
action_9 (6) = happyGoto action_27
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (46) = happyShift action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (39) = happyShift action_22
action_11 (60) = happyShift action_23
action_11 (62) = happyShift action_24
action_11 (63) = happyShift action_25
action_11 (12) = happyGoto action_19
action_11 (17) = happyGoto action_20
action_11 (19) = happyGoto action_21
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (20) = happyShift action_6
action_12 (6) = happyGoto action_18
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (24) = happyShift action_12
action_13 _ = happyReduce_3

action_14 (21) = happyShift action_7
action_14 (5) = happyGoto action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_7
action_15 (5) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (20) = happyShift action_6
action_16 (44) = happyShift action_14
action_16 (6) = happyGoto action_33
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_5

action_18 _ = happyReduce_7

action_19 (36) = happyShift action_31
action_19 (44) = happyShift action_32
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (39) = happyShift action_22
action_20 (60) = happyShift action_23
action_20 (62) = happyShift action_24
action_20 (63) = happyShift action_25
action_20 (17) = happyGoto action_30
action_20 (19) = happyGoto action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_35

action_22 _ = happyReduce_34

action_23 (46) = happyShift action_29
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_42

action_25 _ = happyReduce_41

action_26 (63) = happyShift action_28
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (24) = happyShift action_12
action_27 _ = happyReduce_2

action_28 _ = happyReduce_6

action_29 (61) = happyShift action_46
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (39) = happyShift action_41
action_30 (42) = happyShift action_42
action_30 (43) = happyShift action_43
action_30 (49) = happyShift action_44
action_30 (60) = happyShift action_23
action_30 (62) = happyShift action_24
action_30 (63) = happyShift action_25
action_30 (64) = happyShift action_45
action_30 (15) = happyGoto action_37
action_30 (16) = happyGoto action_38
action_30 (18) = happyGoto action_39
action_30 (19) = happyGoto action_40
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (30) = happyShift action_36
action_31 (7) = happyGoto action_35
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (39) = happyShift action_22
action_32 (60) = happyShift action_23
action_32 (62) = happyShift action_24
action_32 (63) = happyShift action_25
action_32 (12) = happyGoto action_34
action_32 (17) = happyGoto action_20
action_32 (19) = happyGoto action_21
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_12
action_33 _ = happyReduce_1

action_34 _ = happyReduce_21

action_35 (25) = happyShift action_53
action_35 (44) = happyShift action_54
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (40) = happyShift action_52
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_33

action_38 _ = happyReduce_22

action_39 _ = happyReduce_31

action_40 _ = happyReduce_26

action_41 (52) = happyShift action_48
action_41 (53) = happyShift action_49
action_41 (54) = happyShift action_50
action_41 (55) = happyShift action_51
action_41 _ = happyReduce_28

action_42 _ = happyReduce_29

action_43 _ = happyReduce_30

action_44 (39) = happyShift action_47
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_27

action_46 _ = happyReduce_40

action_47 _ = happyReduce_32

action_48 (59) = happyShift action_60
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (59) = happyShift action_59
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (59) = happyShift action_58
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (59) = happyShift action_57
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_10

action_53 (35) = happyShift action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (30) = happyShift action_36
action_54 (7) = happyGoto action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_9

action_56 (39) = happyShift action_22
action_56 (60) = happyShift action_23
action_56 (62) = happyShift action_24
action_56 (63) = happyShift action_25
action_56 (8) = happyGoto action_61
action_56 (13) = happyGoto action_62
action_56 (14) = happyGoto action_63
action_56 (17) = happyGoto action_64
action_56 (19) = happyGoto action_21
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_38

action_58 _ = happyReduce_39

action_59 _ = happyReduce_37

action_60 _ = happyReduce_36

action_61 (36) = happyShift action_68
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (26) = happyShift action_67
action_62 (9) = happyGoto action_66
action_62 _ = happyReduce_12

action_63 _ = happyReduce_23

action_64 (39) = happyShift action_22
action_64 (60) = happyShift action_23
action_64 (62) = happyShift action_24
action_64 (63) = happyShift action_25
action_64 (17) = happyGoto action_65
action_64 (19) = happyGoto action_21
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyShift action_73
action_65 (42) = happyShift action_42
action_65 (43) = happyShift action_43
action_65 (60) = happyShift action_23
action_65 (62) = happyShift action_24
action_65 (63) = happyShift action_25
action_65 (64) = happyShift action_45
action_65 (15) = happyGoto action_72
action_65 (19) = happyGoto action_40
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_11

action_67 (23) = happyShift action_69
action_67 (34) = happyShift action_70
action_67 (37) = happyShift action_71
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_8

action_69 (35) = happyShift action_78
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (37) = happyShift action_77
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_76
action_71 (10) = happyGoto action_75
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_22
action_72 (60) = happyShift action_23
action_72 (62) = happyShift action_24
action_72 (63) = happyShift action_25
action_72 (14) = happyGoto action_74
action_72 (17) = happyGoto action_64
action_72 (19) = happyGoto action_21
action_72 _ = happyReduce_25

action_73 _ = happyReduce_28

action_74 _ = happyReduce_24

action_75 (38) = happyShift action_83
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (47) = happyShift action_81
action_76 (48) = happyShift action_82
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (39) = happyShift action_80
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (30) = happyShift action_36
action_78 (7) = happyGoto action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (25) = happyShift action_88
action_79 (44) = happyShift action_54
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (44) = happyShift action_87
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (60) = happyShift action_23
action_81 (62) = happyShift action_24
action_81 (63) = happyShift action_25
action_81 (11) = happyGoto action_86
action_81 (19) = happyGoto action_85
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (60) = happyShift action_23
action_82 (62) = happyShift action_24
action_82 (63) = happyShift action_25
action_82 (11) = happyGoto action_84
action_82 (19) = happyGoto action_85
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_13

action_84 _ = happyReduce_17

action_85 (50) = happyShift action_91
action_85 (51) = happyShift action_92
action_85 _ = happyReduce_20

action_86 _ = happyReduce_16

action_87 (64) = happyShift action_90
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (35) = happyShift action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (39) = happyShift action_22
action_89 (60) = happyShift action_23
action_89 (62) = happyShift action_24
action_89 (63) = happyShift action_25
action_89 (8) = happyGoto action_96
action_89 (13) = happyGoto action_62
action_89 (14) = happyGoto action_63
action_89 (17) = happyGoto action_64
action_89 (19) = happyGoto action_21
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (38) = happyShift action_95
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (60) = happyShift action_23
action_91 (62) = happyShift action_24
action_91 (63) = happyShift action_25
action_91 (11) = happyGoto action_94
action_91 (19) = happyGoto action_85
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (60) = happyShift action_23
action_92 (62) = happyShift action_24
action_92 (63) = happyShift action_25
action_92 (11) = happyGoto action_93
action_92 (19) = happyGoto action_85
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_19

action_94 _ = happyReduce_18

action_95 _ = happyReduce_15

action_96 (36) = happyShift action_97
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (36) = happyShift action_98
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_14

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyTerminal (TokenURI _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (BasePrefixDecl happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_3)
	(HappyTerminal (TokenURI _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (BaseDecl happy_var_2 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  4 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (PrefixDecl happy_var_1 happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (NoDecl happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (PrefixCombination happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 4 5 happyReduction_6
happyReduction_6 ((HappyTerminal (TokenURI _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPrefixName _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Prefix happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Union happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 9 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Construct happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (FileCombination happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyTerminal (TokenFileName _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (FromFile happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (WhereWithFilter happy_var_1 happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (Where happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (BooleanFilter happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 9 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Ask happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 7 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Regex happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn10
		 (IsEq happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn10
		 (NotEq happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn11
		 (OrBoolTerm happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn11
		 (AndBoolTerm happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn11
		 (BoolObj happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (TripleCombination happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (Triple happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (WhereBracket happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 14 happyReduction_24
happyReduction_24 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (WTrpl happy_var_1 happy_var_2 happy_var_3 : happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn14
		 ([WTrpl happy_var_1 happy_var_2 happy_var_3]
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  15 happyReduction_26
happyReduction_26 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn15
		 (ObjURI happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn15
		 (ObjStr happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn15
		 (ObjVar happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn15
		 (BooleanTrue
	)

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn15
		 (BooleanFalse
	)

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn16
		 (IntExp happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  16 happyReduction_32
happyReduction_32 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Not happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (BasicObject happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  17 happyReduction_34
happyReduction_34 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn17
		 (PredVar happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  17 happyReduction_35
happyReduction_35 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn17
		 (PredURI happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  18 happyReduction_36
happyReduction_36 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn18
		 (Addition happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn18
		 (Multiplication happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  18 happyReduction_38
happyReduction_38 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn18
		 (Division happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyTerminal (TokenInt _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn18
		 (Subtraction happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  19 happyReduction_40
happyReduction_40 (HappyTerminal (TokenTag _ happy_var_3))
	_
	(HappyTerminal (TokenPrefixName _ happy_var_1))
	 =  HappyAbsSyn19
		 (Select happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  19 happyReduction_41
happyReduction_41 (HappyTerminal (TokenURI _ happy_var_1))
	 =  HappyAbsSyn19
		 (BasicURI happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  19 happyReduction_42
happyReduction_42 (HappyTerminal (TokenBaseURI _ happy_var_1))
	 =  HappyAbsSyn19
		 (BaseURI happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 65 65 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenConstructQuery _ -> cont 20;
	TokenPrefixDecl _ -> cont 21;
	TokenBaseDecl _ -> cont 22;
	TokenAskQuery _ -> cont 23;
	TokenGroupPattern _ -> cont 24;
	TokenWhere _ -> cont 25;
	TokenFilter _ -> cont 26;
	TokenImport _ -> cont 27;
	TokenAs _ -> cont 28;
	TokenSelectClause _ -> cont 29;
	TokenFrom _ -> cont 30;
	TokenGroup _ -> cont 31;
	TokenOrder _ -> cont 32;
	TokenDoBy _ -> cont 33;
	TokenRegex _ -> cont 34;
	TokenOpenBracket _ -> cont 35;
	TokenCloseBracket _ -> cont 36;
	TokenOpenParen _ -> cont 37;
	TokenCloseParen _ -> cont 38;
	TokenVar _ happy_dollar_dollar -> cont 39;
	TokenFileName _ happy_dollar_dollar -> cont 40;
	TokenFileVar _ happy_dollar_dollar -> cont 41;
	TokenBoolean _ True -> cont 42;
	TokenBoolean _ False -> cont 43;
	TokenComma _ -> cont 44;
	TokenDot _ -> cont 45;
	TokenColon _ -> cont 46;
	TokenCmpr _ -> cont 47;
	TokenNeq _ -> cont 48;
	TokenNot _ -> cont 49;
	TokenOr _ -> cont 50;
	TokenAnd _ -> cont 51;
	TokenPlus _ -> cont 52;
	TokenMulti _ -> cont 53;
	TokenSub _ -> cont 54;
	TokenDiv _ -> cont 55;
	TokenLT _ -> cont 56;
	TokenGT _ -> cont 57;
	TokenEq _ -> cont 58;
	TokenInt _ happy_dollar_dollar -> cont 59;
	TokenPrefixName _ happy_dollar_dollar -> cont 60;
	TokenTag _ happy_dollar_dollar -> cont 61;
	TokenBaseURI _ happy_dollar_dollar -> cont 62;
	TokenURI _ happy_dollar_dollar -> cont 63;
	TokenString _ happy_dollar_dollar -> cont 64;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 65 tk tks = happyError' (tks, explist)
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
happyError' :: () => ([(SPARQLToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseErrorSPARQL tokens)
parseSPARQL tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
     Regex String String                  
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
      Subtraction String Int    
      deriving(Eq,Show)

data URI =
      Select String String |
      BasicURI String  |
      BaseURI String   
      deriving(Eq,Show)
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
