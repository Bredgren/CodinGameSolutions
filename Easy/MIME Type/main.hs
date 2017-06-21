import System.IO
import Control.Monad
import qualified Data.Map as Map
import Data.Char
import System.FilePath

getMime :: Maybe String -> String
getMime (Just s) = s
getMime Nothing = "UNKNOWN"

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE

    input_line <- getLine
    let numElems = read input_line :: Int
    input_line <- getLine
    let numFiles = read input_line :: Int

    contents <- getContents
    let elemLines = take numElems $ lines contents
    let fileLines = drop numElems $ lines contents

    let table = Map.fromList $ map (\e -> let w = words e in ("." ++ map toLower (w!!0), w!!1)) elemLines
    let exts = map ((map toLower) . takeExtension) fileLines

    let answers = map (getMime . (flip Map.lookup table)) exts

    putStrLn $ unlines answers
    return ()

-- hPutStrLn stderr "Debug messages..."
