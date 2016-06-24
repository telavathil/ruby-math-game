require './Player.rb'
require './Question.rb'
require 'pry'
require 'colorize'

# controls the game continuation
@replay = true

# controls the turn 0 for p1ayer 1 for player 2
@turn = 0

# sets up the continue condition
#@continue = false

puts 'Welcome to ruby_math_game. Each player has three lives.....'
puts

print 'Player 1 name: '.colorize(:blue)
name1 = gets.chomp

print 'Player 2 name: '.colorize(:blue)
name2 = gets.chomp

#create players
p1 = Player.new({name: name1,
score: 0,
answers_wrong: 0,
lives: 3 })

p2 = Player.new({name: name2,
score: 0,
answers_wrong: 0,
lives: 3 })

puts 'Ok, lets begin. Good Luck.'
puts

while @replay
    # create question
    q = Question.new()

    # determine turn
    case @turn
    when 0
        print "#{p1.name}: "
    else
        print "#{p2.name}: "
    end
    #binding.pry
    print q.q_str
    user_input = gets.chomp.to_i

    if @turn == 0 && q.is_correct?(user_input)
        puts 'That is correct'.on_blue.underline
        p1.score += 1
        @turn += 1
    elsif @turn == 0 && !q.is_correct?(user_input)
        puts 'Sorry, that is incorrect you will lose a life.'.on_blue.underline
        p1.lives -= 1
        @turn += 1
    elsif @turn == 1 && q.is_correct?(user_input)
        puts 'That is correct'.on_blue.underline
        p2.score += 1
        @turn -= 1
    elsif @turn == 1 && !q.is_correct?(user_input)
        puts 'Sorry, that is incorrect you will lose a life.'.on_blue.underline
        p2.lives -= 1
        @turn -= 1
    end

    puts "The score is:"
    puts "    #{p1.name}: has #{p1.score} points, and #{p1.lives} lives remaining"
    puts "    #{p2.name}: has #{p2.score} points, and #{p2.lives} lives remaining"
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


    next unless p1.lives < 1 || p2.lives < 1 #|| @continue
    puts 'Game Over.'.colorize(:red)
    if p1.lives < 1
        puts "The winner is #{p2.name} with #{p2.score} points".colorize(:blue)
    elsif p2.lives < 1
        puts "The winner is #{p1.name} #{p2.score} points,".colorize(:blue)
    end

    @replay = false

end
