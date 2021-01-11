require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { FactoryBot.build(:article) }
  describe "validations" do
    it "should have a title" do
      article.title = nil
      expect(article).to_not be_valid
    end
    it "should have a body" do
      article.body = nil
      expect(article).to_not be_valid
    end
    it "should have an image" do
      article.image = nil
      expect(article).to_not be_valid
    end
  end
  describe "associations" do
    it { should belong_to(:user) }
  end

  it  'has associations' do
    should have_many(:votes)
  end
  
end
