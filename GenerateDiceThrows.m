%Variables
gamesNumber     = 1000000;

%Fixed variables for Yatzy
dieSides        = 6;
diceNumber      = 5;
throwsRound     = 3;
rounds          = 15;

dice = uint8(ceil(dieSides * rand(diceNumber, throwsRound, rounds, gamesNumber)));

save dice dice