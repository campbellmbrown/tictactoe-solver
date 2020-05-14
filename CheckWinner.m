function [winner, gameFinished] = CheckWinner(board, n, player)

winner = 0;
gameFinished = false;

for i = 1:n
    % If there is a column, row, or diagonal of the player
    if all(board(i,:) == player) || all(board(:,i) == player)...
            || all(board(n:n-1:n^2-1) == player)...
            || all(board(1:n+1:n^2) == player)
        winner = player;
        gameFinished = true;
    end
end

end