def score(player)
  player[:score] += 1
end

def lose_life(player)
  player[:lives] -= 1
end

def is_alive?(player)
  if player[:lives] == 0
    true
  else
    false
  end
end

def generate_question
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    operator = rand(1..5)

    case operator
    when 1
      @answer = @first_num + @second_num
      @op_string = '+'
    when 2
      @answer = @first_num - @second_num
      @op_string = '-'
    when 3
      @answer = @first_num * @second_num
      @op_string = '*'
    when 4
      @answer = @first_num / @second_num
      @op_string = '/'
    when 5
      @answer = @first_num % @second_num
      @op_string = '%'
    end


  end

  def question_string
    "What is #{@first_num} #{@op_string} #{@second_num} ? "
  end

  def is_correct?(user_input)
    if user_input == @answer
      return true
    else
      return false
    end
  end
