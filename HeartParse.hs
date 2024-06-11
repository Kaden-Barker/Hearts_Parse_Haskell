module HeartParse where

import Parsing
import System.IO
import Data.Char (isDigit, ord)
import Data.Set (Set)
import qualified Data.Set as Set

-- Define Suits
data Suit = H | D | C | S
    deriving (Show, Eq, Ord)


-- Define Values
data Value = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Ord)

-- Define the Card type as a combination of Suit and Value
data Card = Card { suit :: Suit, value :: Value }
  deriving (Show, Eq, Ord)

-- Define Player
data Player = North | East | South | West
    deriving (Show, Eq, Ord)

-- Define a PlayerCard type as a combination of Player and Card
data PlayerCard = PlayerCard { player :: Player, card :: Card }
  deriving (Show, Eq)

-- Define Round
data Round = Round { 
    cards :: (PlayerCard, PlayerCard, PlayerCard, PlayerCard),
    roundScores :: Scores,
    winner :: Player
} deriving (Show, Eq)

-- Define Score
data Score = Score {
    splayer :: Player,
    score :: Int
} deriving (Show, Eq)

-- Define Scores
data Scores = Scores {
    scores :: (Score, Score, Score, Score)
} deriving (Show, Eq)

-- Define GameTrace
type GameTrace = [Round]


-- turning value into an int 
getValue :: Value -> Int
getValue Two   = 2
getValue Three = 3
getValue Four  = 4
getValue Five  = 5
getValue Six   = 6
getValue Seven = 7
getValue Eight = 8
getValue Nine  = 9
getValue Ten   = 10
getValue Jack  = 11
getValue Queen = 12
getValue King  = 13
getValue Ace   = 14


-- Convert a character representing a value to a Value
charToValue :: Char -> Value
charToValue '2'   = Two
charToValue '3'   = Three
charToValue '4'   = Four
charToValue '5'   = Five
charToValue '6'   = Six
charToValue '7'   = Seven
charToValue '8'   = Eight
charToValue '9'   = Nine
charToValue 'T'   = Ten
charToValue 'J'   = Jack
charToValue 'Q'   = Queen
charToValue 'K'   = King
charToValue 'A'   = Ace
charToValue _     = error "Invalid value character"


-- Convert a character representing a suit to a Suit
charToSuit :: Char -> Suit
charToSuit 'H' = H
charToSuit 'D' = D
charToSuit 'C' = C
charToSuit 'S' = S
charToSuit _   = error "Invalid suit character"

-- Convert a characters representing a player to a Player
charToPlayer :: String -> Player
charToPlayer "North" = North
charToPlayer "East" = East
charToPlayer "South" = South
charToPlayer "West" = West
charToPlayer _ = error "Expected Player -- Invalid Player type"


parseGame :: String -> GameTrace
parseGame gameTrace = checkedGameTrace
    where
        checkedGameTrace = parseRounds gameTrace


parseRounds :: String -> [Round]
parseRounds xs
    | xs == ""  = []
    | otherwise = let (round, rest) = parseRound xs
                  in round : parseRounds rest

parseRound :: String -> (Round, String)
parseRound xs = if not validP then error "Duplicate Player found! OR Players are in the wrong Order" 
            else if not validC then error "Duplicate Card found!" 
            else if not validPS then error "Duplicate Player found in Scores OR Players are in the wrong Order"else (r, rest11)
    where 
        (remaining, num) = parseRoundLine xs
        (pCard, rest) = parsePlayerCard remaining
        (pCard1, rest1) = parsePlayerCard rest
        (pCard2, rest2) = parsePlayerCard rest1
        (pCard3, rest3) = parsePlayerCard rest2
        -- CREATE A FUNCTION THAT CHECKS PLAYERS AND CARDS
        validP = validatePlayers (player pCard, player pCard1, player pCard2, player pCard3) -- check that there are no duplicate players and in the correct order
        validC = validateCards (pCard, pCard1, pCard2, pCard3) -- check that there are no duplicate cards

        (wPlayer, rest4) = parseWinner rest3
        rest5 = parseScore rest4
        (pScore, rest6) = parsePlayerScore rest5
        (pScore1, rest7) = parsePlayerScore rest6
        (pScore2, rest8) = parsePlayerScore rest7
        (pScore3, rest9) = parsePlayerScore rest8

        validPS = validatePlayers (splayer pScore, splayer pScore1, splayer pScore2, splayer pScore3) -- check that there are no duplicate players and in the correct order of the Scores
        -- NEEDS TO PARSE THE EXTRA NEW LINE
        nLParser = string "\n"
        rest10 = parse nLParser rest9
        rest11 = if rest10 == [] 
                then error "new line not found, expected at the end of a round" 
                else snd(head rest10)

        pScores = Scores (pScore, pScore1, pScore2, pScore3)
        r = Round (pCard, pCard1, pCard2, pCard3) pScores wPlayer 


