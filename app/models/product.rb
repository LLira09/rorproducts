class Product < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates :name, :pricing, :description, presence: :true
end
