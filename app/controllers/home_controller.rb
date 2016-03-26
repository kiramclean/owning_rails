class HomeController < ApplicationController
  before_action :header
  after_action :footer

  def index
    @message = 'This is a message'
    render :index
  end

  private

    def header
      response.write '<h1>My App</h1>'
    end

    def footer
      response.write '<p>&copy;, Kira</p>'
    end
end
