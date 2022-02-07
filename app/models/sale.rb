class Sale < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :product, optional: true
end
