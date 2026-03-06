module MyLib (euler1) where

euler1 :: Integer
euler1 = sum . filter (\i -> mod i 3 == 0 || mod i 5 == 0) $ [1..999]

