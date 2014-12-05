class Location < ActiveRecord::Base
  belongs_to :shop
  has_many :books
  attr_accessible :location_name, :shop_id
  validates :location_name, :presence => true
  validates_uniqueness_of :location_name, scope: :shop_id
  
end
