class Product < ApplicationRecord
  has_many :sales, dependent: :destroy
  has_many :inventories, through: :sales
  belongs_to :ticket, optional: true
end
