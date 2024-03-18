-- 
-- EPITECH PROJECT, 2023
-- compressor
-- File description:
-- RemoveDoublons.hs
 --

module Lib.RemoveDoublons where


removeDoublons :: Eq a => [a] -> [a]
removeDoublons [] = []
removeDoublons (x:xs) = x : removeDoublons (filter (/= x) xs)