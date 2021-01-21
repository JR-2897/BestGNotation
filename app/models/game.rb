class Game < ApplicationRecord
  belongs_to :category
  belongs_to :studio
  belongs_to :platform
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
