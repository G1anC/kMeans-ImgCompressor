{- 
-- EPITECH PROJECT, 2023
-- compressor
-- File description:
-- RemoveInstances.hs
-}

module Lib.RemoveInstances where

import Data.List (delete)

removeInstances :: Eq a => [a] -> [a] -> [a]
removeInstances [] _ = []
removeInstances xs [] = xs
removeInstances xs (y:ys) = removeInstances (delete y xs) ys
