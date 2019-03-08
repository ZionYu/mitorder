class Order < ApplicationRecord
  validates_presence_of :name, :email, :address
  has_and_belongs_to_many :products
end
