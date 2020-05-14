function result = BoardChanged(board, emptyR)
    result = sum(sum(board == 0)) == length(emptyR);
end