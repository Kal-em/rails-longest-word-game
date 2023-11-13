require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    dico = [JSON.parse(URI.open(url).read)]

    if dico[0]['found'] == true
      return @message = 'YES existe'
    else @message = 'not found'
    end
  end
end
