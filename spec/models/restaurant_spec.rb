require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  before do
    @restaurant = Restaurant.new(name: 'Six Seasons')
  end

  subject { @restaurant }

  it { should respond_to(:name) }
  it { should be_valid }

  describe 'when name is not present' do
    before { @restaurant.name = '' }
    it { should_not be_valid }
  end

  describe 'when name is already taken' do
    before do
      duplicate_restaurant = @restaurant.dup
      duplicate_restaurant.name = @restaurant.name.upcase
      duplicate_restaurant.save
    end

    it { should_not be_valid }
  end

end
