class Game < ApplicationRecord
  belongs_to :categories
  belongs_to :studios
  belongs_to :platforms
end
