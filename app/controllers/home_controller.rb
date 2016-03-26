class HomeController < ApplicationController
  before_action :header
  after_action :footer

  def index
    response.write 'hello there!'
  end

  private

    def header
      response.write '<h1>My App</h1>'
    end

    def footer
      response.write '&copy;, Kira'
    end
end
