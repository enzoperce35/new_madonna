class Ticket < ApplicationRecord
  has_many :products
  has_many :inventories
end
