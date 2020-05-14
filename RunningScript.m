runs = 10000;
r_random = zeros(1, runs);
r_strat1 = zeros(1, runs);

for i = 1:runs
   r_random(i) = RandomPlacement(4, 'X');
   r_strat1(i) = Strategy1(4, 'X');
end

figure;
labels = {'X Wins','O Wins','Ties'};
t = tiledlayout(1,2);

ax1 = nexttile;
pie(ax1,[sum(r_random == 'X'), sum(r_random == 'O'), sum(r_random == 0)], '%.1f%%');
legend(labels)
title({'Random Placements', ['(X starting, n = ' num2str(runs) ')']});

ax2 = nexttile;
pie(ax2,[sum(r_strat1 == 'X'), sum(r_strat1 == 'O'), sum(r_strat1 == 0)], '%.1f%%');
legend(labels)
title({'Looking for Almost Complete Rows', ['(X starting, n = ' num2str(runs) ')']});