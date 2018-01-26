module Main where

import Prelude
import Control.Monad.Eff.Console (log)
import Test.Assert

data V

derive instance eqV :: Eq V

derive instance ordV :: Ord V

type MyString = String

data X = X Int | Y MyString

derive instance eqX :: Eq X

derive instance ordX :: Ord X

newtype Z = Z { left :: X, right :: X }

derive instance eqZ :: Eq Z

data YearMonth = YearMonth {
    year :: Int,
    month :: Int
  }

derive instance eqYearMonth :: Eq YearMonth
derive instance ordYearMonth :: Ord YearMonth

main = do
  assert $ X 0 == X 0
  assert $ X 0 /= X 1
  assert $ Y "Foo" == Y "Foo"
  assert $ Y "Foo" /= Y "Bar"
  assert $ X 0 < X 1
  assert $ X 0 < Y "Foo"
  assert $ Y "Bar" < Y "Baz"
  assert $ z == z
  assert $ YearMonth {year: 2018, month: 1} > YearMonth {year: 2017, month: 12}
  log "Done"
  where
  z = Z { left: X 0, right: Y "Foo" }
