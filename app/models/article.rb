class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true
  validates :categories, presence: true
  validates_length_of :title, minimum: 1, too_short: 'please enter at least 1 characters'
  validates_length_of :body, minimum: 1, too_short: 'please enter at least 1 characters'

end
