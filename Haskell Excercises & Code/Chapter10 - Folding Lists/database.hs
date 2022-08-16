module Database where

import Data.Time

data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [ DbDate (UTCTime 
                          (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123))
              , DbNumber 9001
              , DbString "Hello, world!"
              , DbDate (UTCTime
                        (fromGregorian 1921 5 1)
                        (secondsToDiffTime 34123))
              ]

-- 1. Write a function that filters for DbDate values and returns
-- a list of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate (DbDate (UTCTime d dif):_) = [UTCTime d dif]