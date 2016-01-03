require 'spec_helper'

describe Challenge do

  before :each do
    @user = FactoryGirl.create :user
    @challenge = FactoryGirl.create :challenge
  end

  describe 'user_joined?' do
    it 'returns true if the creator' do
      @challenge.creator = @user
      expect(@challenge.user_joined? @user).to be_truthy
    end

    it 'returns true if just a user' do
      @challenge.users << @user
      expect(@challenge.user_joined? @user).to be_truthy
    end

    it 'returns false if not' do
      expect(@challenge.user_joined? @user).to be_falsey
    end
  end

end
