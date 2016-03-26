require 'spec_helper'
require_relative '../../app/controllers/application_controller'
require_relative '../../lib/action_controller'

class FilterTestController < ApplicationController
  before_action :before
  after_action :after

  def initialize(out)
    @out = out
  end

  def before
    @out << :before
  end

  def after
    @out << :after
  end

  def around1
    @out << 'around1'
    yield
    @out << '/around1'
  end

  def around2
    @out << 'around2'
    yield
    @out << '/around2'
  end

  def index
    @out << :index
  end
end

RSpec.describe FilterTestController do
  it 'filters actions' do
    out = []
    FilterTestController.new(out).process(:index)

    expect(out).to eq [:before, :index, :after]
  end
end
