function [winner] = RandomPlacement(n)

board = zeros(n, n);
player = 'X';
winner = 0;
gameFinished = false;

while (~gameFinished)
        [emptyR, emptyC] = find(board == 0);
        if size(emptyR, 1) == 0
            gameFinished = true;
        else
            index = randi(size(emptyR, 1));
            board(emptyR(index), emptyC(index)) = player;
            
            % Check to see if someone has won
            for i = 1:n
               if all(board(i,:) == player) || all(board(i,:) == player)...
                       || all(board(n:n-1:n^2-1) == player)...
                       || all(board(1:n+1:n^2) == player)
                   winner = player;
                   gameFinished = true;
               end
            end
        end
    
    if player == 'X'
        player = 'O';
    elseif player == 'O'
        player = 'X';
    end
end

% 
% switch winner
%     case 0
%         disp('It is a tie!')
%     case 'X'
%         disp('The winner is X!')
%     case 'O'
%         disp('The winner is O!')
% end
% for i = 1:n
%     for j = 1:n
%         fprintf('%s', board(i, j));
%     end
%     fprintf('\n');
% end

end