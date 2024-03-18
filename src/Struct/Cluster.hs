{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Cluster.hs
-}

module Struct.Cluster where

import Struct.Point
import Lib.MaybeToA

import System.Exit
import System.IO.Unsafe
import System.Random

data Cluster = Cluster {
    points :: [Point],
    index :: Int,
    ref :: (Int, Int, Int)
}

randomElem :: [Point] -> IO Point
randomElem xs = do
    index <- randomRIO (0, length xs - 1)
    return $ selectElem index xs
    where
        selectElem :: Int -> [Point] -> Point
        selectElem 0 (x:_) = x
        selectElem n (_:xs) = selectElem (n - 1) xs

getRandElem :: [Point] -> (Int, Int, Int)
getRandElem xs = 
    let p = unsafePerformIO $ randomElem xs
        (Just (x, y, z)) = color p
    in (x, y, z)


getClusters :: [Point] -> Int -> [Cluster]
getClusters _ 0 = []
getClusters xs n = Cluster {
        ref = getRandElem xs,
        index = n,
        points = []
    } : getClusters xs (n - 1)