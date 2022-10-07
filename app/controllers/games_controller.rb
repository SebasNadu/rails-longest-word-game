require 'json'
require 'open-uri'
class GamesController < ApplicationController

  def initialize 
    super
    @shuf = ('A'..'Z').to_a.shuffle[0..9] 
  end

  def new
    @letters = @shuf 
  end

  def score
    @word = params[:word].upcase
    @letters = @shuf
    @example = @shuf.join(', ')
    @count = 0
    @found = find_word(params[:word])
    session[:score]
  end
  
  private
  
  def find_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    dictionary_serialized = URI.open(url).read
    dictionary = JSON.parse(dictionary_serialized)
    dictionary["found"]
  end

end
