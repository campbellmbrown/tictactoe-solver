function [winner] = Strategy1(n, startingPlayer)
% This stategy involves looking for a scenario where there are two of the
% players symbols and one empty space in a row, column, or diagonal. If
% there aren't, a random position is chosen.

% Initialising board, starting player, etc.
b = zeros(n, n);
p = startingPlayer;
winner = 0;
gameFinished = false;

% Run until the game is finished
while (~gameFinished)
        % Find indices of empty spaces
        [emptyR, emptyC] = find(b == 0);
        % If there are no more spaces, it is a tie
        if size(emptyR, 1) == 0
            gameFinished = true;
        else
            % Look for winning rows and columns
            for i = 1:n
                if sum(b(i,:)==p)==n-1 && sum(b(i,:)==0)==1
                    b(i,:) = p;
                elseif sum(b(:,i)==p)==n-1 && sum(b(:,i)==0)==1
                    b(:,i) = p;
                end
            end
            % Look for winning diagonals
            if sum(b(n:n-1:n^2-1)==p)==n-1 && sum(b(n:n-1:n^2-1)==0)==1
                b(n:n-1:n^2-1) = p;
            elseif sum(b(1:n+1:n^2)==p)==n-1 && sum(b(1:n+1:n^2)==0)==1
                b(1:n+1:n^2) = p;
            end
            
            % If nothing has been set already
            if sum(sum(b == 0)) == length(emptyR)
                % Choose a random position and place the players symbol
                index = randi(size(emptyR, 1));
                b(emptyR(index), emptyC(index)) = p;
            end
            
            % Check to see if someone has won
            for i = 1:n
               % If there is a column, row, or diagonal of the player
               if all(b(i,:) == p) || all(b(:,i) == p)...
                       || all(b(n:n-1:n^2-1) == p)...
                       || all(b(1:n+1:n^2) == p)
                   winner = p;
                   gameFinished = true;
               end
            end
        end
    % Switch the player for the next turn
    if p == 'X'
        p = 'O';
    elseif p == 'O'
        p = 'X';
    end
end

end