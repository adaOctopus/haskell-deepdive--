module Chiper where 

import Data.Char
import Data.List -- elemIndex

-- ord and chr

-- Take a letter
-- shift 3 places to the right and replace that letter with it
-- do it with input as char only
-- ceasarCipher :: Char -> Char
ceasarCipher a = elemIndex a alphabet
  where
    alphabet = ['A'..'Z']
    newIndex 