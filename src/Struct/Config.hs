{- 
-- EPITECH PROJECT, 2023
-- imageCompressor
-- File description:
-- Main.hs
-}

module Struct.Config where

import Text.Read (readMaybe)
import System.Exit (exitWith, ExitCode(ExitFailure))
import Control.Exception (try, SomeException(..))

data Conf = Conf {
    n :: Maybe Int,
    limit :: Maybe Float,
    file :: String,
    content :: IO [String]
}

createConf :: Conf
createConf = Conf {
        n = Nothing,
        limit = Nothing,
        file = "",
        content = return []
    }

getOpts :: Conf -> [String] -> Maybe Conf
getOpts conf []          = Just conf
getOpts conf ("-n":x:xs) = getOpts (conf {n = readMaybe x}) xs
getOpts conf ("-f":x:xs) = getOpts (conf {file = x, content = getFile x}) xs
getOpts conf ("-l":x:xs) = getOpts (conf {limit = readMaybe x}) xs
getOpts _ _              = Nothing

getFile :: FilePath -> IO [String]
getFile fileName = do
    result <- try (readFile fileName) :: IO (Either SomeException String)
    case result of
        Right fileContent -> return $ words fileContent
        Left ex -> putStrLn "Bad file" >> exitWith (ExitFailure 84)
