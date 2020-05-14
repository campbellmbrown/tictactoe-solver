function [winner] = Strategy1(n, startingPlayer)
% This stategy involves looking for a scenario where there are two of the
% players symbols and one empty space in a row, column, or diagonal. If
% there aren't, a random position is chosen.

% Initialising board, starting player, etc.
board = zeros(n, n);
player = startingPlayer;
winner = 0;
gameFinished = false;

% Run until the game is finished
while (~gameFinished)
        % Find indices of empty spaces
        [emptyR, emptyC] = find(board == 0);
        % If there are no more spaces, it is a tie
        if size(emptyR, 1) == 0
            gameFinished = true;
        else
            % Place in rows or columns or diagonals almost complete
            board = FillAlmostComplete(n, board, player);
            
            % If nothing has been set already, randomly place
            if sum(sum(board == 0)) == length(emptyR)
                [board] = RandomlyPlace(emptyR, emptyC, board, player);
            end
            
            [winner, gameFinished] = CheckWinner(board, n, player);
        end
    player = SwitchPlayer(player);
end

end