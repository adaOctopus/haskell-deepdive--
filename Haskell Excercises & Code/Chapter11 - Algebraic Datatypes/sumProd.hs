module SumProd where


data GuessWhat = Chickenbutt deriving (Eq, Show)

data Id a = MkId a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b = First a | Second b deriving (Eq, Show)

data RecordProduct a b = RecordProduct { pfirst :: a
                                         , psecond :: b } deriving (Eq, Show)


newtype NumCow = NumCow Int deriving (Eq, Show)

newtype NumPig = NumPig Int deriving (Eq, Show)

data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)

type Farmhouse2 = Product NumCow NumPig

gona :: Farmhouse2 -> Bool
gona x = True


-- Define some custom Sum & Product types
-- 1 Cryptocurrency company
-- 2 Crypto token specs
-- 3 Blockchain Network

type TotalSupply = Integer 
type TokenName   = String 
data Crypto      = Crypto TokenName TotalSupply deriving (Eq, Show) -- Product type
data Layer       = LayerOne | LayerTwo deriving (Eq, Show) -- sumType cardinality 2
data Consensus   = ProofOfStake | ProofOfWork deriving (Eq, Show) -- sumType cardinality 2
newtype Blockchain = Blockchain Layer Consensus deriving (Eq, Show) -- Product Type -  cardinality 4