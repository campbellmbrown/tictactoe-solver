function [board] = ChooseWithoutOpponent(n, board, player, opponent)

validIndices = [];

% Look for rows and columns without opponent's character
for i = 1:n
    if sum(board(i,:)==opponent)==0
        for j = 1:n
           if board(i,j)==0
               validIndices = [validIndices, n*(j-1)+i];
           end
        end
    end
    if sum(board(:,i)==opponent)==0
        for j = 1:n
           if board(j,i)==0
               validIndices = [validIndices, n*(i-1)+j];
           end
        end
    end
end

% Look for diagonals without opponent's character
if sum(board(n:n-1:n^2-1)==opponent)==0
    for i = n:n-1:n^2-1
        if board(i) == 0
            validIndices = [validIndices, i];
        end
    end
end
if sum(board(1:n+1:n^2)==opponent)==0
    for i = 1:n+1:n^2
        if board(i) == 0
            validIndices = [validIndices, i];
        end
    end
end
if ~isempty(validIndices)
    validIndices = unique(validIndices);
    index = randi(length(validIndices));
    board(validIndices(index)) = player;
end
end