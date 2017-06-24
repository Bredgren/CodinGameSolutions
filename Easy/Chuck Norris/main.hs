import System.IO
import Control.Monad
import Data.Char (ord, intToDigit)
import Numeric (showIntAtBase)
import Data.List (intercalate, group)
import Data.Text (justifyRight, pack, unpack)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    message <- getLine
    putStrLn $ encodeMessage message
    -- hPutStrLn stderr "Debug messages..."
    return ()

encodeMessage :: String -> String
encodeMessage msg = map (\c -> if c == '1' then '0' else c) $ intercalate " " withBlockPrefix
    where toBinary c = unpack $ justifyRight 7 '0' $ pack $ showIntAtBase 2 intToDigit (ord c) ""
          bits = intercalate "" $ map toBinary msg
          withBlockPrefix = map (\g -> (if head g == '1' then "0" else "00") ++ " " ++ g) $ group bits



-- Cool solution by someone else
-- import Data.Bits
-- import Data.Char
-- import Data.List
--
-- main = fmap (tail . code 3 . concat . map (getBits . ord)) getLine >>= putStrLn
--     where
--         getBits n = map ((\c -> if c then 1 else 0) . testBit n) [6,5..0]
--         code m (n:ns) = (if n /= m then [" 00 0", " 0 0"] !! n else "0") ++ code n ns
--         code _ [] = ""
