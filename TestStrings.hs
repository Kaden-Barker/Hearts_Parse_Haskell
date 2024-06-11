module TestStrings where

-- TEST STRINGS
getGoodTrace :: String
getGoodTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plays 3D\n \
\  East plays 5C\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Round 2:\n \
\  North plays 7H\n \
\  South plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"


getDupTracePlayer :: String
getDupTracePlayer = "Round 1:\n \
\  North plays 2H\n \
\  North plays 3D\n \
\  East plays 5C\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Round 2:\n \
\  North plays 7H\n \
\  South plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"

getDupTraceCard :: String
getDupTraceCard = "Round 1:\n \
\  North plays 2H\n \
\  South plays 2H\n \
\  East plays 5C\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Round 2:\n \
\  North plays 7H\n \
\  South plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"


getWrongOrderTrace :: String
getWrongOrderTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plays 3D\n \
\  East plays 5C\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Round 2:\n \
\  South plays 7H\n \
\  North plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"

getBadRoundTrace :: String
getBadRoundTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plays 3D\n \
\  East plays 5C\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Roud 2:\n \ 
\  South plays 7H\n \
\  North plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"


getIncompleteRoundTrace :: String
getIncompleteRoundTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plays 3D\n \
\  East plays 5C\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Round 2:\n \ 
\  South plays 7H\n \
\  North plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"


getMissingCardTrace :: String
getMissingCardTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plays 3D\n \
\  East plays 2\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Roud 2:\n \ 
\  South plays 7H\n \
\  North plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"

getBadPlayTrace :: String
getBadPlayTrace = "Round 1:\n \
\  North plays 2H\n \
\  South plys 3D\n \
\  East plays 2\n \
\  West plays 4S\n \
\  Winner: East\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 0\n\n \
\Roud 2:\n \ 
\  South plays 7H\n \
\  North plays 6D\n \
\  East plays 8C\n \
\  West plays 9S\n \
\  Winner: West\n\n \
\Scores:\n \
\  North: 0\n \
\  South: 0\n \
\  East: 1\n \
\  West: 1\n\n"