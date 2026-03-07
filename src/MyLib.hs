module MyLib where

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (drop 1 fibs)

primes :: [Integer]
primes = filter isPrime [2 ..]

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime x
  | x < 2 = False
  | otherwise = null . primeFactors $ x

primeFactors :: Integer -> [Integer]
primeFactors x = underSqrt ++ overSqrt
  where
    underSqrt = filter (\p -> mod x p == 0) . takeWhile (\p -> p * p <= x) $ primes
    overSqrt = filter isPrime . map (\p -> div x p) . reverse $ underSqrt

isPalindrome :: Integer -> Bool
isPalindrome x
  | x < 0 = False
  | otherwise = x == (read . reverse . show) x

gcd' :: Integer -> Integer -> Integer
gcd' a b = gcd'' (abs a) (abs b)
  where
    gcd'' x 0 = x
    gcd'' x y = gcd'' y (mod x y)

lcm' :: Integer -> Integer -> Integer
lcm' 0 _ = 0
lcm' _ 0 = 0
lcm' x y = abs $ div (x * y) (gcd' x y)

euler1 :: Integer
euler1 = sum . filter (\i -> mod i 3 == 0 || mod i 5 == 0) $ [1 .. 999]

euler2 :: Integer
euler2 = sum . filter even . takeWhile (<= 4000000) $ fibs

euler3 :: Integer
euler3 = last . primeFactors $ 600851475143

euler4 :: Integer
euler4 = maximum . filter isPalindrome $ [a * b | a <- [100 .. 999], b <- [100 .. a]]

euler5 :: Integer
euler5 = foldl1 lcm' [1 .. 20]
