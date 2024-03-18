{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Main.hs
-}

module Main (main) where

import Struct.Point
import Struct.Config
import Struct.Cluster

import Lib.AverageColor
import Lib.Printers (printClusters, printPoints)
import Lib.MaybeToA
import Lib.Errors
import Lib.AverageDiff

import Algo
import Tools
import System.Environment (getArgs)
import System.Exit (exitSuccess, exitWith, ExitCode(ExitFailure))

kMeans :: Int -> Float -> [Point] -> [Cluster] -> IO ()
kMeans num lim p clu =
    let newClu = createNewCluster num 0 p clu
        average = getLimit newClu clu
    in if (lim > average)
        then printClusters newClu
        else kMeans num lim p newClu

core :: Conf -> IO ()
core conf = do
    c <- content conf
    let points = readPoints c
        nu = mTA (n conf)
        lim = mTA (limit conf)
        cluster = getClusters points nu
    checkErrors nu lim points
    kMeans nu lim points cluster

main :: IO ()
main = do 
    args <- getArgs
    let conf = getOpts createConf args
    if (length args < 6)
        then putStrLn "Invalid Number of Args" >> exitWith (ExitFailure 84)
        else case conf of
            Nothing -> putStrLn "Bad args" >> exitWith (ExitFailure 84)
            Just c  -> core c




