class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories
  # has_one_attached :image
  # after_commit :set_dimensions, on: :create
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true
  validates :categories, presence: true
  validates_length_of :title, minimum: 1, too_short: 'please enter at least 1 characters'
  validates_length_of :body, minimum: 1, too_short: 'please enter at least 1 characters'

  private

  # def set_dimensions
  #   meta = ActiveStorage::Analyzer::ImageAnalyzer.new(image).metadata
  #   self.height = meta[:height] || 0
  #   self.width  = meta[:width] || 0
  #   save!
  # end
end
