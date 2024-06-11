# Hearts GameTrace Parse

### Running Tests

There are a series of tests that test different cases. The tests strings that are used for the test have been extracted into the TestStrings file. The tests themselves have been extracted to Main.hs

1. Run ghci Main.hs
2. Run goodTest -- Runs a GameTrace that should run error free
3. Run dupTest -- Runs a version where a player plays twice in one round
4. Run dupTest2 -- Runs a version where two players play the same card in one round
5. Run wrongOrderTest -- Runs a version where players play in the wrong order
6. Run incompleteRoundTest -- Runs a version where only 3 players play in a round
7. Run badFormatTest -- Runs a version where Round is spelt wrong
8. Run badFormatTest2 -- Runs a version where plays is spelt wrong
9. Run missingCardTest -- Runs a version where a one player doesn't play a card

### Implementation

When implementing this I began by creating type for all the pieces that were necessary such as Round, Card, Player, Score and many other objects to create a full gameTrace object. From there I broke the gameTrace down into lines that could be parsed with a single function. From there I use these function to be able to parse one Round. Then there is a function that checks if we are at the end of the trace and if so we are done, otherwise look for another Round. Along the way I had to make some decisions such as how to represent the 10 and Face Cards. I found it best and easiest to represent them with a single Character, T, J, Q, K, A. This allowed me to only need to parse one character, which allowed me to use the built-in head function.

### Assumptions

I made a couple of assumptions during development. The instructions state that the winner of one round must start the play of the next round. However, the standard/well-formed GameTrace example keeps the players in the order North, South, East, West. With that being said, I implemented the rule based on the well-formed trace; therefore, the order must be North, South, East, West at all times. Next, I decided to assume that the person that calculated the score understands how to calculate it and that the scores were applied to the correct player.
