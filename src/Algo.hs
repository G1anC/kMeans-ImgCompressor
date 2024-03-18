{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Main.hs
-}

module Algo where

import Lib.MaybeToA
import Lib.Printers
import Lib.AverageColor
import Lib.RemoveInstances
import Lib.RemoveDoublons

import Struct.Cluster
import Struct.Point

import System.Environment (getArgs)
import System.Exit (exitSuccess, exitWith, ExitCode(ExitFailure))
import Data.Maybe (catMaybes)




distance :: (Int, Int, Int) -> (Int, Int, Int) -> Float
distance (r1, g1, b1) (r2, g2, b2) =
    sqrt $ fromIntegral $ (r1 - r2) ^ 2 + (g1 - g2) ^ 2 + (b1 - b2) ^ 2

minDistance :: [(Float, Int)] -> Int
minDistance [(v, index)] = index
minDistance ((v, index):(v', index'):xs) =
    if v < v'
        then minDistance ((v, index):xs)
        else minDistance ((v', index'):xs)

getAllDistances :: Point -> [Cluster] -> [(Float, Int)]
getAllDistances _ [] = []
getAllDistances p (x:xs) = 
    (distance (mTA (color p)) (ref x), index x) : getAllDistances p xs



getAllPointsForCluster :: [Point] -> [Point] -> [Cluster] -> [Point]
getAllPointsForCluster newP [] _ = newP
getAllPointsForCluster newP (x:xs) clu =
    let n = minDistance (getAllDistances x clu)
    in if n == index (head clu)
        then newP ++ getAllPointsForCluster (x:newP) xs clu
        else getAllPointsForCluster newP xs clu
 
createNewCluster :: Int -> Int -> [Point] -> [Cluster] -> [Cluster]
createNewCluster 0 _ _ _ = []
createNewCluster n i p (x:xs) =
    let newP = removeDoublons (getAllPointsForCluster [] p (x:xs))
    in Cluster {
        points = newP,
        ref = averageColor newP,
        index = i
    } : createNewCluster (n - 1) (i + 1) (removeInstances p newP) xs




