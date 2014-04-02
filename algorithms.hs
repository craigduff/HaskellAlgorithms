import Data.Char
import Data.List
import Data.Function (on)

-- Boyer Moore
boyer ::(Eq a) => [a] -> [a] -> Bool
boyer _ [] = False
boyer word sentence 
	| word == (take(length word) sentence) = True
	| otherwise = boyer word (split word sentence)

-- determine how many characters to move ahead
split ::(Eq a) => [a] -> [a] -> [a]
split word line 
	| length line < length word = []
	| elem (line !! (length word -1)) word && getFirst word (line !!(length word -1)) < length word-1 = move (length word -(1 + getFirst word (line !! (length word -1)))) line
	| elem (line !! (length word -1)) word = move 1 line
	| otherwise = move (length word) line

-- Get the index of specified character in a string
getFirst ::(Eq a) => [a] -> a -> Int
getFirst [] _ = 0
getFirst [x] _ = 0
getFirst (x:y) a
	| x == a = 0
	| otherwise = (getFirst y a) + 1

-- move ahead x amount of characters
move :: Int -> [a] -> [a]
move num line
	| num > length line = []
	| otherwise = reverse (take ((length line)-num ) (reverse line))

-- Rabin Karp
rabinKarp :: [Char] -> [Char] -> Bool
rabinKarp [] [] = True
rabinKarp _ [] = False
rabinKarp a (x:y)
	| roll a == roll (take (length a) (x:y)) = True
	| otherwise = rabinKarp a y

-- Hashesa string with rolling hash algorithm
roll :: [Char] -> Int
roll [] = 0
roll (x:y) = (ord x)*7^(length (x:y)-1) + roll y
