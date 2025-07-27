class Player < ApplicationRecord
  has_many :scores, dependent: :destroy
end
