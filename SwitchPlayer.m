function [newPlayer] = SwitchPlayer(currentPlayer)
    if currentPlayer == 'X'
        newPlayer = 'O';
    elseif currentPlayer == 'O'
        newPlayer = 'X';
    end
end