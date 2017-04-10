module MathGame
    
  class Player
    attr_reader :lives

    def initialize(name="Player")
      @lives = 3
      @name = name
    end
    # to_s override method
    def to_s
      @name
    end

    def decrement_lives
      @lives -= 1
    end
  end
end
