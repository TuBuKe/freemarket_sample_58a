class Bigcategory < ApplicationRecord
  belongs_to :category_index
  has_many :smallcategories
end