import System.IO
import Control.Monad
import Data.List
import Data.List.Split

rad :: Double -> Double
rad = (*) (pi / 180)

number :: String -> Double
number = rad . read . map (\c -> if c == ',' then '.' else c)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE

    input_line <- getLine
    let lonA = number input_line
    input_line <- getLine
    let latA = number input_line
    _ <- getLine

    contents <- getContents
    putStrLn $ answer lonA latA contents

    -- hPutStrLn stderr "Debug messages..."

answer :: Double -> Double -> String -> String
answer lonA latA s =
    let dists = map (nameDist lonA latA) $ lines s
        closest = minimumBy (\a b -> compare (snd a) (snd b)) dists
    in fst closest

nameDist :: Double -> Double -> String -> (String, Double)
nameDist lonA latA s = (name, dist (number lon) (number lat))
    where (_:name:_:_:lon:lat:_) = splitOn ";" s
          dist = distance lonA latA

distance :: Double -> Double -> Double -> Double -> Double
distance lonA latA lonB latB = sqrt (x*x + y*y) * 6371
    where x = (lonB - lonA) * cos ((latA + latB) / 2)
          y = latB - latA

{- Cool solutions by others
import Control.Monad
import Control.Applicative
import qualified Data.Text as T
import Data.List
import Data.Ord

readFrenchDegAsRad = (* (pi / 180)) . read . (map $ \c -> if c == ',' then '.' else c)

readDefibrillator s = (name, (readFrenchDegAsRad lon, readFrenchDegAsRad lat))
    where [_, name, _, _, lon, lat] = map T.unpack (T.splitOn (T.pack ";") (T.pack s))

distance (lon1, lat1) (lon2, lat2) = 6371 * sqrt (x**2 + y**2)
    where   x = (lon2 - lon1) * cos ((lat2 + lat1) / 2)
            y = (lat2 - lat1)

main = do
    lon <- readFrenchDegAsRad <$> getLine
    lat <- readFrenchDegAsRad <$> getLine
    n <- readLn
    defibrillators <- replicateM n (readDefibrillator <$> getLine)
    putStrLn $ fst $ minimumBy (comparing (distance (lon, lat) . snd)) defibrillators
-}

{-
import Control.Monad
import Control.Applicative
import qualified Data.Text as T
import Data.List
import Data.Ord

readFrenchDegAsRad = (* (pi / 180)) . read . (map $ \c -> if c == ',' then '.' else c)

readDefibrillator s = (name, (readFrenchDegAsRad lon, readFrenchDegAsRad lat))
    where [_, name, _, _, lon, lat] = map T.unpack (T.splitOn (T.pack ";") (T.pack s))

distance (lon1, lat1) (lon2, lat2) = 6371 * sqrt (x**2 + y**2)
    where   x = (lon2 - lon1) * cos ((lat2 + lat1) / 2)
            y = (lat2 - lat1)

main = do
    lon <- readFrenchDegAsRad <$> getLine
    lat <- readFrenchDegAsRad <$> getLine
    n <- readLn
    defibrillators <- replicateM n (readDefibrillator <$> getLine)
    putStrLn $ fst $ minimumBy (comparing (distance (lon, lat) . snd)) defibrillators
-}
