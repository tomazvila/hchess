module Board.Piece (
    Piece (..),
    Colour (..),
    PieceType (..),
) where

data PieceType
    = Pawn
    | Rook
    | Bishop
    | Knight
    | Queen
    | King
    deriving (Show)

data Colour = White | Black deriving (Show)

data Piece = Piece
    { ptype :: PieceType
    , colour :: Colour
    }
    deriving (Show)
