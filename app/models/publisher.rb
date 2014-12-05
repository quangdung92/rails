class Publisher < ActiveRecord::Base
  belongs_to :shop
  has_many :books
  attr_accessible :publisher_name, :shop_id
  validates :publisher_name, :presence => true
  validates_uniqueness_of :publisher_name, scope: :shop_id
 
end
