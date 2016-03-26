class HomeController < ApplicationController
  def index
    response.write 'hello there!'
  end
end
