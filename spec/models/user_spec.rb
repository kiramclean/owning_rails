require 'spec_helper'
require_relative '../../app/models/user'

RSpec.describe User do
  describe '#initialize' do
    let!(:user) { User.new(id: 1, name: 'Kira') }

    it 'initializes with attributes' do
      expect(user.id).to eq 1
      expect(user.name).to eq 'Kira'
    end

    it 'finds a user in the database' do
      found = User.find(1)
      expect(found).to be_a User
      expect(found.id).to eq 1
    end
  end
end
