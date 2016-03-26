require 'spec_helper'
require_relative '../../config/application'
require_relative '../../config/routes'
require_relative '../../lib/router'
require 'pry'

RSpec.describe Application do
  describe 'call' do
    before :each do
      @app = Application.new
    end

    it 'routes the requests' do
      expect(@app.route('/home/index')).to eq ['home', 'index']
      expect(@app.route('/users')).to eq ['users', 'index']
      expect(@app.route('/')).to eq ['home', 'index']
    end

    it 'loads the controller class' do
      klass = @app.load_controller_class('home')
      expect(klass).to eq HomeController
    end
  end
end
