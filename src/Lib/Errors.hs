{- 
-- EPITECH PROJECT, 2023
-- compressor
-- File description:
-- Errors.hs
-}

module Lib.Errors where

import Struct.Point
import System.Exit (exitWith, ExitCode(ExitFailure))

checkErrors :: Int -> Float -> [Point] -> IO ()
checkErrors n l p =
    let pSize = length p
    in if (n < 1 || l < 0.0 || pSize < n || pSize < 2)
        then putStrLn "Bad args" >> exitWith (ExitFailure 84)
        else return ()

