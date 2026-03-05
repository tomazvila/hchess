{-# LANGUAGE OverloadedStrings #-}

module Main where

import Brick
import Brick.Widgets.Center (center)
import Brick.Widgets.Table
import qualified Data.Map as Map

import Board.Board (create, Square(..))
import qualified Board.File as F (files)
import qualified Board.Rank as R (ranks)
import Board.Piece (Piece(..), PieceType(..), Colour(..))

ui :: Widget ()
ui =
  center $
    renderTable board

board :: Table ()
board = table
  [ [ renderSquare f r | f <- F.files ]
  | r <- reverse R.ranks
  ]
  where
    renderSquare f r = case Map.lookup (Square f r) create of
      Just (Just piece) -> pieceToWidget piece
      _                 -> txt "  "

pieceToWidget :: Piece -> Widget ()
pieceToWidget (Piece King White)   = txt "♚"
pieceToWidget (Piece Queen White)  = txt "♛"
pieceToWidget (Piece Rook White)   = txt "♜"
pieceToWidget (Piece Bishop White) = txt "♝"
pieceToWidget (Piece Knight White) = txt "♞"
pieceToWidget (Piece Pawn White)   = txt "♟"
pieceToWidget (Piece King Black)   = txt "♔"
pieceToWidget (Piece Queen Black)  = txt "♕"
pieceToWidget (Piece Rook Black)   = txt "♖"
pieceToWidget (Piece Bishop Black) = txt "♗"
pieceToWidget (Piece Knight Black) = txt "♘"
pieceToWidget (Piece Pawn Black)   = txt "♙"

{- |
 Main entry point.

 The `bin/run` script will invoke this function. See `.ghcid` file to change
 that.
-}
main :: IO ()
main = simpleMain ui


