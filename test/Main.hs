module Main (main) where

import MyLib
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "solutions" $ do
    it "euler1" $ do
      shouldBe euler1 233168
    it "euler2" $ do
      shouldBe euler2 4613732
    it "euler3" $ do
      shouldBe euler3 6857
    it "euler4" $ do
      shouldBe euler4 906609
    it "euler5" $ do
      shouldBe euler5 232792560
    it "euler6" $ do
      shouldBe euler6 25164150
    it "euler7" $ do
      shouldBe euler7 104743
  describe "primes" $ do
    it "first 10" $ do
      shouldBe (take 10 primes) [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    it "1 is not prime" $ do
      shouldBe (isPrime 1) False
    it "prime factors of 34" $ do
      shouldBe (primeFactors 34) [2, 17]
