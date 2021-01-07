class Category < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :articles, through: :article_categories
end
