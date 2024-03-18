{- 
-- EPITECH PROJECT, 2023
-- compressor
-- File description:
-- mTA.hs
-}

module Lib.MaybeToA where


mTA :: Maybe a -> a
mTA Nothing = error "Nothing\n\n"
mTA (Just c) = c


