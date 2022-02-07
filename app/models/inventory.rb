class Inventory < ApplicationRecord
  has_many :sales, dependent: :destroy
  has_many :products, through: :sales
  belongs_to :ticket, optional: true
end
