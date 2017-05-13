class Order < ApplicationRecord
  has_many :waffles, through: :orderwaffles
  has_many :orderwaffles
end
