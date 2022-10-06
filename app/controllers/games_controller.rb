require 'json'
require 'open-uri'
class GamesController < ApplicationController
  
  SHUF = ('A'..'Z').to_a.shuffle[0..9] 

  def new
    @letters = SHUF 
  end

  def score
    @word = params[:word].upcase
    @letters = SHUF
    @example = SHUF.join(', ')
    @count = 0
    @found = find_word(params[:word])
    session[:score]
  end
  
  def find_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    dictionary_serialized = URI.open(url).read
    dictionary = JSON.parse(dictionary_serialized)
    return dictionary["found"]
  end

end
