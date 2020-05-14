
winner = zeros(1, 1000);

for i = 1:10000
   winner(i) = RandomPlacement(3, 'X');
end

xWins = sum(winner == 'X');
oWins = sum(winner == 'O');
ties = sum(winner == 0);

figure;
labels = {'X Wins','O Wins','Ties'};
pie([xWins, oWins, ties])
legend(labels)
title('Wins of Random Placements in Tic-tac-toe (X Starting, n = 10,000)');