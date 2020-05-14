function [winner] = RandomPlacement(n, startingPlayer)
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
            index = randi(size(emptyR, 1));
            board(emptyR(index), emptyC(index)) = player;
            % Check to see if someone has won
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
    % Switch the player for the next turn
    if player == 'X'
        player = 'O';
    elseif player == 'O'
        player = 'X';
    end
end

end