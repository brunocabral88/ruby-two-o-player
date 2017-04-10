module MathGame
  class Game 
    @@random = Random.new()
    @@operations = %w[plus minus times divided]
    def initialize
      @player1 = Player.new("Player 1")
      @player2 = Player.new("Player 2")
      @current_player = @player1
      @game_continues = true
    end
    
    def start_match
      puts "Starting a new game!"
      while (@game_continues) do
        @game_continues = new_round
        # Switches current player
        @current_player = @current_player == @player1 ? @player2 : @player1
      end
      winner = @player1.lives == 0 ? @player2 : @player1
      puts "The winner was #{winner} with #{winner.lives} lives remaining.."
    end

    private 

    # Returns true if the game continue or false otherwise
    def new_round
      round_operation = @@operations[@@random.rand(3)]
      num1 = @@random.rand(20)
      num2 = @@random.rand(20)
      sentence = "#{@current_player}: What does #{num1} "
      puts "------- NEW TURN -------"
      case round_operation
        when "plus"
          sentence << "plus #{num2} equal?"
          correct_answer = num1 + num2
        when "minus"
          sentence << "minus #{num2} equal?"
          correct_answer = num1 - num2
        when "times"
          sentence << "times #{num2} equal?"
          correct_answer = num1 * num2
        when "divided"
          sentence << "divided by #{num2} equal?"
          correct_answer = num1 / num2
      end
      puts sentence
      user_answer = gets.chomp
      if user_answer.to_i == correct_answer
        puts "Correct! Congratssss..."
        puts "#{@player1}: #{@player1.lives}/3 vs #{@player2}: #{@player2.lives}/3"
      else
        puts "Ouch! This was not what I was expecting as the answer.."
        @current_player.decrement_lives
        puts "#{@player1}: #{@player1.lives}/3 vs #{@player2}: #{@player2.lives}/3"
        if @current_player.lives <= 0
          puts "----- GAME OVER ------"
          return false
        end
      end
      return true
    end
  end
end