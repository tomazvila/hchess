module Main where

import Brick

ui :: Widget ()
ui = str "Hello, world!"

{- |
 Main entry point.

 The `bin/run` script will invoke this function. See `.ghcid` file to change
 that.
-}
main :: IO ()
main = do
  simpleMain ui
