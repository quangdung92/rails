class Genre < ActiveRecord::Base
  belongs_to :shop
  has_many :books
  attr_accessible :genre_name, :shop_id
  validates :genre_name, :presence => true
  validates_uniqueness_of :genre_name, scope: :shop_id
  
end
