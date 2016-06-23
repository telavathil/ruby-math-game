require './data.rb'
require './methods.rb'
require 'pry'

# controls the game continuation
@replay = true

# controls the turn 0 for p1ayer 1 for player 2
@turn = 0

# sets up the continue condition
#@continue = false

puts 'Welcome to ruby_math_game. Each player has three lives.....'
puts

print 'Player 1 name: '
p1 = @players[0][:name] = gets.chomp

print 'Player 2 name: '
p2 = @players[1][:name] = gets.chomp

puts 'Ok, lets begin. Good Luck.'
puts

while @replay
    # create question
    generate_question

    # determine turn
    case @turn
    when 0
        print "#{p1}: "
    else
        print "#{p2}: "
    end

    print question_string
    user_input = gets.chomp.to_i

    if @turn == 0 && is_correct?(user_input)
        puts 'That is correct'
        score(@players[0])
        @turn += 1
    elsif @turn == 0 && !is_correct?(user_input)
        puts 'Sorry, that is incorrect you will lose a life.'
        lose_life(@players[0])
        @turn += 1
    elsif @turn == 1 && is_correct?(user_input)
        puts 'That is correct'
        score(@players[1])
        @turn -= 1
    elsif @turn == 1 && !is_correct?(user_input)
        puts 'Sorry, that is incorrect you will lose a life.'
        lose_life(@players[1])
        @turn -= 1
    end

    puts "The score is:"
    puts "    #{p1}: has #{@players[0][:score]} points, and #{@players[0][:lives]} lives remaining"
    puts "    #{p2}: has #{@players[1][:score]} points, and #{@players[1][:lives]} lives remaining"
    puts

    #binding.pry

    #give the players and option to continue
    # puts "Do you want to continue....Y or N ?"
    # choice = gets.chomp
    # if choice = 'Y' or 'y'
    #   @continue = true
    # else
    #   @continue = false
    # end


    next unless is_alive?(@players[0]) || is_alive?(@players[1]) #|| @continue
    puts 'Game Over.'
    if @players[0][:lives] < 1
        puts "The winner is #{p2} with #{@players[1][:score]} points"
    elsif @players[1][:lives] < 1
        puts "The winner is #{p1} #{@players[0][:score]} points,"
    end

    @replay = false

end
