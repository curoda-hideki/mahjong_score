class Game < ApplicationRecord
  has_many :scores, dependent: :destroy
end
