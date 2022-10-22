class User < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :books, through: :rents

  has_many :reviews, dependent: :destroy
  has_many :books, through: :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
