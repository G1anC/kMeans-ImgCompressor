{- 
-- EPITECH PROJECT, 2023
-- compressor
-- File description:
-- AverageColor.hs
-}

module Lib.AverageColor where

import Data.Maybe (catMaybes)
import Struct.Point

averageColor :: [Point] -> (Int, Int, Int)
averageColor [] = (0, 0, 0)
averageColor p =
    let col = catMaybes (map color p) 
        (r, g, b) = foldl (\(r, g, b) (x, y, z) -> (r+x, g+y, b+z)) (0,0,0) col
        sizeOfColor = length col
    in if sizeOfColor == 0
           then (0, 0, 0)
           else (r `div` sizeOfColor, g `div` sizeOfColor, b `div` sizeOfColor)
