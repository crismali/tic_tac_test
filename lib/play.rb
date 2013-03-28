require './setup.rb'
require './game.rb'
require './human_player.rb'
require './computer_player.rb'

while true

  game = Game.new

  game.introduce_game

  opponent_class = game.play_against_friend_or_cpu?

  who_goes_first = false

  who_goes_first = game.who_goes_first? if opponent_class == ComputerPlayer


  if who_goes_first == opponent_class
    player_1 = opponent_class.new('X')
    player_2 = HumanPlayer.new('O')
  else
    player_1 = HumanPlayer.new('X')
    player_2 = opponent_class.new('O')
  end

  players = player_1, player_2

  9.times do |i|
    game.draw_board if players[i % 2].is_a? HumanPlayer
    players[i % 2].mark_the_board(game)
    game.anybody_win?
    game.draw?
    break if game.who_won
  end

  game.game_over(opponent_class, who_goes_first)

  break unless game.want_to_play_again?

end
