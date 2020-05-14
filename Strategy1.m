function [winner] = Strategy1(n, startingPlayer)
% This stategy involves placing the player's symbol in a random empty
% position. There is no other logic taking place.

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
            % Choose a random position and place the players symbol
            board = RandomlyPlace(emptyR, emptyC, board, player);
            % Check to see if the current player has obtained n in a row
            [winner, gameFinished] = CheckWinner(board, n, player);
        end
    [player, ~] = SwitchPlayer(player);
end

end