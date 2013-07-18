class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
 raise WrongNumberOfPlayersError unless game.length == 2
 
 game.each_slice(2) do |player1, player2|  # take pairs from your list to play each other
  firstPick=player1[1].downcase
  secondPick=player2[1].downcase
  
  valid = /[rps]/    # matches either "r" "p" or "s"
  raise NoSuchStrategyError unless (firstPick =~ valid) && (secondPick =~ valid)
  
  return win(firstPick, secondPick) ? player1 : player2  # ternary operator returns the winner
 end

end

# This is incomplete as it doesn't deal with ties. I'll let you do that part
def win(first, second)
  #R beats S; S beats P; and P beats R
  if (first == "p" && second == "r") || 
  	 (first == "r" && second == "s") || 
  	 (first == "s" && second == "p") ||
  	 (first == second)
    return true
  else
    return false
  end
end

#puts rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ]).inspect

def rps_tournament_winner(tournament)
 round_winners = []    # place to hold the winners for each round

 tournament.each do |array|  # take pairs from your list to play each other
  array.each do |array| 
   round_winners << rps_game_winner(array)
  end
 end

if round_winners.size == 1
	exit
else
	next_tournament = []
	round_winners.each_slice(2) do |l1, l2|  # take pairs from your list to play each other
	      next_tournament << rps_game_winner([l1, l2])
	  end
	puts next_tournament.inspect
end #if

end #rps_game_winner

 rps_tournament_winner([
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]  
])