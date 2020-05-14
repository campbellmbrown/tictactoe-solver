function [board] = FillAlmostComplete(n, board, player)

% Look for winning rows and columns
for i = 1:n
    if sum(board(i,:)==player)==n-1 && sum(board(i,:)==0)==1
        board(i,:) = player;
    elseif sum(board(:,i)==player)==n-1 && sum(board(:,i)==0)==1
        board(:,i) = player;
    end
end
% Look for winning diagonals
if sum(board(n:n-1:n^2-1)==player)==n-1 && sum(board(n:n-1:n^2-1)==0)==1
    board(n:n-1:n^2-1) = player;
elseif sum(board(1:n+1:n^2)==player)==n-1 && sum(board(1:n+1:n^2)==0)==1
    board(1:n+1:n^2) = player;
end

end