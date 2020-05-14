runs = 10000;

player1 = 'X';
player2 = 'O';

r_strat1 = zeros(1, runs);
r_strat2 = zeros(1, runs);
r_strat3 = zeros(1, runs);
for i = 1:runs
   r_strat1(i) = Strategy1(3, player1, player2);
   r_strat2(i) = Strategy2(3, player1, player2);
   r_strat3(i) = Strategy3(3, player1, player2);
end

figure;
labels = {[player1 ' Wins'],[player2 ' Wins'],'Ties'};
t = tiledlayout(1,3);
title(t,{'Tic-tac-toe Strategies', ['(' player1 ' starting, n = ' num2str(runs) ')']})

ax1 = nexttile;
pie(ax1,[sum(r_strat1 == player1), sum(r_strat1 == player2), sum(r_strat1 == 0)], '%.1f%%');
legend(labels)
title({'Strategy 1', 'Random Placements'});

ax2 = nexttile;
pie(ax2,[sum(r_strat2 == player1), sum(r_strat2 == player2), sum(r_strat2 == 0)], '%.1f%%');
legend(labels)
title({'Strategy 2', 'Looking for Almost Complete Series'});

ax3 = nexttile;
pie(ax3,[sum(r_strat3 == player1), sum(r_strat3 == player2), sum(r_strat3 == 0)], '%.1f%%');
legend(labels)
title({'Strategy 3', 'Strategy 2, and Blocking Opponent''s Series'});