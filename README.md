Implementation of Rabin-Karp and Boyermoore algorithms in Haskell for Computability & Complexity assignment.

Functions:

```
boyer ::(Eq a) => [a] -> [a] -> Bool
split ::(Eq a) => [a] -> [a] -> [a]
getFirst ::(Eq a) => [a] -> a -> Int
move :: Int -> [a] -> [a]
rabinKarp :: [Char] -> [Char] -> Bool
roll :: [Char] -> Int
```

The implementation of the Rabin-Karp String search algorithm in this program uses two 
functions, rabinKarp and roll.

rabinKarp takes two parameters, a word and the string to search through. It compares the word to the first x elements in the string, where x = the length of the source word. It first hashes both words using the roll method, if they match it returns true, otherwise it strips the first element from the string and calls itself again recursively. If the string becomes empty it will return false.

The roll method takes a string as a parameter and hashes it using the Rabin-Karp rolling hash algorithm. It multiplies each character’s ASCII value by a prime and raises it to a power based on it’s position in the list, then adds them together to return the final hash value.

The BoyerMoore algorithm uses the boyer, split, getFirst and move methods.

The boyer function takes two strings and determines whether the first is contained within the second. If the first word does not match the first x elements of the second string, it calls the split method to determine how many characters to drop from the start of the second string.

If the rightmost element of the second word is not contained within the first, it will split the string after that element, if it is an element it will call getFirst to find the index of that character, then call move to drop characters so that both strings match up. It will then continue calling itself recursively.
