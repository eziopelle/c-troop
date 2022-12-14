class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :tickets, dependent: :destroy
  has_many :markets, through: :tickets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
