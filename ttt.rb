def boardOut(board)
	full = true
	for x in board 
		print "       "
		for y in x
			print "#{y} "
			if y == '-'
				full = false
			end
		end
		puts
	end
	return full
end

def checkWin(spots, player, winnables)
	for k,winnable in winnables
		for win in winnable 
			if (win - spots).empty?
				return player
			end
		end 
	end
	return nil
end

def play(player, pSpots, board, winnables)
	spot = ''
	while spot != '-'
		puts "\n#{player}, which row?"
		row = gets.chomp.to_i - 1
		puts "Which column?"
		col = gets.chomp.to_i - 1
		spot = board[row][col]
	end
	if player == "Player 1"
		board[row][col] = 'X'
	else
		board[row][col] = 'O'
	end
	pSpots.push("#{row.to_s}#{col.to_s}")
	
	puts
	if boardOut(board)
		return "DRAW"
	end
	if checkWin(pSpots, player, winnables) == player
		return player
	else
		return ""
	end
end

# Starting board
board = [
['-','-','-'],
['-','-','-'],
['-','-','-']
]

# Winnable sequences
winnables = {
	"vWin" => [["00", "10", "20"], ["01", '11', '21'], ['02', '12', '22']],
	"hWin" => [['00', '01', '02'], ['10', '11', '12'], ['20', '21', '22']],
	"dWin" => [['00', '11', '22'], ['02', '11', '20']]
}

p1Spots = []
p2Spots = []
playerWon = ""

puts "WELCOME TO TICK TACK TOE"
puts "HERE IS YOUR BOARD:"
puts
boardOut(board)

while true 
	playerWon = play("Player 1", p1Spots, board, winnables) # 
	if playerWon == "Player 1"
		puts "Player 1 Wins!"
		break
	elsif playerWon == "DRAW"
		puts "DRAW"
		break
	end
	
	playerWon = play("Player 2", p2Spots, board, winnables)
	if playerWon == "Player 2"
		puts "Player 2 Wins!"
		break
	elsif playerWon == "DRAW"
		puts "DRAW"
		break
	end
end

