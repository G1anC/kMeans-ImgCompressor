{-
-- EPITECH PROJECT, 2024
-- compressor
-- File description:
-- AverageDiff
-}

module Lib.AverageDiff where

import Struct.Cluster

averageDiff :: (Int, Int, Int) -> (Int, Int, Int) -> Float
averageDiff (r1, g1, b1) (r2, g2, b2) =
    let r = fromIntegral (r1 - r2) ** 2
        g = fromIntegral (g1 - g2) ** 2
        b = fromIntegral (b1 - b2) ** 2
    in sqrt (r + g + b)


getLimit :: [Cluster] -> [Cluster] -> Float
getLimit [] _ = 0
getLimit _ [] = 0
getLimit (x:xs) (y:ys) =
    let (r1, g1, b1) = ref x
        (r2, g2, b2) = ref y
    in averageDiff (r1, g1, b1) (r2, g2, b2) + getLimit xs ys