module Main (main) where

import MyLib
import Test.Hspec

main :: IO ()
main = hspec $ do 
  describe "solutions" $ do
    it "euler1" $ do
      shouldBe euler1 233168
