require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe Vote do
    it 'has associations' do
      should belong_to(:user)
    end

    it 'has associations' do
      should belong_to(:article)
    end
  end
end
