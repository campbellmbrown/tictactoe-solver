function [board] = RandomlyPlace(emptyR, emptyC, board, player)
% Choose a random index
index = randi(size(emptyR, 1));
% Select the row and column of the empty places and replace it
board(emptyR(index), emptyC(index)) = player;
end