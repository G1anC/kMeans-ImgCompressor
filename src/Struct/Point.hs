{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Point.hs
-}

module Struct.Point where

import Text.Read (readMaybe)

data Point = Point {
    pos :: Maybe (Int, Int),
    color :: Maybe (Int, Int, Int)
} deriving (Eq)

createPoint :: String -> String -> Point
createPoint p c = Point {
    pos = readMaybe p :: Maybe (Int, Int),
    color = readMaybe c :: Maybe (Int, Int, Int)
}

readPoints :: [String] -> [Point]
readPoints [] = []
readPoints (x:y:xs) = createPoint x y : readPoints xs
readPoints _ = error "Invalid file"

