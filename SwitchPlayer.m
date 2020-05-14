function [player, opponent] = SwitchPlayer(currentPlayer)
    if currentPlayer == 'X'
        player = 'O';
        opponent = 'X';
    else
        player = 'X';
        opponent = 'O';
    end
end