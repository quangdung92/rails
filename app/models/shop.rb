class Shop < ActiveRecord::Base

  attr_accessible :shop_name, :shop_no
  #Relation
  has_many :locations
  has_many :genres
  has_many :publishers
  has_many :books
  #Validate
  validates :shop_no, :shop_name, :uniqueness => true
  validates :shop_no, :shop_name, :presence => true
 
end