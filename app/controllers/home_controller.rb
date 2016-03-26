class HomeController < ApplicationController
  before_action :header

  def index
    response.write 'hello there!'
  end

  private

    def header
      response.write '<h1>My App</h1>'
    end
end
