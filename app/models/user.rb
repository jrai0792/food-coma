class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
