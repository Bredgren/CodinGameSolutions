import System.IO
import Control.Monad
import Data.List

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE

    input_line <- getLine
    let n = read input_line :: Int

    strengths <- replicateM n $ do
        input_line <- getLine
        let pi = read input_line :: Int
        return pi

    putStrLn $ show $ minimum $ map (\s -> fst s - snd s) $ (\s -> zip (tail s) s) $ sort strengths
    return ()

   -- hPutStrLn stderr ""

{- Cool solution by someone else
import System.IO
import Control.Monad
import Data.List

readIntLine :: IO Int
readIntLine = fmap read getLine

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE

    n <- readIntLine
    ss <- fmap sort $ replicateM n readIntLine

    print . minimum $ zipWith (\x y -> abs (x - y)) ss (tail ss)
-}

{-
import Control.Monad
import Data.List

main = readLn >>= (`replicateM` readLn) >>= print.minimum.(tail>>=zipWith(-)).sort
-}
