

import HeartParse
import TestStrings

-- TESTING     

goodTest :: IO ()
goodTest = do
    -- testing a good trace
    let game = parseGame getGoodTrace

    putStrLn "Printing GOOD GameTrace\n"
    print game
    putStrLn "\nDone printing game"

dupTest :: IO ()
dupTest = do
    -- testing a trace that contains a duplicate player
    let game = parseGame getDupTracePlayer

    putStrLn "Printing GameTrace where a player plays twice\n"
    print game
    putStrLn "\nDone printing game"

dupTest2 :: IO ()
dupTest2 = do
    -- testing a trace that contains a duplicate card
    let game = parseGame getDupTraceCard

    putStrLn "Printing GameTrace where a two players play the same card\n"
    print game
    putStrLn "\nDone printing game"

wrongOrderTest :: IO ()
wrongOrderTest = do
    -- testing a trace that contains a players that play in the wrong order
    let game = parseGame getWrongOrderTrace

    putStrLn "Printing GameTrace where a player plays in the wrong order\n"
    print game
    putStrLn "\nDone printing game"

incompleteRoundTest :: IO ()
incompleteRoundTest = do
    -- testing a trace that contains where a player didn't play
    let game = parseGame getIncompleteRoundTrace

    putStrLn "Printing GameTrace where a player doesn't play\n"
    print game
    putStrLn "\nDone printing game"

badFormatTest :: IO ()
badFormatTest = do
    -- testing a trace that contains a syntax error in the word Round
    let game = parseGame getBadRoundTrace

    putStrLn "Printing GameTrace where a Round is syntactically wrong\n"
    print game
    putStrLn "\nDone printing game"

badFormatTest2 :: IO ()
badFormatTest2 = do
    -- testing a trace that contains a syntax error in the word play
    let game = parseGame getBadPlayTrace

    putStrLn "Printing GameTrace where a play is spelt wrong\n"
    print game
    putStrLn "\nDone printing game"

missingCardTest :: IO ()
missingCardTest = do
    -- testing a trace that contains a syntax error in the word Round
    let game = parseGame getMissingCardTrace

    putStrLn "Printing GameTrace where a east is missing a card\n"
    print game
    putStrLn "\nDone printing game"