-- Parses the line number from a line of the format "Round X:\n"
parseRoundLine :: String -> (String, Int)
parseRoundLine xs = (res8, num)
    where
        (before, after) = getString xs
        res = if before == "Round"
            then after
            else error "Expected Round"
        res2 = parse space res
        res3 = if res2 == [] 
            then error "Expected a space after Round" 
            else snd(head res2)

        res4 = parse integer res3
        res5 = if res4 == [] 
            then error "Couldn't find round number" 
            else res4
        num = fst(head res5)
        res6 = snd(head res5)
        end_parser = string ":\n"
        res7 = parse end_parser res6
        res8 = if res7 == [] 
            then error "Expected colon and newline after round" 
            else snd(head res7)


-- helper function for parsing a player stops at a space, new line, or colon
getString :: String -> (String, String)
getString str =
    let trimmedStr = dropWhile (== ' ') str  -- Remove leading spaces
        (beforeSpace, afterSpace) = span (\c -> c /= ' ' && c /= '\n' && c /= ':') trimmedStr
    in (beforeSpace, afterSpace)

    

parsePlayerCard :: String -> (PlayerCard, String)
parsePlayerCard xs = (pCard, res4)
    where
        (curPlayerAsString, res) = getString xs
        curPlayer = charToPlayer curPlayerAsString
        keyWordParse = string " plays "
        res2 = parse keyWordParse res
        res3 = if res2 == [] 
                    then error "Expected _plays_" 
                    else snd(head res2) 
        (curCard, res4) = parseCard res3
        pCard = PlayerCard curPlayer curCard
    


parseCard :: String -> (Card, String)
parseCard xs = (curCard, res4)
    where
        (curNum, res) = if null xs then error "Expected value" else (head xs, tail xs)
        (curSuit, res2) = if null res then error "Expected suit" else (head res, tail res)
        curCard = Card (charToSuit curSuit) (charToValue curNum)
        end_parser = string "\n"
        res3 = parse end_parser res2
        res4 = if res3 == [] 
                    then error "new line not found while parsing a card" 
                    else snd(head res3)


parseWinner :: String -> (Player, String)
parseWinner xs = (curPlayer, res6)
    where
        (before, after) = getString xs
        res = if before == "Winner"
            then after
            else error "Expected Scores"
        colonSpaceParser = string ": "
        res2 = parse colonSpaceParser res
        res3 = if res2 == [] 
            then error "Expected a colon and space after winner" 
            else snd(head res2)
        (curPlayerAsString, res4) = getString res3
        curPlayer = charToPlayer curPlayerAsString
        end_parser = string "\n"
        res5 = parse end_parser res4
        res6 = if res5 == [] 
                then error "new line not found" 
                else snd(head res5)


parseScore :: String -> (String)
parseScore xs = res5
    where   
        nLParser = string "\n"
        res = parse nLParser xs
        res2 = if res == [] 
                then error "new line not found, expected before Scores" 
                else snd(head res)
        (before, after) = getString res2
        res3 = if before == "Scores"
            then after
            else error "Expected Scores"
        end_parser = string ":\n"
        res4 = parse end_parser res3
        res5 = if res4 == [] 
            then error "Expected a newline after Scores:" 
            else snd(head res4)


parsePlayerScore :: String -> (Score, String)
parsePlayerScore xs = (pScore, res6)
    where
        (curPlayerAsString, res) = getString xs
        curPlayer = charToPlayer curPlayerAsString
        middle_parse = string ": "
        res2 = parse middle_parse res
        res3 = if res2 == []
            then error "Expecting colon then space before number"
            else snd(head res2)
        (num, res4) = if isDigit (head res3)
                then (head res3, tail res3)
                else error "Expected score number"
        end_parser = string "\n"
        res5 = parse end_parser res4
        res6 = if res5 == [] 
                then error "new line not found" 
                else snd(head res5)
        pScore = Score curPlayer (ord num - ord '0')


-- Check if there is any duplicate players in that round
validatePlayers :: (Player, Player, Player, Player) -> Bool
validatePlayers (p1, p2, p3, p4) =
    let players = [p1, p2, p3, p4]
        uniquePlayers = Set.fromList players
        correctOrder = [North, South, East, West]
    in length players == Set.size uniquePlayers && players == correctOrder


-- Check if there is any duplicate players in that round
validateCards :: (PlayerCard, PlayerCard, PlayerCard, PlayerCard) -> Bool
validateCards (c1, c2, c3, c4) =
    let cards = [card c1, card c2, card c3, card c4]
        uniqueCards = Set.fromList cards
    in length cards == Set.size uniqueCards