module Algbraic where 


data Price = Price Integer deriving (Eq, Show)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show) 
data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)
data Vehicle = Car Manufacturer Price | Plane Airline deriving  (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

-- 1. myCar type :: Vehicle
-- 2. urCar  type :: Vehicle

-- 2. Given the following, define the functions:
isCar :: Vehicle -> Bool
isCar (Car Mini (Price n))  = True
isCar (Car Mazda (Price n))  = True
isCar (Car Tata (Price n))  = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane = undefined
areCars :: [Vehicle] -> [Bool]
areCars = undefined