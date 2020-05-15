function [board] = BlockOpponent(n, board, player, opponent)

% Look for winning rows and columns
for i = 1:n
    if sum(board(i,:)==opponent)==n-1 && sum(board(i,:)==0)==1
        board(i,board(i,:)==0) = player;
        return
    elseif sum(board(:,i)==opponent)==n-1 && sum(board(:,i)==0)==1
        board(board(:,i)==0,i) = player;
        return
    end
end
% Look for winning diagonals
if sum(board(n:n-1:n^2-1)==opponent)==n-1 && sum(board(n:n-1:n^2-1)==0)==1
    for i = n:n-1:n^2-1
        if board(i) == 0
            board(i) = player;
            return
        end
    end
elseif sum(board(1:n+1:n^2)==opponent)==n-1 && sum(board(1:n+1:n^2)==0)==1
    for i = 1:n+1:n^2
        if board(i) == 0
            board(i) = player;
            return
        end
    end
end

end