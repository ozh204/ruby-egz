class OrderWaffle < ApplicationRecord
  belongs_to :order
  belongs_to :waffle
end
