runs = 20000;
winner = zeros(1, runs);

for i = 1:runs
   winner(i) = RandomPlacement(3, 'X');
end

xWins = sum(winner == 'X');
oWins = sum(winner == 'O');
ties = sum(winner == 0);

figure;
labels = {'X Wins','O Wins','Ties'};
pie([xWins, oWins, ties])
legend(labels)
title(['Random Placements (X Starting, n = ' num2str(runs) ')']);