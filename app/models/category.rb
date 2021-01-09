class Category < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true
  validates :priority, presence: true

  scope :category_exists, ->(category) { where(name: category) }
end
