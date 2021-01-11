
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates' do
    should validate_presence_of(:name)
  end
  it 'validates' do
    should validate_presence_of(:email)
  end
  it 'validates' do
    should validate_uniqueness_of(:email)
  end
end