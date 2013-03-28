require './board.rb'
require './game.rb'
require './human_player.rb'
require './computer_player.rb'

while true
  game = Game.new
  game.introduce_game
  player_classes = game.play_against_friend_or_cpu?
  game.play( [ player_classes.first.new(:X), player_classes.last.new(:O) ] )
  game.game_over
  break unless game.want_to_play_again?
end
puts "\nThanks for playing!"
