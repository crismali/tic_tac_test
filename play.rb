require './array_methods.rb'
require './get_lines.rb'
require './victory_checks.rb'
require './setup.rb'
require './game.rb'
require './human_player.rb'
require './computer_player.rb'

they_want_to_play_again = true

while they_want_to_play_again

  game = Game.new

  game.introduce_game

  opponent_class = game.play_against_friend_or_cpu?

  who_goes_first = false

  who_goes_first = game.who_goes_first? if opponent_class == ComputerPlayer


  if who_goes_first == opponent_class
    player_1 = opponent_class.new('X')
    player_2 = HumanPlayer.new('O')
  elsif opponent_class == ComputerPlayer
    player_1 = HumanPlayer.new('X')
    player_2 = opponent_class.new('O')
  else
    player_1 = HumanPlayer.new('X')
    player_2 = HumanPlayer.new('O')
  end

  players = Array.new
  players << player_1
  players << player_2

  until game.who_won.is_a? String

    players.each do |player|
      game.draw_board
      player.mark_the_board(game)
      game.anybody_win?
      game.draw?
      break if game.who_won.is_a? String
    end

  end

  game.game_over(opponent_class, who_goes_first)

  they_want_to_play_again = game.want_to_play_again?

end
