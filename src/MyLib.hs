module MyLib (euler1, euler2) where

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (drop 1 fibs)

euler1 :: Integer
euler1 = sum . filter (\i -> mod i 3 == 0 || mod i 5 == 0) $ [1 .. 999]

euler2 :: Integer
euler2 = sum . filter even . takeWhile (<= 4000000) $ fibs
