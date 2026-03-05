module Board.File (
    File (..),
    files,
) where

files :: [File]
files = [A, B, C, D, E, F, G, H]

data File = A | B | C | D | E | F | G | H deriving (Show, Ord, Eq)
