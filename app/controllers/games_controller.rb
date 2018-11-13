require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @letter = ('a'..'z').to_a.sample(10)
  end

  def word_check
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    check = open(url).read
    parse_file = JSON.parse(check)
    if parse_file["found"]
      @word_length = parse_file["length"]
    end
  end


  def score
    @word = params[:word]
    @word_check = word_check
    @word_length = 0 
  end
end
