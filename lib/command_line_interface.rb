require 'pry'

def welcome
  # puts out a welcome message here!
  puts "Welcome Star Wars Lovers"
end

def get_character_from_user
  # gets user's input, then downcase input
  puts "please enter a character name"
  name = gets.chomp.downcase
end
