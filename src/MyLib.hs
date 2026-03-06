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

euler1 :: Integer
euler1 = sum . filter (\i -> mod i 3 == 0 || mod i 5 == 0) $ [1 .. 999]

euler2 :: Integer
euler2 = sum . filter even . takeWhile (<= 4000000) $ fibs

euler3 :: Integer
euler3 = last . primeFactors $ 600851475143
