class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :users, through: :rents

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :title, :overview, :author, :category, :content, :poster_url, :price_per_day, presence: true
end
