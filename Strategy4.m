function [winner] = Strategy4(n, startingPlayer, startingOpponent)
% This stategy involves looking for a scenario where there are two of the
% players symbols and one empty space in a row, column, or diagonal. If
% there aren't, a random position is chosen.

% Initialising board, starting player, etc.
board = zeros(n, n);
player = startingPlayer;
opponent = startingOpponent;
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
            % Place in series almost complete
            board = FillAlmostComplete(n, board, player);
            % Block if the opponent is about to win
            if BoardChanged(board, emptyR)
                board = BlockOpponent(n, board, player, opponent);
            end
            % Place in series without opponent's symbol in it
            if BoardChanged(board, emptyR)
               board = ChooseWithoutOpponent(n, board, player, opponent);
            end
            % If nothing has been set already, randomly place
            if BoardChanged(board, emptyR)
                board = RandomlyPlace(emptyR, emptyC, board, player);
            end
            
            [winner, gameFinished] = CheckWinner(board, n, player);
        end
    [player, opponent] = SwitchPlayer(player, opponent);
end

end