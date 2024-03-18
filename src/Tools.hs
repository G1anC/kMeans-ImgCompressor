{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Tools.hs
-}

module Tools where

import Struct.Cluster
import Struct.Point

-- use averageColor to calculate the average distance
calculateAverage :: Float -> Int -> [Cluster] -> Float
calculateAverage res n [] = res / fromIntegral n
calculateAverage res n (x:xs) = calculateAverage res (n + 1) xs