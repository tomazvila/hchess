module Board.Rank (
  Rank,
  ranks,
  create,
) where

create :: Int -> Rank
create n
  | n < 0 = Rank 0
  | n > 8 = Rank 8
  | otherwise = Rank n

ranks :: [Rank]
ranks = create <$> [1 .. 8]

newtype Rank = Rank Int deriving (Show, Ord, Eq)
instance Bounded Rank where
  minBound = Rank 1
  maxBound = Rank 8
