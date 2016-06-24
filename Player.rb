
class Player
    # instance variables
    attr_reader :name, :score, :lives

    def initialize(params = {})
        params.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    def set_name(name)
      @name = name
    end

    def player_scores
      @score += 1
    end

    def player_loses
      @lives -= 1
    end

end
