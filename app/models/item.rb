class Item < ApplicationRecord
  #アソシエーション
  belongs_to :product
  belongs_to :user
  has_one :destination
end
