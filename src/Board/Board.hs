module Board.Board (
  create, ChessBoard, Square(..)
) where

import qualified Board.File as F (File (..), files)
import Board.Piece
import qualified Board.Rank as R (Rank, create, ranks)
import Data.Map (Map)
import qualified Data.Map as Map

type ChessBoard = Map Square (Maybe Piece)

data Square = Square
    { file :: F.File
    , rank :: R.Rank
    }
    deriving (Show, Ord, Eq)

emptyBoard :: ChessBoard
emptyBoard = Map.fromList $ (\x -> (x, Nothing)) <$> [Square f r | r <- R.ranks, f <- F.files]

pieces :: ChessBoard
pieces =
    Map.fromList
        [ (Square (F.A) $ R.create 1, Just $ Piece Rook White)
        , (Square (F.B) $ R.create 1, Just $ Piece Knight White)
        , (Square (F.C) $ R.create 1, Just $ Piece Bishop White)
        , (Square (F.D) $ R.create 1, Just $ Piece Queen White)
        , (Square (F.E) $ R.create 1, Just $ Piece King White)
        , (Square (F.F) $ R.create 1, Just $ Piece Bishop White)
        , (Square (F.G) $ R.create 1, Just $ Piece Knight White)
        , (Square (F.H) $ R.create 1, Just $ Piece Rook White)
        , (Square (F.A) $ R.create 8, Just $ Piece Rook Black)
        , (Square (F.B) $ R.create 8, Just $ Piece Knight Black)
        , (Square (F.C) $ R.create 8, Just $ Piece Bishop Black)
        , (Square (F.D) $ R.create 8, Just $ Piece Queen Black)
        , (Square (F.E) $ R.create 8, Just $ Piece King Black)
        , (Square (F.F) $ R.create 8, Just $ Piece Bishop Black)
        , (Square (F.G) $ R.create 8, Just $ Piece Knight Black)
        , (Square (F.H) $ R.create 8, Just $ Piece Rook Black)
        , (Square (F.A) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.B) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.C) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.D) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.E) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.F) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.G) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.H) $ R.create 2, Just $ Piece Pawn White)
        , (Square (F.A) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.B) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.C) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.D) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.E) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.F) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.G) $ R.create 7, Just $ Piece Pawn Black)
        , (Square (F.H) $ R.create 7, Just $ Piece Pawn Black)
        ]

create :: ChessBoard
create = Map.union pieces emptyBoard
