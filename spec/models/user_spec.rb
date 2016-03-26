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

    it 'finds all users' do
      users = User.all
      expect(users).to be_a Array
      user = users.first
      expect(user).to be_a User
      expect(user.id).to eq 1
    end
  end
end
