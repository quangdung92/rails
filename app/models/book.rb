class Book < ActiveRecord::Base
  belongs_to :location
  belongs_to :genre
  belongs_to :shop
  belongs_to :publisher
  attr_accessible :author, :book_name, :final_purchase, :final_sale,
                  :inventory_number, :jan, :nation_sale, :price, :sale_number,
                  :publisher_id, :shop_id, :genre_id, :location_id, :publish_date

  validates :book_name, :shop_id, :location_id, :publisher_id, :presence => true

end
